# Brothers-Tech website

The Brothers-Tech portfolio rebuilt as a statically generated Jaspr application.

The page structure is made from Dart/Jaspr components, custom styles use Jaspr
`StyleRule` objects, and all browser interactions are implemented in Dart. The
`web/` directory contains only public images and favicons.

## Run locally

```sh
jaspr serve
```

The development server is available at `http://localhost:8080`.

## Production build

```sh
jaspr build
```

The generated site is written to `build/jaspr/`.

## Regenerating the converted components

The conversion utilities read the original sibling project and emit Dart source:

```sh
dart run tool/import_legacy_pages.dart
dart run tool/import_tailwind_theme.dart
dart format lib/components/generated lib/styles/tailwind_theme.g.dart
```

The application never reads or renders the original HTML at runtime.
