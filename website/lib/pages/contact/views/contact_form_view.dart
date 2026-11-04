import 'dart:convert';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:http/http.dart' as http;

import '../../../core/utils/app_constants.dart';

@client
class ContactFormView extends StatefulComponent {
  @override
  State createState() => ContactFormViewState();
}

class ContactFormViewState extends State<ContactFormView> {
  String name = "", email = "", subject = "", message = "";
  bool isLoading = false, isSucceed = false;
  bool hasAttemptedSubmit = false;
  Map<String, String> errors = {};
  String? error;

  Component _fieldError(String field) {
    return div(
      classes: "mt-1.5 flex items-start gap-1.5 text-error font-body-sm text-body-sm",
      attributes: {"role": "alert"},
      [
        span(
          classes: "material-symbols-outlined text-[16px] leading-[18px] shrink-0",
          [.text("error")],
        ),
        span([.text(errors[field] ?? "")]),
      ],
    );
  }

  bool _validateFields({bool normalizeValues = false}) {
    final validationErrors = <String, String>{};
    final trimmedName = name.trim();
    final trimmedEmail = email.trim();
    final trimmedSubject = subject.trim();
    final trimmedMessage = message.trim();

    if (trimmedName.isEmpty) {
      validationErrors["name"] = "Please enter your name.";
    } else if (trimmedName.length > 120) {
      validationErrors["name"] = "Your name must be 120 characters or fewer.";
    }

    if (trimmedEmail.isEmpty) {
      validationErrors["email"] = "Please enter your email address.";
    } else if (!RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$").hasMatch(trimmedEmail)) {
      validationErrors["email"] = "Please enter a valid email address.";
    } else if (trimmedEmail.length > 254) {
      validationErrors["email"] = "Your email must be 254 characters or fewer.";
    }

    if (trimmedSubject.isEmpty) {
      validationErrors["subject"] = "Please enter a subject.";
    } else if (trimmedSubject.length > 180) {
      validationErrors["subject"] = "The subject must be 180 characters or fewer.";
    }

    if (trimmedMessage.isEmpty) {
      validationErrors["message"] = "Please tell us about your project.";
    } else if (trimmedMessage.length > 10000) {
      validationErrors["message"] = "The message must be 10,000 characters or fewer.";
    }

    if (normalizeValues) {
      name = trimmedName;
      email = trimmedEmail;
      subject = trimmedSubject;
      message = trimmedMessage;
    }
    errors = validationErrors;
    error = null;
    isSucceed = false;

    return validationErrors.isEmpty;
  }

  void _revalidateAfterInput() {
    if (!hasAttemptedSubmit) return;

    _validateFields();
    if (mounted) setState(() {});
  }

  Future<void> _sendInquiry() async {
    hasAttemptedSubmit = true;
    if (!_validateFields(normalizeValues: true)) {
      if (mounted) setState(() {});
      return;
    }

    try {
      isLoading = true;
      isSucceed = false;
      errors = {};
      error = null;
      setState(() {});
      http.Response res = await http.post(
        Uri.parse(AppConstants.inquiries),
        headers: {"Content-Type": "application/json", "Accept": "application/json"},
        body: jsonEncode({
          "name": name,
          "email": email,
          "subject": subject,
          "message": message,
          "website": "",
        }),
      );
      if (res.statusCode == 201) {
        isSucceed = true;
        name = "";
        email = "";
        subject = "";
        message = "";
      } else if (res.statusCode == 422) {
        final Map<String, dynamic> body = jsonDecode(res.body);
        error = body["message"];

        final responseErrors = body["errors"] as Map<String, dynamic>;
        responseErrors.forEach((field, messages) {
          errors[field] = (messages as List<dynamic>).join("\n");
        });
      } else if (res.statusCode == 429) {
        error = "Too many requests. Please wait a moment and try again.";
      } else {
        error = "We couldn't send your inquiry. Please try again shortly.";
      }
    } catch (_) {
      error = "We couldn't reach the server. Check your connection and try again.";
    } finally {
      isLoading = false;
      if (mounted) setState(() {});
    }
  }

