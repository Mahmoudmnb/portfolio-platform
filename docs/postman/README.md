# Portfolio Platform Postman collection

Import both files into Postman:

- [API collection](portfolio-platform.postman_collection.json)
- [Local environment template](local.postman_environment.json)

Select **Portfolio Platform — Local template** as the active environment. Set `base_url` to your running API, including `/api/v1` and without a trailing slash (default `http://localhost:8000/api/v1`). Set `email` and `password` locally for an existing enabled owner. Owner creation and server setup are in [development](../development.md); this collection does not create an administrator.

Send **Authentication → POST /admin/auth/login**. Its script saves the returned `data.token` as the environment's `token`; protected requests inherit Bearer authentication. Public requests and login explicitly use no authentication. Credentials are JSON-escaped before login/password requests. Logout, logout-all and a successful password change clear the saved token. Password changes use separate `current_password` and `new_password` variables and require a fresh login afterward; the login password variable is not automatically changed.

Send requests individually. This is a reference collection containing all 58 contract operations, including permanent deletion, full site-settings replacement and token revocation; running every folder in sequence is not a smoke test. Bodies contain fictional examples. Entry creation defaults to draft, and team/service creation defaults to inactive. Edit settings before sending PUT. Publishing entries or activating team members requires ready uploaded media as described in the [integration guide](../api-integration.md).

Successful admin create/upload requests save their resource's ID and, when returned, slug. Detail/update/delete requests use `entry_id`, `category_id`, `technology_id`, `team_member_id`, `service_id`, `media_id` and `inquiry_id`. Set an ID manually to use an existing record. Public detail requests use `entry_slug`, `team_member_slug` and `service_slug`; draft/inactive resources return 404 publicly. Inquiry submission intentionally returns no ID: obtain `inquiry_id` from the authenticated inquiry list.

Query parameters are present but disabled by default. Enable the filters you need in **Params** and supply values. Query booleans use `0`/`1`; JSON bodies use `true`/`false`. Date ranges use inclusive UTC `YYYY-MM-DD` dates, at most 90 days and no future dates; disabled dates use server defaults. Each request checks its documented success status; intentionally invalid requests will fail that assertion.

For **Media → POST /admin/media**, select a local JPEG, PNG or WebP in **Body → form-data → file**. Postman supplies the multipart boundary. The upload script saves `media_id`; send GET `/admin/media/{id}` until status is `ready` or `failed` before referencing it. A working queue worker is required. There is no automatic polling or automatic retry.

The tracked environment has blank credentials, passwords, tokens and resource IDs. Keep filled values local in Postman; exported copies can contain secrets. If saving a filled environment in this directory, use a name ending in `.local.json` (ignored by Git). Postman's [environment variable documentation](https://learning.postman.com/docs/use/send-requests/variables/environment-variables) describes editing variables and script updates.

Regenerate the collection and reset the environment template from the unchanged [OpenAPI contract](../openapi.yaml):

```sh
python3 scripts/generate-postman.py
```

Verification: JSON parsing, exact coverage of 58 method/path pairs, public/protected authentication, query parameters, request-body field coverage and reproducible generation were checked locally. JavaScript scripts were exercised with simulated Postman responses, including login capture, created IDs/slugs, token clearing and credentials containing quotes/backslashes. No authenticated live requests or Postman desktop import were executed for this addition.
