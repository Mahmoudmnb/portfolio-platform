#!/usr/bin/env python3
"""Validate OpenAPI 3.1, operation inventory, and captured response fixtures."""
import json
import os
import subprocess
from pathlib import Path
from openapi_spec_validator import validate
from jsonschema import Draft202012Validator, FormatChecker
ROOT = Path(__file__).resolve().parents[1]
spec = json.loads((ROOT / 'docs/openapi.yaml').read_text())  # JSON is valid YAML 1.2.
validate(spec)
routes = json.loads(subprocess.check_output([os.environ.get('PORTFOLIO_PHP', 'php'), 'artisan', 'route:list', '--json', '--path=api/v1', '--except-vendor'], cwd=ROOT / 'backend'))
actual = {(method.lower(), '/' + route['uri'].removeprefix('api/v1/')) for route in routes for method in route['method'].split('|') if method != 'HEAD'}
documented = {(method, path) for path, operations in spec['paths'].items() for method in operations if method in {'get', 'post', 'put', 'patch', 'delete'}}
assert actual == documented, f'Route drift: undocumented={actual - documented}; absent={documented - actual}'
fixture_path = ROOT / 'backend/storage/framework/testing/contract-responses.json'
count = 0
if fixture_path.exists():
    fixtures = json.loads(fixture_path.read_text())
    for fixture in fixtures:
        response = spec['paths'][fixture['path']][fixture['method']]['responses'][str(fixture['status'])]
        if '$ref' in response:
            response = spec['components']['responses'][response['$ref'].rsplit('/', 1)[1]]
        schema = {'$schema': 'https://json-schema.org/draft/2020-12/schema', 'components': spec['components'], **response['content']['application/json']['schema']}
        Draft202012Validator(schema, format_checker=FormatChecker()).validate(fixture['body'])
        count += 1
print(f'OpenAPI 3.1 valid; {len(actual)} operations match; {count} actual response fixtures conform.')
