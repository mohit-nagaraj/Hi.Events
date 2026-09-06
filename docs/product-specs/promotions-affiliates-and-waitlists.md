# Promotions, Affiliates, and Waitlists

## Requirements

### HE-PROMO-001

**Requirement**
An organizer can create a promo code with no discount, percentage discount, or fixed discount.

**Actor**
Organizer and buyer

**Preconditions**
The event exists and accepts product selections.

**Acceptance criteria**

1. The organizer can enter or generate a case-insensitive code.
2. The organizer can select No Discount, Percentage, or Fixed amount.
3. A fixed discount can apply once to the entire order or to each product.
4. A buyer can apply one valid code to an order.
5. Applying a second valid code replaces the first.
6. An invalid code produces an error and does not alter the order total.

**Important variants and edge cases**
No Discount codes can provide access or attribution without reducing price.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/marketing-and-promotions/promo-codes

**Corroborating evidence**
`e2e/tests/management/promo-codes.spec.ts`; `e2e/tests/checkout/promo-code-checkout.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PROMO-010

**Requirement**
A promo code can be restricted by products, usage count, and expiry date.

**Actor**
Organizer and buyer

**Preconditions**
The organizer is creating or editing a promo code.

**Acceptance criteria**

1. The organizer can limit a code to selected products or leave applicability empty for all products.
2. The organizer can set a maximum use count or leave use unlimited.
3. The organizer can set an expiry date.
4. Checkout rejects a code that is expired, exhausted, or inapplicable to the selected products.
5. An accepted code affects only its applicable products and application scope.

**Important variants and edge cases**
Per-order fixed discounts and per-product fixed discounts produce different totals for multiple quantities.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/marketing-and-promotions/promo-codes

**Corroborating evidence**
`e2e/tests/management/promo-codes.spec.ts`; `e2e/tests/checkout/promo-code-checkout.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PROMO-020

**Requirement**
An organizer can share a URL that pre-applies a promo code and can use the code to reveal eligible promo-gated products.

**Actor**
Organizer and buyer

**Preconditions**
The code exists and is applicable to the event or gated product.

**Acceptance criteria**

1. Applying a code adds the documented `promo_code` query value to the event URL.
2. Loading that URL attempts to apply the code automatically.
3. A valid applicable code reveals a product configured for promo-gated access.
4. A No Discount code can reveal the product without changing its price.
5. The code cannot reveal a fully hidden product.

**Important variants and edge cases**
The product and code must both be configured for the gated product.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/marketing-and-promotions/promo-codes; https://hi.events/docs/help-center/tickets-and-products/product-visibility-and-hidden-tickets

**Corroborating evidence**
`e2e/tests/checkout/promo-code-checkout.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PROMO-030

**Requirement**
An organizer can create event-specific affiliate links and attribute completed orders to the affiliate that referred them.

**Actor**
Organizer, affiliate, and buyer

**Preconditions**
An affiliate exists and is active for the event.

**Acceptance criteria**

1. The organizer can create, activate, deactivate, edit, and delete an event affiliate as documented.
2. Each affiliate has a shareable tracking link or code.
3. A buyer arriving through the active affiliate reference can complete checkout normally.
4. The completed order is attributed to the affiliate.
5. The organizer can review and export affiliate performance information.

**Important variants and edge cases**
Affiliates are scoped to one event and do not automatically carry across events.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/marketing-and-promotions/affiliates

**Corroborating evidence**
`e2e/tests/management/affiliates.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PROMO-040

**Requirement**
When enabled for a sold-out product, a waitlist lets a buyer register interest and receive a time-limited purchase offer when inventory becomes available.

**Actor**
Buyer and organizer

**Preconditions**
The product is sold out and its waitlist is enabled.

**Acceptance criteria**

1. The sold-out product offers an eligible buyer a waitlist signup path.
2. A successful signup creates a visible waitlist entry and sends the documented confirmation.
3. When capacity becomes available, automatic or organizer-triggered processing can offer the place to an eligible entry.
4. The offer email provides a purchase path valid until the configured expiry.
5. Completing checkout consumes the offer and inventory.
6. An expired offer no longer reserves the place for that buyer.

**Important variants and edge cases**
Recurring-event waitlists can be scoped to occurrences; the organizer can review and remove entries.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/marketing-and-promotions/waitlists

**Corroborating evidence**
`e2e/tests/management/waitlist.spec.ts`; `e2e/tests/waitlist/waitlist-journey.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
