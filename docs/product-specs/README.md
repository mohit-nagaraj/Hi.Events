# Hi.Events Product Behavior Snapshot

> A version-controlled consolidation of existing public Hi.Events product behavior, prepared against commit `0497418d5c66d20693751e68be066260eda3f37f` with explicit source provenance and uncertainty.

## Purpose and scope

This collection is a product-documentation snapshot compiled from official Hi.Events help-center pages and product-facing repository material. It describes user-visible intent for organizers, team members, buyers, attendees, administrators, and API clients. It is not an original upstream product requirements document and does not describe internal architecture.

- **Reviewed product commit:** `0497418d5c66d20693751e68be066260eda3f37f`
- **Snapshot prepared:** 2026-09-06
- **Documentation source:** public Hi.Events material retrieved on 2026-09-06
- **Repository:** `https://github.com/mohit-nagaraj/Hi.Events`

The reviewed product commit is the behavior baseline. The commit that adds this documentation necessarily comes after that baseline.

## Evidence model

| Classification | Meaning |
|---|---|
| Documented intent | A user-facing Hi.Events source states the behavior. |
| Corroborated current behavior | Documented intent also has a relevant automated E2E specification at the reviewed commit. Corroboration means the executable specification exists; it does not imply it was run while preparing this snapshot. |
| Undocumented observed behavior | A test or product surface indicates behavior for which no product-facing source was found. It is not treated as confirmed intent. |
| Unresolved conflict | Product-facing documentation and executable evidence disagree, or version alignment cannot be established. The documented intent is preserved. |

Source code, routes, and E2E tests are never used alone to turn implementation behavior into confirmed product intent. Conditional payment tests are not described as exercised payment verification.

## Requirement identifiers

Detailed requirements use stable domain-prefixed IDs such as `HE-EVENT-020`. IDs are unique within this snapshot and intentionally leave numeric gaps so later requirements can be added without renumbering existing entries. Each ID appears once in a domain document and once in the compact catalog.

Every detailed requirement names its primary product-facing source, optional corroborating evidence, evidence status, and reviewed commit. Full source metadata and trust notes are in [source-register.md](source-register.md).

## Domain index

| Document | Scope |
|---|---|
| [product-overview.md](product-overview.md) | Actors, product modes, and capability boundaries |
| [identity-and-account-access.md](identity-and-account-access.md) | Registration, email verification, and account deletion |
| [organizers-teams-and-permissions.md](organizers-teams-and-permissions.md) | Organizer defaults, public identity, invitations, and roles |
| [event-creation-and-configuration.md](event-creation-and-configuration.md) | Event creation, publication, location, online events, duplication, and presentation |
| [tickets-products-pricing-and-capacity.md](tickets-products-pricing-and-capacity.md) | Tickets, products, pricing, access, categories, capacity, taxes, and fees |
| [event-page-and-checkout.md](event-page-and-checkout.md) | Public selection, checkout data, timeout, notices, consent, and payment paths |
| [orders-payments-refunds-and-invoicing.md](orders-payments-refunds-and-invoicing.md) | Order management, cancellation, refunds, invoicing, and offline payment |
| [attendees-tickets-and-check-in.md](attendees-tickets-and-check-in.md) | Attendees, ticket delivery, self-service, check-in lists, and check-in |
| [promotions-affiliates-and-waitlists.md](promotions-affiliates-and-waitlists.md) | Promo codes, affiliate attribution, and sold-out waitlists |
| [communication-and-email.md](communication-and-email.md) | Attendee messaging and email templates |
| [reporting-and-analytics.md](reporting-and-analytics.md) | Event and organizer reporting |
| [integrations-widgets-webhooks-and-api.md](integrations-widgets-webhooks-and-api.md) | Widget, webhooks, and documented API availability |
| [recurring-and-multi-date-events.md](recurring-and-multi-date-events.md) | Schedules, occurrence selection, overrides, and cancellation |
| [requirement-catalog.md](requirement-catalog.md) | One-row-per-requirement index |
| [source-register.md](source-register.md) | Source provenance and trust notes |
| [open-questions-and-conflicts.md](open-questions-and-conflicts.md) | Gaps, unconfirmed observations, and verification limits |

## Exclusions and insufficiently documented areas

Platform administration has no standalone specification because no user-facing official source was found for its account oversight, configuration, announcement, impersonation, message-review, or attribution-reporting surfaces. Those observations are recorded as unconfirmed. Login mechanics, password recovery, profile editing, detailed REST API endpoint contracts, buyer-initiated refunds, and several bulk occurrence operations are also not promoted to requirements without stronger product-facing evidence.

Live help-center pages do not expose an immutable revision tied to the reviewed repository commit. This version-alignment limitation applies to every web source and is tracked in [open-questions-and-conflicts.md](open-questions-and-conflicts.md).