  @override
  Component build(BuildContext context) {
    return section(
      classes: "max-w-7xl mx-auto px-6 sm:px-8 pb-24 w-full",
      [
        div(
          classes: "grid grid-cols-1 lg:grid-cols-12 gap-8 items-start",
          [
            div(
              classes:
                  "lg:col-span-12 bg-surface-container-low/90 backdrop-blur-md rounded-xl border border-outline-variant/40 p-6 md:p-8 shadow-xl relative",
              [
                div(
                  classes:
                      "absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-primary/30 to-transparent",
                  [],
                ),
                div(
                  id: "project-inquiry-form",
                  classes: "space-y-6",
                  [
                    div(
                      classes: "grid grid-cols-1 sm:grid-cols-2 gap-5",
                      [
                        div(
                          classes: "flex flex-col gap-2",
                          [
                            label(
                              classes:
                                  "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                              attributes: {
                                "for": "contact-name",
                              },
                              [
                                span(
                                  [
                                    .text("Your Name"),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes: "relative",
                              [
                                input<String>(
                                  id: "contact-name",
                                  classes:
                                      "w-full h-11 px-3.5 rounded-lg bg-surface-container-lowest border ${errors["name"] != null ? "border-error/70 focus:border-error focus:ring-error" : "border-outline-variant/50 focus:border-primary focus:ring-primary"} text-on-surface placeholder:text-outline/70 font-body-md text-body-md focus:outline-none focus:ring-1 transition-all",
                                  type: .text,
                                  value: name,
                                  onInput: (value) {
                                    name = value;
                                    _revalidateAfterInput();
                                  },
                                  attributes: {
                                    "placeholder": "e.g., Alex Morgan",
                                    "required": "",
                                  },
                                ),
                                if (errors["name"] != null) _fieldError("name"),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "flex flex-col gap-2",
                          [
                            label(
                              classes:
                                  "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                              attributes: {
                                "for": "contact-email",
                              },
                              [
                                span(
                                  [
                                    .text("Work Email"),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes: "relative",
                              [
                                input<String>(
                                  id: "contact-email",
                                  classes:
                                      "w-full h-11 px-3.5 rounded-lg bg-surface-container-lowest border ${errors["email"] != null ? "border-error/70 focus:border-error focus:ring-error" : "border-outline-variant/50 focus:border-primary focus:ring-primary"} text-on-surface placeholder:text-outline/70 font-body-md text-body-md focus:outline-none focus:ring-1 transition-all",
                                  type: .email,
                                  value: email,
                                  onInput: (value) {
                                    email = value;
                                    _revalidateAfterInput();
                                  },
                                  attributes: {
                                    "placeholder": "alex@company.com",
                                    "required": "",
                                  },
                                ),
                                if (errors["email"] != null) _fieldError("email"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    div(
                      classes: "flex flex-col gap-2",
                      [
                        label(
                          classes:
                              "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                          attributes: {
                            "for": "contact-subject",
                          },
                          [
                            span(
                              [
                                .text("Subject"),
                              ],
                            ),
                          ],
                        ),
                        input<String>(
                          id: "contact-subject",
                          classes:
                              "w-full h-11 px-3.5 rounded-lg bg-surface-container-lowest border ${errors["subject"] != null ? "border-error/70 focus:border-error focus:ring-error" : "border-outline-variant/50 focus:border-primary focus:ring-primary"} text-on-surface placeholder:text-outline/70 font-body-md text-body-md focus:outline-none focus:ring-1 transition-all",
                          type: .text,
                          value: subject,
                          onInput: (value) {
                            subject = value;
                            _revalidateAfterInput();
                          },
                          attributes: {"placeholder": "Acme Studio or stealth startup", "required": ""},
                        ),
                        if (errors["subject"] != null) _fieldError("subject"),
                      ],
                    ),
                    div(
                      classes: "flex flex-col gap-2",
                      [
                        label(
                          classes:
                              "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                          attributes: {
                            "for": "contact-message",
                          },
                          [
                            span(
                              [
                                .text("Tell us about your project"),
                              ],
                            ),
                          ],
                        ),
                        textarea(
                          id: "contact-message",
                          classes:
                              "w-full p-3.5 rounded-lg bg-surface-container-lowest border ${errors["message"] != null ? "border-error/70 focus:border-error focus:ring-error" : "border-outline-variant/50 focus:border-primary focus:ring-primary"} text-on-surface placeholder:text-outline/70 font-body-md text-body-md focus:outline-none focus:ring-1 transition-all resize-y leading-relaxed",
                          name: "message",
                          onInput: (value) {
                            message = value;
                            _revalidateAfterInput();
                          },
                          required: true,
                          rows: 5,
                          placeholder:
                              "Describe your idea, timeline, or current challenges. Tell us what you're trying to build...",
                          [],
                        ),
                        if (errors["message"] != null) _fieldError("message"),
                      ],
                    ),
                    if (error != null)
                      div(
                        classes:
                            "p-4 rounded-lg bg-error-container/20 border border-error/40 text-on-error-container flex items-start gap-3",
                        attributes: {"role": "alert"},
                        [
                          span(
                            classes: "material-symbols-outlined text-error text-[20px] mt-0.5 shrink-0",
                            [.text("error")],
                          ),
                          div(
                            classes: "min-w-0",
                            [
                              p(
                                classes: "font-medium text-on-error-container font-body-sm text-body-sm",
                                [.text("Unable to send inquiry")],
                              ),
                              p(
                                classes: "text-on-error-container/90 font-body-sm text-body-sm mt-0.5",
                                [.text(error!)],
                              ),
                            ],
                          ),
                        ],
                      ),
                    div(
                      classes: "pt-2 flex flex-col sm:flex-row items-center justify-between gap-4",
                      [
                        button(
                          id: "submit-btn",
                          // Disable the button natively and visually when loading
                          onClick: isLoading ? null : _sendInquiry,
                          classes:
                              "w-full sm:w-auto inline-flex items-center justify-center gap-2.5 h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-headline-sm text-headline-sm font-medium hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.25)] hover:shadow-[0_0_20px_rgba(77,142,255,0.45)] cursor-pointer group ${isLoading ? 'opacity-70 pointer-events-none cursor-not-allowed' : ''}",
                          [
                            if (isLoading) ...[
                              // Loading State Spinner + Text
                              span(
                                classes: "material-symbols-outlined text-[18px] animate-spin",
                                [
                                  .text("progress_activity"),
                                ],
                              ),
                              span(
                                [
                                  .text("Sending..."),
                                ],
                              ),
                            ] else ...[
                              // Normal State
                              span(
                                [
                                  .text("Send Inquiry"),
                                ],
                              ),
                              span(
                                classes:
                                    "material-symbols-outlined text-[18px] group-hover:translate-x-1 transition-transform",
                                [
                                  .text("arrow_forward"),
                                ],
                              ),
                            ],
                          ],
                        ),
                        // button(
                        //   id: "submit-btn",
                        //   // type: .submit,
                        //   onClick: _sendInquiry,
                        //   classes:
                        //       "w-full sm:w-auto inline-flex items-center justify-center gap-2.5 h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-headline-sm text-headline-sm font-medium hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.25)] hover:shadow-[0_0_20px_rgba(77,142,255,0.45)] cursor-pointer group",
                        //   [
                        //     span(
                        //       [
                        //         .text("Send Inquiry"),
                        //       ],
                        //     ),
                        //     span(
                        //       classes:
                        //           "material-symbols-outlined text-[18px] group-hover:translate-x-1 transition-transform",
                        //       [
                        //         .text("arrow_forward"),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        div(
                          classes:
                              "flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                          [
                            span(
                              classes: "material-symbols-outlined text-outline text-[16px]",
                              [
                                .text("lock"),
                              ],
                            ),
                            span(
                              [
                                .text("Your project details remain confidential"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (isSucceed)
                      div(
                        id: "form-feedback",
                        classes:
                            " p-4 rounded-lg bg-surface-container-high border border-secondary/40 text-on-surface flex items-start gap-3",
                        [
                          span(
                            classes: "material-symbols-outlined text-secondary text-[20px] mt-0.5",
                            [
                              .text("check_circle"),
                            ],
                          ),
                          div(
                            classes: "text-body-sm font-body-sm",
                            [
                              p(
                                classes: "font-medium text-on-surface",
                                [
                                  .text(" Inquiry dispatched to our lead engineering room. "),
                                ],
                              ),
                              p(
                                classes: "text-on-surface-variant mt-0.5",
                                [
                                  .text(
                                    " We will review your notes and reply directly to your work email. ",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
