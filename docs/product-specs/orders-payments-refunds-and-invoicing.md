# Orders, Payments, Refunds, and Invoicing

## Requirements

### HE-ORDER-001

**Requirement**
An organizer can review successful, pending, and cancelled event orders in one management surface.

**Actor**
Organizer

**Preconditions**
The event has at least one order.

**Acceptance criteria**

1. The orders list includes orders across the documented statuses.
2. Each row exposes identifying buyer, amount, status, and order information documented for the list.
3. The organizer can open an order to inspect its products, attendees, payment, and available actions.
4. Search and filters narrow the displayed orders.
5. The organizer can export order data.

**Important variants and edge cases**
Actions differ by payment method and current order status.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/orders-and-attendees/managing-orders

**Corroborating evidence**
`e2e/tests/management/orders.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ORDER-010

**Requirement**
An organizer can cancel an eligible order and the order no longer remains an active completed purchase.

**Actor**
Organizer

**Preconditions**
The order exists and its status permits cancellation.

**Acceptance criteria**

1. The order-management surface provides cancellation for an eligible order.
2. Cancellation requires confirmation.
3. The order displays cancelled status after the action succeeds.
4. The buyer receives the documented cancellation communication.
5. Inventory and reporting reflect the cancellation according to the documented order lifecycle.

**Important variants and edge cases**
A paid order may require a refund decision as part of cancellation; cancellation availability depends on order state.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/orders-and-attendees/refunding-and-cancelling-orders; https://hi.events/docs/help-center/orders-and-attendees/managing-orders

**Corroborating evidence**
`e2e/tests/management/orders.spec.ts`; `e2e/tests/management/orders-offline.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ORDER-020

**Requirement**
An organizer can issue a full or partial refund for an eligible paid order.

**Actor**
Organizer

**Preconditions**
The order has a recorded payment and is eligible for refund.

**Acceptance criteria**

1. The order surface offers full and partial refund options when eligible.
2. A partial refund accepts an amount that does not exceed the refundable balance.
3. The order records the refund after successful processing.
4. Stripe-backed refunds can remain processing briefly rather than being reported as immediately settled.
5. Offline-payment refunds are recorded by the organizer without claiming that Hi.Events moved external funds.

**Important variants and edge cases**
Stripe refund execution requires a working integration. No live or test Stripe refund was exercised for this snapshot.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/orders-and-attendees/refunding-and-cancelling-orders

**Corroborating evidence**
`e2e/tests/management/orders-refund.spec.ts` (conditional); `e2e/tests/management/orders-offline.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ORDER-030

**Requirement**
When event invoicing is enabled, Hi.Events generates an invoice for each completed order and an order awaiting offline payment.

**Actor**
Organizer and buyer

**Preconditions**
Invoicing is enabled for the event and an order reaches a documented invoice-generating status.

**Acceptance criteria**

1. The organizer can enable invoicing per event.
2. A completed order receives an invoice.
3. An order awaiting offline payment also receives an invoice.
4. The invoice includes the documented seller, buyer, line, tax, total, and numbering information.
5. The buyer can access the invoice from the order summary.

**Important variants and edge cases**
Invoice numbering and organizer-supplied business details follow event or organizer configuration.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/orders-and-attendees/invoices-and-receipts

**Corroborating evidence**
`e2e/tests/self-service/invoice-download.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ORDER-040

**Requirement**
An organizer can mark an order awaiting offline payment as paid after receiving payment externally.

**Actor**
Organizer

**Preconditions**
The order is awaiting offline payment.

**Acceptance criteria**

1. The organizer can open the pending order and record payment received.
2. The order changes from awaiting payment to paid/completed status.
3. Completion-only attendee information becomes available as documented.
4. Reports include the order after it is marked paid.

**Important variants and edge cases**
The action records an external payment; it does not process funds through Hi.Events.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/payments-and-billing/offline-payments; https://hi.events/docs/help-center/reporting-and-analytics/event-reports

**Corroborating evidence**
`e2e/tests/management/orders-offline.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ORDER-050

**Requirement**
A buyer with an order-summary access link can view the order and perform documented self-service updates.

**Actor**
Buyer

**Preconditions**
The order exists and self-service is enabled for the event.

**Acceptance criteria**

1. The buyer can access the order summary using the provided secure link or lookup flow.
2. The buyer can correct permitted order-contact details.
3. The buyer can correct permitted attendee details.
4. The buyer can request that the order confirmation email be resent.
5. Changes outside the documented self-service fields remain unavailable.

**Important variants and edge cases**
Buyer-initiated cancellation and refunds are not documented as self-service capabilities.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/event-page-and-checkout/attendee-self-service

**Corroborating evidence**
`e2e/tests/self-service/order-summary-self-service.spec.ts`; `e2e/tests/self-service/ticket-lookup.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
