import 'dart:js_interop';

// ignore: depend_on_referenced_packages
import 'package:universal_web/web.dart' as web;

void scheduleBrowserInteractions() {
  web.window.setTimeout(_initialize.toJS, 0.toJS);
}

void _initialize() {
  _initializeMobileMenu();
  _initializeFooterYear();
  _initializeContactForm();
}

void _initializeMobileMenu() {
  final header = web.document.querySelector('header');
  final headerRow = header?.firstElementChild;
  final desktopNav = header?.querySelector('nav');
  final actions = headerRow?.lastElementChild;
  if (header == null || headerRow == null || desktopNav == null || actions == null) return;
  if (web.document.querySelector('.site-menu-button') != null) return;

  final currentPath = web.window.location.pathname.replaceFirst(RegExp(r'/$'), '');
  final routes = <String, String>{
    'Home': '/',
    'Services': '/services',
    'Projects': '/projects',
    'About': '/about',
    'Contact': '/contact',
  };

  final menuButton = web.document.createElement('button') as web.HTMLButtonElement
    ..type = 'button'
    ..className = 'site-menu-button'
    ..setAttribute('aria-label', 'Open navigation menu')
    ..setAttribute('aria-expanded', 'false')
    ..setAttribute('aria-controls', 'mobile-navigation')
    ..innerHTML = '<span class="material-symbols-outlined" aria-hidden="true">menu</span>'.toJS;

  final mobileNav = web.document.createElement('nav') as web.HTMLElement
    ..id = 'mobile-navigation'
    ..className = 'site-mobile-nav'
    ..setAttribute('data-open', 'false');

  for (final route in routes.entries) {
    final link = web.document.createElement('a') as web.HTMLAnchorElement
      ..href = route.value
      ..textContent = route.key;
    if (route.value == (currentPath.isEmpty ? '/' : currentPath)) {
      link.setAttribute('aria-current', 'page');
    }
    mobileNav.appendChild(link);
  }

  void closeMenu() {
    mobileNav.setAttribute('data-open', 'false');
    menuButton
      ..setAttribute('aria-expanded', 'false')
      ..setAttribute('aria-label', 'Open navigation menu');
    menuButton.querySelector('span')?.textContent = 'menu';
    web.document.body?.classList.remove('site-menu-open');
  }

  menuButton.addEventListener(
    'click',
    ((web.Event event) {
      if (mobileNav.getAttribute('data-open') == 'true') {
        closeMenu();
      } else {
        mobileNav.setAttribute('data-open', 'true');
        menuButton
          ..setAttribute('aria-expanded', 'true')
          ..setAttribute('aria-label', 'Close navigation menu');
        menuButton.querySelector('span')?.textContent = 'close';
        web.document.body?.classList.add('site-menu-open');
      }
    }).toJS,
  );
  web.document.addEventListener(
    'keydown',
    ((web.Event event) {
      if ((event as web.KeyboardEvent).key == 'Escape') closeMenu();
    }).toJS,
  );
  web.window.addEventListener(
    'resize',
    ((web.Event event) {
      if (web.window.innerWidth >= 768) closeMenu();
    }).toJS,
  );

  actions.appendChild(menuButton);
  header.appendChild(mobileNav);
}

void _initializeFooterYear() {
  final paragraphs = web.document.querySelectorAll('footer p');
  for (var index = 0; index < paragraphs.length; index++) {
    final paragraph = paragraphs.item(index);
    if (paragraph?.textContent?.contains('Brothers-Tech Studio. All rights reserved.') ?? false) {
      paragraph!.textContent = '© ${DateTime.now().year} Brothers-Tech Studio. All rights reserved.';
    }
  }
}

void _initializeContactForm() {
  final pills = web.document.querySelectorAll('.scope-pill');
  for (var index = 0; index < pills.length; index++) {
    final pill = pills.item(index) as web.Element?;
    pill?.addEventListener(
      'click',
      ((web.Event event) {
        final selected = pill.getAttribute('data-selected') == 'true';
        final icon = pill.querySelector('.scope-icon');
        pill.setAttribute('data-selected', selected ? 'false' : 'true');
        _toggleClasses(
          pill,
          remove: selected ? _selectedPillClasses : _idlePillClasses,
          add: selected ? _idlePillClasses : _selectedPillClasses,
        );
        if (icon != null) {
          _toggleClasses(
            icon,
            remove: selected ? _selectedIconClasses : _idleIconClasses,
            add: selected ? _idleIconClasses : _selectedIconClasses,
          );
        }
      }).toJS,
    );
  }

  final form = web.document.querySelector('#project-inquiry-form');
  final submitButton = web.document.querySelector('#submit-btn') as web.HTMLButtonElement?;
  final feedback = web.document.querySelector('#form-feedback');
  form?.addEventListener(
    'submit',
    ((web.Event event) {
      event.preventDefault();
      if (submitButton != null) {
        submitButton
          ..disabled = true
          ..classList.add('opacity-70')
          ..classList.add('pointer-events-none')
          ..innerHTML =
              '<span class="material-symbols-outlined text-[18px] animate-spin">refresh</span><span>Processing...</span>'
                  .toJS;
      }
      web.window.setTimeout(
        (() {
          if (submitButton != null) {
            submitButton.innerHTML =
                '<span class="material-symbols-outlined text-[18px]">done</span><span>Inquiry Received</span>'.toJS;
          }
          feedback?.classList.remove('hidden');
        }).toJS,
        600.toJS,
      );
    }).toJS,
  );
}

void _toggleClasses(web.Element element, {required List<String> remove, required List<String> add}) {
  for (final className in remove) {
    element.classList.remove(className);
  }
  for (final className in add) {
    element.classList.add(className);
  }
}

const _idlePillClasses = [
  'bg-surface-container-lowest',
  'border-outline-variant/50',
  'text-on-surface-variant',
];
const _selectedPillClasses = [
  'bg-primary/10',
  'border-primary',
  'text-primary',
  'shadow-[0_0_12px_rgba(77,142,255,0.2)]',
];
const _idleIconClasses = ['opacity-0', 'text-outline'];
const _selectedIconClasses = ['opacity-100', 'text-primary'];
