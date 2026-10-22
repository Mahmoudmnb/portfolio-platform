#!/usr/bin/env python3
"""Generate the Postman v2.1 collection from the unchanged OpenAPI contract."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = json.loads((ROOT / 'docs/openapi.yaml').read_text())
DEST = ROOT / 'docs/postman'
RESOURCE = {'entries': 'entry', 'categories': 'category', 'technologies': 'technology',
            'team-members': 'team_member', 'services': 'service', 'media': 'media',
            'inquiries': 'inquiry'}
BODIES = {
    'Login': {'email': '{{login_email_json}}', 'password': '{{login_password_json}}', 'device_name': 'Postman'},
    'PasswordUpdate': {'current_password': '{{current_password_json}}', 'password': '{{new_password_json}}', 'password_confirmation': '{{new_password_json}}'},
    'EntryCreate': {'kind': 'project', 'title': 'Postman draft project', 'summary': 'Fictional API example.', 'description': 'Created manually in Postman.', 'status': 'draft', 'featured': False},
    'EntryPatch': {'summary': 'Updated fictional summary.'},
    'CategoryCreate': {'name': 'Postman category', 'description': 'Fictional category.'},
    'CategoryPatch': {'description': 'Updated fictional category.'},
    'TechnologyCreate': {'name': 'Postman technology', 'website_url': 'https://example.test'},
    'TechnologyPatch': {'website_url': None},
    'TeamMemberCreate': {'name': 'Fictional Member', 'role_title': 'Developer', 'bio': 'Fictional biography.', 'is_active': False},
    'TeamMemberPatch': {'role_title': 'Updated role'},
    'ServiceCreate': {'title': 'Postman service', 'summary': 'Fictional service.', 'description': 'Fictional description.', 'is_active': False},
    'ServicePatch': {'summary': 'Updated fictional service.'},
    'SettingsCreate': {'site_title': 'Fictional Portfolio', 'tagline': 'Fictional tagline', 'introduction': 'Fictional introduction.', 'contact_email': 'owner@example.test', 'availability': 'available', 'default_seo_title': 'Fictional Portfolio', 'default_seo_description': 'Fictional portfolio description.', 'social_links': []},
    'InquiryCreate': {'name': 'Fictional Visitor', 'email': 'visitor@example.test', 'subject': 'Postman example', 'message': 'A fictional example inquiry.', 'website': ''},
    'InquiryUpdate': {'status': 'read', 'internal_note': 'Reviewed manually in Postman.'},
    'Event': {'event_name': 'page_view', 'path': '/about'},
}


def event(kind, lines):
    return {'listen': kind, 'script': {'type': 'text/javascript', 'exec': lines}}


def generate():
    folders = {name: {'name': name, 'item': []} for name in ['Authentication', 'Public API', 'Entries', 'Categories', 'Technologies', 'Team members', 'Services', 'Site settings', 'Media', 'Inquiries', 'Audit events', 'Analytics']}
    titles = {'team-members': 'Team members', 'site-settings': 'Site settings', 'audit-events': 'Audit events'}
    for path, methods in SPEC['paths'].items():
        for method, op in methods.items():
            if method not in ('get', 'post', 'put', 'patch', 'delete'):
                continue
            parts = path.strip('/').split('/')
            resource = parts[1] if parts[0] == 'admin' else parts[0]
            prefix = RESOURCE.get(resource, resource.replace('-', '_'))
            url_path = path.replace('{id}', '{{' + prefix + '_id}}').replace('{slug}', '{{' + prefix + '_slug}}')
            queries = []
            for param in methods.get('parameters', []) + op.get('parameters', []):
                if param['in'] != 'query':
                    continue
                schema = param.get('schema', {})
                value = schema.get('default', (schema.get('enum') or [schema.get('minimum', '')])[0])
                queries.append({'key': param['name'], 'value': str(value), 'disabled': not param.get('required', False),
                                'description': param.get('description', '') or json.dumps(schema)})
            active_query = '&'.join(f"{q['key']}={q['value']}" for q in queries if not q['disabled'])
            url = {'raw': '{{base_url}}' + url_path + ('?' + active_query if active_query else ''),
                   'host': ['{{base_url}}'], 'path': url_path.strip('/').split('/')}
            if queries:
                url['query'] = queries
            description = op.get('description', op['summary'])
            if method == 'delete':
                description += '\nPermanently deletes the selected resource. Send only when intended.'
            if path == '/admin/site-settings' and method == 'put':
                description += '\nReplaces settings using fictional examples. Read current settings and edit this body before sending.'
            request = {'method': method.upper(), 'header': [{'key': 'Accept', 'value': 'application/json'}], 'url': url, 'description': description}
            public = not op.get('security', SPEC.get('security', []))
            if public:
                request['auth'] = {'type': 'noauth'}
            content = op.get('requestBody', {}).get('content', {})
            if 'application/json' in content:
                schema_name = content['application/json']['schema']['$ref'].split('/')[-1]
                raw = json.dumps(BODIES[schema_name], indent=2)
                # Credentials are serialized in a pre-request script, including quotes/backslashes.
                for key in ('login_email_json', 'login_password_json', 'current_password_json', 'new_password_json'):
                    raw = raw.replace('"{{' + key + '}}"', '{{' + key + '}}')
                request['header'].append({'key': 'Content-Type', 'value': 'application/json'})
                request['body'] = {'mode': 'raw', 'raw': raw, 'options': {'raw': {'language': 'json'}}}
            elif 'multipart/form-data' in content:
                request['body'] = {'mode': 'formdata', 'formdata': [{'key': 'file', 'type': 'file', 'src': [], 'description': 'Choose a local JPEG, PNG or WebP. Max 10 MiB, 8000px per side, 20 megapixels.'}]}
            successes = [int(code) for code in op['responses'] if code.isdigit() and 200 <= int(code) < 300]
            scripts = [f'pm.test("Expected success status", () => pm.expect(pm.response.code).to.be.oneOf({json.dumps(successes)}));']
            before = []
            if path == '/admin/auth/login':
                before = ['pm.environment.unset("token");', 'for (const key of ["email", "password"]) {', '  const value = pm.environment.get(key);', '  if (!value) throw new Error("Set " + key + " in the selected environment first.");', '  pm.variables.set("login_" + key + "_json", JSON.stringify(value));', '}']
                scripts += ['if (pm.response.code === 200) {', '  const data = pm.response.json().data;', '  pm.test("Login returns a bearer token", () => pm.expect(data.token).to.be.a("string").and.not.empty);', '  if (data.token) pm.environment.set("token", data.token);', '}']
            if path == '/admin/auth/password':
                before = ['for (const key of ["current_password", "new_password"]) {', '  const value = pm.environment.get(key);', '  if (!value) throw new Error("Set " + key + " in the selected environment first.");', '  pm.variables.set(key + "_json", JSON.stringify(value));', '}']
            if path in ('/admin/auth/logout', '/admin/auth/logout-all', '/admin/auth/password'):
                scripts += ['if (pm.response.code >= 200 && pm.response.code < 300) pm.environment.unset("token");']
            if method == 'post' and path == '/admin/' + resource and resource in RESOURCE:
                scripts += ['if (pm.response.code === 201) {', '  const data = pm.response.json().data;', f'  if (data.id) pm.environment.set("{prefix}_id", data.id);', f'  if (data.slug) pm.environment.set("{prefix}_slug", data.slug);', '}']
            item = {'name': method.upper() + ' ' + path + ' — ' + op['summary'], 'request': request, 'event': [event('test', scripts)], 'response': []}
            if before:
                item['event'].insert(0, event('prerequest', before))
            folder = 'Authentication' if resource == 'auth' else ('Public API' if public else titles.get(resource, resource.capitalize()))
            folders[folder]['item'].append(item)
    return {'info': {'name': 'Portfolio Platform API', 'schema': 'https://schema.getpostman.com/json/collection/v2.1.0/collection.json',
                     'description': 'Generated from docs/openapi.yaml. Import the local environment template and select it. Send requests individually; this reference collection includes deletion, settings replacement and token revocation. Login captures token automatically. Create requests capture resource IDs/slugs. Query filters are disabled until selected. No credentials are included.'},
            'auth': {'type': 'bearer', 'bearer': [{'key': 'token', 'value': '{{token}}', 'type': 'string'}]},
            'variable': [{'key': 'base_url', 'value': SPEC['servers'][0]['url'], 'type': 'string'}],
            'item': list(folders.values())}


def environment():
    values = {'base_url': SPEC['servers'][0]['url'], 'email': '', 'password': '', 'token': '', 'current_password': '', 'new_password': ''}
    for name in RESOURCE.values():
        values[name + '_id'] = ''
    for name in ('entry', 'team_member', 'service'):
        values[name + '_slug'] = ''
    return {'name': 'Portfolio Platform — Local template', '_postman_variable_scope': 'environment',
            'values': [{'key': key, 'value': value, 'type': 'secret' if key in ('email', 'password', 'token', 'current_password', 'new_password') else 'default', 'enabled': True} for key, value in values.items()]}


if __name__ == '__main__':
    DEST.mkdir(parents=True, exist_ok=True)
    for filename, value in [('portfolio-platform.postman_collection.json', generate()), ('local.postman_environment.json', environment())]:
        (DEST / filename).write_text(json.dumps(value, indent=2, ensure_ascii=False) + '\n')
    print('Generated collection and blank local environment from docs/openapi.yaml')
