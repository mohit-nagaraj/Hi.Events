# Event Page and Checkout

## Requirements

### HE-CHECKOUT-001

**Requirement**
A visitor can view a Live event's public page and select currently available products.

**Actor**
Buyer

**Preconditions**
The event is Live and has at least one publicly available product.

**Acceptance criteria**

1. The public page presents the event's configured name, description, date, location or online designation, and branding.
2. Available products are presented with their applicable price information.
3. The buyer can select permitted quantities and continue to checkout.
4. Products that are fully hidden, not yet available, ended, or sold out are not offered as ordinarily purchasable items.

**Important variants and edge cases**
Promo-gated products may appear after a valid applicable code; recurring events require occurrence selection.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/event-page-and-checkout/customizing-the-event-page; https://hi.events/docs/help-center/tickets-and-products/adding-tickets-and-products

**Corroborating evidence**
`e2e/tests/checkout/free-checkout.spec.ts`; `e2e/tests/events/past-event-page.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-CHECKOUT-010

**Requirement**
Checkout reserves selected inventory for a configurable time and releases it when the order expires.

**Actor**
Buyer and organizer

**Preconditions**
The buyer has started an order for limited inventory.

**Acceptance criteria**

1. The organizer can configure an order timeout up to the documented maximum of 120 minutes.
2. A started order shows the buyer the remaining reservation time.
3. Completing the order before expiry preserves the purchase.
4. Failing to complete before expiry changes the order to expired and returns the reserved tickets to available inventory.

**Important variants and edge cases**
The documented default is 15 minutes and at least 15 minutes is recommended.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/event-page-and-checkout/checkout-settings

**Corroborating evidence**
`e2e/tests/checkout/order-lifecycle.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-CHECKOUT-020

**Requirement**
An organizer can choose whether checkout collects attendee identity once per order or separately for each ticket.

**Actor**
Organizer and buyer

**Preconditions**
The event has products available for checkout.

**Acceptance criteria**

1. Per-order mode collects one set of buyer details and applies it to attendees in the order.
2. Per-ticket mode collects attendee details for each selected ticket.
3. In per-ticket mode, the buyer can copy their completed details to the first attendee.
4. When allowed and multiple attendees exist, the buyer can copy their details to all attendees.
5. Copy controls remain disabled until the buyer details needed for copying are present.

**Important variants and edge cases**
Disabling copy-to-all still permits copying to the first attendee.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/event-page-and-checkout/checkout-settings

**Corroborating evidence**
`e2e/tests/checkout/per-order-details-checkout.spec.ts`; `e2e/tests/checkout/multi-ticket-checkout.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-CHECKOUT-030

**Requirement**
Checkout collects applicable required registration-question answers before order completion.

**Actor**
Buyer

**Preconditions**
The organizer has configured one or more registration questions.

**Acceptance criteria**

1. Applicable order-level questions are shown once for the order.
2. Applicable attendee-level questions are shown for the relevant attendees or products.
3. Required questions block completion until valid answers are supplied.
4. Optional questions can be left unanswered.
5. Submitted answers are available to the organizer with the associated order or attendee.

**Important variants and edge cases**
Questions may be restricted to selected products and use different documented answer types.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/managing-events/registration-questions

**Corroborating evidence**
`e2e/tests/management/questions.spec.ts`; `e2e/tests/checkout/checkout-questions.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-CHECKOUT-040

**Requirement**
An organizer can display a custom notice before checkout and additional information after successful completion.

**Actor**
Organizer and buyer

**Preconditions**
The organizer has configured one or both checkout messages.

**Acceptance criteria**

1. A configured pre-checkout message is shown before the buyer submits checkout information.
2. A configured post-checkout message is shown on the successfully completed order summary.
3. The post-checkout message appears in the completed order confirmation email.
4. The post-checkout message is not shown while an order is still awaiting payment.

**Important variants and edge cases**
The product does not treat the pre-checkout notice as an independently documented legal-consent mechanism.

**Evidence status**
Documented

**Primary sources**
https://hi.events/docs/help-center/event-page-and-checkout/checkout-settings

**Corroborating evidence**
None identified as an isolated E2E boundary test

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-CHECKOUT-050

**Requirement**
An organizer can show buyers an optional marketing-consent control during checkout.

**Actor**
Buyer and organizer

**Preconditions**
The event's marketing opt-in setting is enabled.

**Acceptance criteria**

1. Checkout displays a marketing opt-in checkbox.
2. The buyer can complete checkout without opting in.
3. The buyer's selection is recorded with the checkout information.
4. Disabling the setting removes the checkbox from checkout.

**Important variants and edge cases**
The setting is documented as enabled by default; legal sufficiency depends on the organizer's jurisdiction and wording.

**Evidence status**
Documented

**Primary sources**
https://hi.events/docs/help-center/event-page-and-checkout/checkout-settings

**Corroborating evidence**
None identified as an isolated E2E boundary test

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-CHECKOUT-060

**Requirement**
A buyer can complete an order containing only free products without using a payment processor.

**Actor**
Buyer

**Preconditions**
All selected products and applicable charges produce a zero total.

**Acceptance criteria**

1. Checkout does not request a card payment for the zero-total order.
2. Supplying all required order, attendee, and question information completes the order.
3. The buyer reaches an order-confirmation or summary surface.
4. Ticket or order confirmation delivery is initiated.

**Important variants and edge cases**
Taxes, fees, donations, or paid add-ons can make an otherwise free selection non-zero.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/getting-started/quick-start-cloud; repository `README.md`

**Corroborating evidence**
`e2e/tests/checkout/free-checkout.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-CHECKOUT-070

**Requirement**
When offline payment is enabled, a buyer can place an order using the organizer's offline-payment instructions.

**Actor**
Buyer and organizer

**Preconditions**
Offline payments are enabled for the event.

**Acceptance criteria**

1. Checkout offers the configured offline-payment method.
2. The buyer is shown the organizer's payment instructions.
3. Completing checkout creates an order awaiting offline payment rather than a confirmed online card charge.
4. Access to completion-only information remains restricted until the organizer marks payment received where documented.

**Important variants and edge cases**
The organizer may configure whether check-in is allowed before payment.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/payments-and-billing/offline-payments

**Corroborating evidence**
`e2e/tests/checkout/offline-payment.spec.ts`; `e2e/tests/management/orders-offline.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-CHECKOUT-080

**Requirement**
When supported Stripe payment setup is active, a buyer can submit card payment for a paid order and retry after a declined card.

**Actor**
Buyer

**Preconditions**
The event has a paid total and the deployment has an approved Stripe connection and test or production configuration.

**Acceptance criteria**

1. Checkout presents Stripe payment collection for the paid order.
2. A successful payment completes the order and leads to confirmation.
3. A declined card leaves the buyer able to correct or retry payment rather than reporting a completed order.
4. A later successful retry completes the same checkout flow without requiring the organizer to recreate the event.

**Important variants and edge cases**
Cloud uses organizer-level Stripe connections; self-hosted installations use deployment-level Stripe configuration. Payment was not exercised while preparing this snapshot.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/payments-and-billing/connecting-stripe; https://hi.events/docs/getting-started

**Corroborating evidence**
`e2e/tests/checkout/stripe-checkout.spec.ts`; `e2e/tests/checkout/stripe-decline-retry.spec.ts` (conditionally enabled with Stripe test credentials)

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
