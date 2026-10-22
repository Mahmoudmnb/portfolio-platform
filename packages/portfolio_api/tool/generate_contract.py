import json,pathlib
x=json.load(open('docs/openapi.yaml'))['components']['schemas']
out=pathlib.Path('packages/portfolio_api/lib/src')
models=['Media','AdminMedia','Link','Category','Technology','TeamMember','Service','Settings','EntrySummary','EntryDetail','AdminCategory','AdminTechnology','AdminService','AdminTeamMember','AdminSettings','AdminEntry','Inquiry','AuditEvent','User','LoginResult','Totals','AnalyticsMeta','PaginationMeta']
def typ(s):
 if '$ref' in s:return s['$ref'].split('/')[-1]
 if 'anyOf' in s:return typ(s['anyOf'][0])+'?'
 t=s.get('type');nullable=isinstance(t,list) and 'null' in t
 if isinstance(t,list):t=next(a for a in t if a!='null')
 r={'string':'String','integer':'int','boolean':'bool','object':'Map<String, dynamic>'}.get(t)
 if t=='array':r='List<'+typ(s['items'])+'>'
 return (r or 'dynamic')+('?' if nullable else '')
def parse(s,v):
 t=typ(s)
 if t.endswith('?'):
  a=dict(s)
  if 'anyOf' in a:a=a['anyOf'][0]
  else:a['type']=[i for i in a['type'] if i!='null'][0]
  return f'{v} == null ? null : '+parse(a,v)
 if t.startswith('List<'):return f'({v} as List).map((v) => {parse(s["items"],"v")}).toList()'
 if '$ref' in s:return f'{t}.fromJson(Map<String, dynamic>.from({v} as Map))'
 if t=='Map<String, dynamic>':return f'Map<String, dynamic>.from({v} as Map)'
 return f'{v} as {t}'
lines=['// Generated from docs/openapi.yaml by tool/generate_contract.py.','// ignore_for_file: non_constant_identifier_names','// Response types never serve as write payloads.']
for name in models:
 s=x[name];ps={k:dict(v) for k,v in s['properties'].items()}
 for k,v in ps.items():
  if k not in s.get('required',[]):
   t=v.get('type');v['type']=[t,'null'] if isinstance(t,str) else t
 lines+=['',f'class {name} {{']
 for k,v in ps.items():lines+=[f'  final {typ(v)} {k};']
 lines += [f'  const {name}({{'+', '.join('required this.'+k for k in ps)+'});',f'  factory {name}.fromJson(Map<String, dynamic> json) => {name}(']
 for k,v in ps.items():
  expr=parse(v,"json['%s']" % k)
  lines += [f"    {k}: {expr},"]
 lines+=['  );','}']
(out/'models.dart').write_text('\n'.join(lines)+'\n')
requests=['EntryCreate','EntryPatch','CategoryCreate','CategoryPatch','TechnologyCreate','TechnologyPatch','TeamMemberCreate','TeamMemberPatch','ServiceCreate','ServicePatch','SettingsCreate','InquiryUpdate','Login','PasswordUpdate']
(out/'contract.dart').write_text('// Generated contract metadata; no response serialization.\nconst writeSchemas = <String, Map<String, dynamic>>'+json.dumps({n:x[n] for n in requests},indent=2).replace('$', '\\$')+';\n')
