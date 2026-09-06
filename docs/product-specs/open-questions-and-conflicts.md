# Open Questions and Conflicts

No confirmed conflict between user-facing documentation and the reviewed E2E specifications was found. The following items remain unresolved and must not be read as confirmed requirements.

## OQ-001: Live documentation revision alignment

**Status:** Version-alignment uncertainty
**Sources:** `https://hi.events/docs`; reviewed commit `0497418d5c66d20693751e68be066260eda3f37f`
**Issue:** The help center is live and mutable and exposes no immutable source revision tied to the repository commit.
**Clarification needed:** Identify the help-center content revision or repository snapshot that corresponds to the reviewed commit.

## OQ-002: Login and password behavior

**Status:** Undocumented observed capability
**Sources:** `e2e/tests/auth/password.spec.ts`; `e2e/tests/account/team-invite.spec.ts`
**Issue:** Login, password change, forgotten-password email, and reset are exercised by E2E tests but lack a dedicated product-facing source.
**Clarification needed:** Publish or identify official account-access documentation before assigning confirmed `HE-AUTH` requirements.

## OQ-003: Profile and account-level defaults

**Status:** Partially documented
**Sources:** organizer settings help article; `e2e/tests/auth/password.spec.ts`; `e2e/tests/admin/configurations.spec.ts`
**Issue:** Organizer event defaults are documented, but personal profile editing and platform-defined currency defaults are not.
**Clarification needed:** Define which defaults are user-controlled product behavior and which are deployment administration.

## OQ-004: Platform administration

**Status:** Undocumented observed capability
**Sources:** `e2e/tests/admin/account-verification.spec.ts`, `admin-dashboard.spec.ts`, `announcements.spec.ts`, `configurations.spec.ts`, `impersonation.spec.ts`, and `message-approval.spec.ts`
**Issue:** The reviewed product includes administrator-facing oversight and operational workflows, but no user-facing official documentation was found.
**Clarification needed:** Confirm the intended administrator actors, permissions, lifecycle rules, and supported deployment modes.

## OQ-005: UTM attribution administration

**Status:** Undocumented observed capability
**Sources:** files changed by reviewed commit `0497418d5c66d20693751e68be066260eda3f37f`; repository `README.md` only documents affiliate tracking at a high level
**Issue:** An administrator-facing UTM attribution report is visible in source changes but is absent from the help center and E2E suite.
**Clarification needed:** Confirm whether it is a supported product capability and document its actor, metrics, filters, and interpretation.

## OQ-006: Stripe payment verification

**Status:** Documented but not exercised in this pass
**Sources:** Stripe help article; `e2e/tests/checkout/stripe-checkout.spec.ts`; `stripe-decline-retry.spec.ts`; `management/orders-refund.spec.ts`; `e2e/README.md`
**Issue:** Stripe tests require test-mode credentials and connected-account state. They were not executed while preparing this snapshot.
**Clarification needed:** Provide an approved test account and keys to verify cloud and self-hosted variants safely.

## OQ-007: Buyer-initiated cancellations and refunds

**Status:** Undocumented
**Sources:** attendee self-service and refunds help articles
**Issue:** Self-service documents detail correction and email resend, while refunds and cancellations are documented as organizer actions.
**Clarification needed:** Confirm whether any buyer-initiated cancellation or refund workflow is intended.

## OQ-008: Top-level event cancellation and ended status

**Status:** Partially documented
**Sources:** publishing, recurring-events, and event creation articles; `e2e/tests/events/past-event-page.spec.ts`
**Issue:** Draft and Live transitions are documented, as are cancelled occurrences and past-event sales ending. A distinct top-level Cancelled or Ended event lifecycle is not clearly defined.
**Clarification needed:** Define authoritative event states and whether ended is stored state or time-derived presentation.

## OQ-009: Detailed REST API contract

**Status:** Unverified
**Sources:** repository `README.md`; generated OpenAPI availability described in repository development material
**Issue:** API availability is product-facing, but endpoint-level behavior is not documented in static user-facing material and an instance specification was not exported.
**Clarification needed:** Publish a versioned OpenAPI artifact for the reviewed product commit.

## OQ-010: Bulk occurrence editing

**Status:** Undocumented observed capability
**Sources:** `e2e/tests/management/occurrence-bulk-edit.spec.ts`
**Issue:** Bulk time, duration, capacity, label, location, cancellation, and deletion behavior is extensively exercised, while the help center primarily documents individual occurrence management.
**Clarification needed:** Document supported selection scope, partial failures, protected occurrences, and attendee-warning behavior.

## OQ-011: Check-in device behavior

**Status:** Unverified integration-dependent behavior
**Sources:** check-in help article; `e2e/tests/check-in/check-in-app.spec.ts`
**Issue:** Search, manual check-in, undo, and totals have browser corroboration. Physical-camera QR scanning and device permission failures were not exercised.
**Clarification needed:** Define supported devices, camera failure handling, and scanner limitations.

## OQ-012: Documentation candidates not used as authority

**Status:** Deliberately excluded source material
**Sources:** `backend/docs/README.md`; translated `README.<locale>.md` files; empty `FEATURES.md`
**Issue:** Backend documents explicitly identify themselves as AI-generated and potentially inaccurate; translated READMEs duplicate the product overview; `FEATURES.md` is empty.
**Clarification needed:** None for this snapshot. Use maintained user-facing documentation as the authoritative source.
