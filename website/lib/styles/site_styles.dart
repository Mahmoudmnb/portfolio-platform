import 'package:jaspr/dom.dart';

final siteStyles = <StyleRule>[
  css('html').styles(
    raw: const {
      'scroll-behavior': 'smooth',
      'scrollbar-color': '#424754 #0a0e17',
      'scrollbar-width': 'thin',
    },
  ),
  css('html, body').styles(raw: const {'margin': '0', 'padding': '0'}),
  css('body').styles(raw: const {'overflow-x': 'hidden', 'overscroll-behavior': 'none'}),
  css('main > :first-child').styles(raw: const {'margin-top': '0 !important'}),
  css('main > :last-child').styles(raw: const {'margin-bottom': '0 !important'}),
  css('::-webkit-scrollbar').styles(raw: const {'width': '10px', 'height': '10px'}),
  css('::-webkit-scrollbar-track').styles(raw: const {'background': '#0a0e17'}),
  css('::-webkit-scrollbar-thumb').styles(
    raw: const {
      'min-height': '40px',
      'border': '2px solid #0a0e17',
      'border-radius': '999px',
      'background': '#424754',
    },
  ),
  css('::-webkit-scrollbar-thumb:hover').styles(raw: const {'background': '#8c909f'}),
  css(':focus-visible').styles(
    raw: const {'outline': '2px solid #4cd7f6', 'outline-offset': '3px'},
  ),
  css('header nav a[aria-current="page"]').styles(
    raw: const {'color': '#adc6ff', 'background': '#262a34', 'font-weight': '500'},
  ),
  css('.site-menu-button').styles(
    raw: const {
      'display': 'none',
      'width': '2.5rem',
      'height': '2.5rem',
      'align-items': 'center',
      'justify-content': 'center',
      'border': '1px solid rgba(255, 255, 255, 0.1)',
      'border-radius': '0.5rem',
      'color': '#dfe2ef',
      'background': '#1c1f29',
      'cursor': 'pointer',
    },
  ),
  css('.site-mobile-nav').styles(raw: const {'display': 'none'}),
  StyleRule.media(
    query: const MediaQuery.raw('(max-width: 767px)'),
    styles: [
      css('.site-menu-button').styles(raw: const {'display': 'inline-flex'}),
      css('.site-mobile-nav').styles(
        raw: const {
          'position': 'absolute',
          'top': '5rem',
          'left': '0',
          'right': '0',
          'display': 'grid',
          'gap': '0.35rem',
          'padding': '0.75rem 1.25rem 1rem',
          'border-bottom': '1px solid rgba(255, 255, 255, 0.08)',
          'background': 'rgba(15, 19, 28, 0.97)',
          'backdrop-filter': 'blur(20px)',
          'transform': 'translateY(-0.75rem)',
          'opacity': '0',
          'visibility': 'hidden',
          'pointer-events': 'none',
          'transition': 'opacity 180ms ease, transform 180ms ease, visibility 180ms ease',
        },
      ),
      css('.site-mobile-nav[data-open="true"]').styles(
        raw: const {
          'transform': 'translateY(0)',
          'opacity': '1',
          'visibility': 'visible',
          'pointer-events': 'auto',
        },
      ),
      css('.site-mobile-nav a').styles(
        raw: const {
          'padding': '0.75rem 0.875rem',
          'border-radius': '0.5rem',
          'color': '#c2c6d6',
          'font-size': '0.925rem',
          'text-decoration': 'none',
        },
      ),
      css('.site-mobile-nav a:hover, .site-mobile-nav a[aria-current="page"]').styles(
        raw: const {'color': '#adc6ff', 'background': '#262a34'},
      ),
      css('body.site-menu-open').styles(raw: const {'overflow': 'hidden'}),
    ],
  ),
  StyleRule.media(
    query: const MediaQuery.raw('(prefers-reduced-motion: reduce)'),
    styles: [
      css('html').styles(raw: const {'scroll-behavior': 'auto'}),
      css('*, *::before, *::after').styles(
        raw: const {
          'animation-duration': '0.01ms !important',
          'animation-iteration-count': '1 !important',
          'transition-duration': '0.01ms !important',
        },
      ),
    ],
  ),
];
