# Product Overview

## Product framing

Hi.Events is documented as an event ticketing and management product available as a managed cloud service and as self-hosted software. Organizers create and publish events, offer tickets and other products, collect registrations and payments, manage orders and attendees, communicate with attendees, operate check-in, and review reports. Buyers and attendees use public event, checkout, order-summary, ticket, and self-service surfaces.

Primary overview sources:

- https://hi.events/docs
- https://hi.events/docs/getting-started
- https://hi.events/docs/getting-started/quick-start-cloud
- https://hi.events/docs/getting-started/quick-start-self-hosted
- Repository `README.md`

## Documented actors

| Actor | Documented responsibilities or surfaces |
|---|---|
| Account owner or administrator | Creates the account, manages team membership, and controls account-level settings. |
| Organizer | Owns public identity, event defaults, payout configuration, events, and reports. |
| Team member | Uses the management dashboard within the permissions of an assigned role. |
| Buyer | Selects tickets or products, supplies order information, and completes checkout. |
| Attendee | Holds a ticket, receives event information, may use self-service, and is checked in. |
| Check-in staff member | Uses a restricted check-in list or check-in application. |
| API client or external system | Uses the documented REST API or receives webhook deliveries. |
| Platform administrator | Appears in executable administration surfaces, but public product-intent documentation was not found. |

## Deployment-mode boundary

The cloud and self-hosted offerings are documented as sharing the event-management feature set. Payment setup differs: cloud organizers connect Stripe per organizer and may be subject to platform fees, while self-hosted deployments configure a single Stripe account through deployment settings. Requirements that depend on one mode state that precondition explicitly.

## Capability map

The verified product-facing documentation supports requirements for identity onboarding, organizers and teams, event lifecycle, products and capacity, public checkout, promotions, orders and payments, attendees and check-in, communication, reporting, widgets, webhooks, API availability, and recurring events. The requirement catalog is intentionally limited to claims supported by those sources.

## Interpretation rule

Marketing summaries in `README.md` provide product scope but are not automatically atomic requirements. Help-center behavior is preferred. E2E specifications may raise confidence that a documented workflow remains represented at the reviewed commit, but they cannot establish product intent by themselves.
