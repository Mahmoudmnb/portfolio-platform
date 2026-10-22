#!/usr/bin/env python3
"""Exercise the actual HTTP/worker workflow against disposable loopback data only."""
import json
import os
import struct
import time
import urllib.request
import urllib.error
import urllib.parse
import uuid
import zlib
BASE = os.environ.get('SMOKE_BASE_URL', 'http://127.0.0.1:18080/api/v1').rstrip('/')
assert os.environ.get('SMOKE_CONFIRM_DISPOSABLE') == '1', 'Set SMOKE_CONFIRM_DISPOSABLE=1 for a disposable database.'
assert urllib.parse.urlparse(BASE).hostname in {'localhost', '127.0.0.1'}, 'Smoke runs on loopback only.'
EMAIL = os.environ['SMOKE_EMAIL']
PASSWORD = os.environ['SMOKE_PASSWORD']
token = None

def call(method, path, payload=None, expected=200, multipart=None):
    headers = {'Accept': 'application/json'}
    if token:
        headers['Authorization'] = 'Bearer ' + token
    body = None
    if multipart:
        body, headers['Content-Type'] = multipart
    elif payload is not None:
        headers['Content-Type'] = 'application/json'
        body = json.dumps(payload).encode()
    request = urllib.request.Request(BASE + path, data=body, headers=headers, method=method)
    try:
        response = urllib.request.urlopen(request, timeout=15)
    except urllib.error.HTTPError as error:
        response = error
    status = response.code
    raw = response.read()
    assert status == expected, f'{method} {path}: expected {expected}, got {status}'
    assert response.headers.get('X-Request-ID'), 'Missing server request ID'
    return json.loads(raw) if raw else None

def chunk(kind, data):
    return struct.pack('!I', len(data)) + kind + data + struct.pack('!I', zlib.crc32(kind + data))

call('GET', '/ready')
login = call('POST', '/admin/auth/login', {'email': EMAIL, 'password': PASSWORD, 'device_name': 'Disposable HTTP smoke'})
token = login['data']['token']
print('Owner login passed.', flush=True)
png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('!2I5B', 2, 2, 8, 2, 0, 0, 0)) + chunk(b'IDAT', zlib.compress(b'\0\xff\0\0\0\xff\0' * 2)) + chunk(b'IEND', b'')
boundary = 'smoke' + uuid.uuid4().hex
body = ('--' + boundary + '\r\nContent-Disposition: form-data; name="file"; filename="fictional.png"\r\nContent-Type: image/png\r\n\r\n').encode() + png + ('\r\n--' + boundary + '--\r\n').encode()
media = call('POST', '/admin/media', expected=201, multipart=(body, 'multipart/form-data; boundary=' + boundary))['data']
for attempt in range(60):
    media = call('GET', '/admin/media/' + str(media['id']))['data']
    if media['status'] in {'ready', 'failed'}:
        break
    time.sleep(1)
assert media['status'] == 'ready', 'Media worker failed or did not finish.'
with urllib.request.urlopen(media['url'], timeout=15) as image_response:
    assert image_response.headers.get_content_type() == 'image/webp'
    assert image_response.read(4) == b'RIFF'
print('Upload, asynchronous processing, and public image delivery passed.', flush=True)
marker = 'smoke-' + uuid.uuid4().hex
entry = call('POST', '/admin/entries', {'kind': 'project', 'title': marker, 'summary': 'Fictional HTTP smoke', 'description': 'Fictional **Markdown**', 'cover_media_id': media['id']}, 201)['data']
entry = call('PATCH', '/admin/entries/' + str(entry['id']), {'status': 'published'})['data']
listing = call('GET', '/entries?q=' + marker)
assert listing['meta']['total'] == 1
call('GET', '/entries/' + entry['slug'])
call('POST', '/analytics/events', {'event_name': 'entry_view', 'path': '/entries/' + entry['slug'], 'entry_id': entry['id']}, 202)
stats = call('GET', '/admin/analytics/summary')
assert stats['data']['entry_view'] >= 1
call('PATCH', '/admin/entries/' + str(entry['id']), {'status': 'draft'})
call('GET', '/entries/' + entry['slug'], expected=404)
print('Publish, public list/detail, analytics, and immediate unpublish passed.', flush=True)
call('POST', '/inquiries', {'name': 'Fictional Smoke Visitor', 'email': 'visitor@example.test', 'subject': marker, 'message': 'Disposable fictional inquiry.'}, 201)
inquiries = call('GET', '/admin/inquiries')['data']
for inquiry in inquiries:
    if inquiry['subject'] == marker:
        call('DELETE', '/admin/inquiries/' + str(inquiry['id']), expected=204)
call('DELETE', '/admin/entries/' + str(entry['id']), expected=204)
call('DELETE', '/admin/media/' + str(media['id']), expected=204)
call('POST', '/admin/auth/logout', expected=204)
call('GET', '/admin/auth/me', expected=401)
print('Private inquiry persistence, cleanup, logout and token rejection passed.', flush=True)
print('HTTP smoke workflow passed.', flush=True)
