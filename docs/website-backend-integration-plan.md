# Website to Backend Integration Plan

## 1. Objective

This plan defines how the website application should connect to the backend API, fetch public content, submit contact forms, and support admin-related flows where needed. The goal is to keep the website frontend simple, reliable, and easy to maintain while the backend remains the single source of truth for data, validation, and authentication.

## 2. Scope

This plan covers:

- Public website data from the backend
- Contact form submissions
- Analytics event reporting
- Optional admin authentication flows
- Environment and configuration setup
- Error handling and deployment considerations

This does not include rewriting the backend, changing the dashboard, or modifying unrelated project areas.

## 3. Architecture Overview

The platform should follow this separation of responsibilities:

- Website: presentation layer, page rendering, UI, local state
- Backend: data storage, APIs, validation, authentication, media handling, analytics
- Shared contract: API routes, request/response schemas, auth rules, error conventions

Recommended pattern:

- The website calls the backend REST API over HTTPS
- The backend owns all business rules and data validation
- The website displays data from API responses only
- All admin-only actions happen through authenticated API calls from the dashboard or a secure admin tool, not directly from the public website

## 4. API Base Configuration

Set up a single configuration module in the website for backend connection details.

Example environment variables:

```env
API_BASE_URL=https://api.example.com
API_VERSION=v1
API_TIMEOUT=10000
```

Recommended config structure:

- `apiBaseUrl`
- `apiVersion`
- `timeout`
- `publicRoutes`
- `adminRoutes`
- `authTokenStorageKey`

Keep API URLs in environment configuration rather than hard-coded in page code.

## 5. Public Content Integration

The website should consume public backend endpoints for:

- Portfolio entries
- Categories
- Technologies
- Team members
- Services
- Site settings

### Public endpoints to integrate

- `GET /api/v1/entries`
- `GET /api/v1/entries/{slug}`
- `GET /api/v1/categories`
- `GET /api/v1/technologies`
- `GET /api/v1/team-members`
- `GET /api/v1/team-members/{slug}`
- `GET /api/v1/services`
- `GET /api/v1/services/{slug}`
- `GET /api/v1/site-settings`

### Content loading strategy

- Fetch public content on page load or during static generation
- Cache responses when appropriate, but avoid stale content for published changes
- Use fallback UI states for failed requests
- Keep page rendering resilient when the API is temporarily unavailable

### Data flow

1. Website requests public data from backend
2. Backend validates query parameters and returns JSON
3. Website maps response into UI models
4. Website renders content with safe markdown-to-HTML or sanitized component rendering
5. Public-facing pages use backend content, not local static hard-coded values

## 6. Contact Form Integration

The website should submit inquiries through the backend public inquiry endpoint.

### Endpoint

- `POST /api/v1/inquiries`

### Required fields

- name
- email
- subject
- message

### Behavior

- Validate input in the frontend before submit
- Show a friendly success message regardless of internal backend handling
- Never expose sensitive internal errors to the public
- Rate-limit and abuse protection remain on the backend side

### UX requirements

- Clear loading state
- Form validation messages
- Success confirmation
- Retry option on network failure

## 7. Analytics Integration

The website should report page and interaction events to the backend analytics endpoint.

### Endpoint

- `POST /api/v1/analytics/events`

### Event patterns

- page_view
- entry_view
- contact_click

### Requirements

- Send only relative paths, no query strings
- Include entry ID only when the event is for a valid entry page
- Use backend-approved event names only
- Avoid sending user fingerprints, IP data, or full browser metadata
- Suppress duplicate events in the client when necessary

## 8. Authentication and Admin Access

The public website should not handle admin credentials directly.

Admin flows should be isolated to:

- secure dashboard app
- backend admin API calls via secure authenticated sessions
- local admin-only tooling

### Authentication endpoints

- `POST /api/v1/admin/auth/login`
- `GET /api/v1/admin/auth/me`
- `POST /api/v1/admin/auth/logout`
- `POST /api/v1/admin/auth/logout-all`
- `PUT /api/v1/admin/auth/password`

### Security rules

- Never store admin tokens in public frontend code
- Use separate secure storage for authenticated admin apps
- Public website pages must never call protected admin endpoints
- Handle expired or invalid tokens gracefully

## 9. Website Data Models

Create clear website-side models that mirror backend responses without overloading the UI.

Recommended models:

- `SiteSettings`
- `PortfolioEntry`
- `Category`
- `Technology`
- `TeamMember`
- `Service`
- `InquiryPayload`
- `AnalyticsEvent`

Keep these models deliberately lightweight and use typed DTOs or simple data classes if the website supports them.

## 10. Request and Error Handling

The website should use a consistent API client layer with:

- timeout handling
- retry policy for transient failures
- structured error mapping
- request ID support if returned by API
- loading/error states for each page

### Example handling rules

- 4xx: show user-friendly validation or auth messaging
- 5xx: show generic failure and provide retry CTA
- Network timeout: retry once and fallback gracefully
- Missing data: render empty state instead of crashing

## 11. Recommended Website Structure

Suggested website folder structure for integration:

```text
website/
  lib/
    api/
      api_client.dart
      endpoints.dart
      models/
      responses/
    services/
      site_service.dart
      entries_service.dart
      inquiry_service.dart
      analytics_service.dart
    providers/
      content_provider.dart
      inquiry_provider.dart
    pages/
      home_page.dart
      portfolio_page.dart
      about_page.dart
      contact_page.dart
```

This keeps API logic separated from page widgets and makes future backend changes easier to manage.

## 12. Implementation Phases

### Phase 1: API contract readiness

- Confirm backend routes and payload schemas
- Validate required fields and response format
- Document edge cases for content and errors

### Phase 2: API client setup

- Build API client layer
- Add config and environment variables
- Share request encoding and error handling

### Phase 3: Public content pages

- Connect home page to site settings
- Connect portfolio pages to entries and categories
- Connect team and services pages to backend data

### Phase 4: Contact and analytics

- Submit contact form to inquiry endpoint
- Send analytics events from the website
- Verify behavior in local and staging environments

### Phase 5: Hardening

- Review rate limiting, security headers, and error handling
- Validate production builds
- Ensure graceful fallback states

## 13. Security and Privacy Requirements

The website must follow these rules:

- Do not expose backend secrets or admin tokens
- Use HTTPS only in production
- Validate user input before submission
- Only call approved public endpoints
- Never trust backend responses blindly; validate shape and required fields
- Do not render raw HTML from Markdown without sanitization

## 14. Acceptance Criteria

The integration is considered complete when:

- Public pages load content from the backend API
- Contact form successfully submits to the backend
- Analytics events are accepted by the backend
- Error states are handled gracefully
- No admin credentials are exposed in the website codebase
- The website can run in local, staging, and production environments with clean configuration

## 15. Recommended Next Steps

1. Finalize backend route list and expected payloads
2. Create the website API client layer
3. Migrate static content to backend-driven data models
4. Test each public page against the API
5. Add analytics and contact form validation
6. Run production-ready smoke tests before release

## 16. Summary

The website should be treated as a consumer of a stable backend API, not as a place where business logic or data storage is duplicated. This keeps the codebase clean, reduces risk, and makes it easier to maintain and scale in the future.
