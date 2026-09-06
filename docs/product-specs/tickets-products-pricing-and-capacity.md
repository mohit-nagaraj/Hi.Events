# Tickets, Products, Pricing, and Capacity

## Requirements

### HE-PRODUCT-001

**Requirement**
An organizer can add entry tickets and non-entry products to an event.

**Actor**
Organizer

**Preconditions**
The event exists.

**Acceptance criteria**

1. The organizer can create a ticket that grants event entry.
2. The organizer can create a general product such as merchandise or parking.
3. The created item appears in the event's Tickets & Products management surface.
4. The item can be edited after creation.

**Important variants and edge cases**
Both tickets and general products may use donation-style pricing.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/tickets-and-products/adding-tickets-and-products

**Corroborating evidence**
`e2e/tests/management/product-create.spec.ts`; `e2e/tests/management/edit-ticket.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PRODUCT-010

**Requirement**
A product can use free, fixed paid, donation, or tiered pricing as documented.

**Actor**
Organizer and buyer

**Preconditions**
The organizer is creating or editing a product.

**Acceptance criteria**

1. A free product has no buyer-entered payment amount.
2. A fixed paid product presents the configured price.
3. A donation product allows the buyer to choose a permitted amount.
4. A tiered product presents its configured price levels.
5. The selected or entered price contributes to the checkout total.

**Important variants and edge cases**
Taxes, fees, minimums, and payment availability can further constrain the final amount.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/tickets-and-products/adding-tickets-and-products; https://hi.events/docs/help-center/tickets-and-products/tiered-pricing

**Corroborating evidence**
`e2e/tests/management/product-create.spec.ts`; `e2e/tests/checkout/donation-tiered-checkout.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PRODUCT-020

**Requirement**
An organizer can constrain when and how many units of a product a buyer can select.

**Actor**
Organizer and buyer

**Preconditions**
The product exists.

**Acceptance criteria**

1. The organizer can configure product availability or sale timing using the documented fields.
2. The organizer can configure available quantity where inventory is limited.
3. The organizer can configure documented minimum and maximum purchase quantities.
4. Checkout prevents a buyer from selecting unavailable inventory or a quantity outside the configured limits.

**Important variants and edge cases**
Shared capacity can make a product unavailable before its own nominal quantity is exhausted.

**Evidence status**
Documented

**Primary sources**
https://hi.events/docs/help-center/tickets-and-products/adding-tickets-and-products; https://hi.events/docs/help-center/orders-and-attendees/managing-capacity

**Corroborating evidence**
None identified as an isolated E2E boundary test

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PRODUCT-030

**Requirement**
An organizer can attach eligible products as add-ons to a parent product.

**Actor**
Organizer and buyer

**Preconditions**
The parent and add-on products exist for the event.

**Acceptance criteria**

1. The organizer can associate an add-on with a parent product.
2. Selecting the parent in checkout reveals its add-ons beneath it.
3. The buyer can add the parent and add-on to the same order.
4. A product configured as add-on-only cannot be purchased without its parent.
5. Add-on price, tax, and quantity settings contribute to the order as documented.

**Important variants and edge cases**
A product may be independently sold as well as offered as an add-on when configured that way.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/tickets-and-products/product-add-ons

**Corroborating evidence**
`e2e/tests/checkout/addon-checkout.spec.ts`; `e2e/tests/management/product-create.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PRODUCT-040

**Requirement**
A tiered product offers one product at multiple named price levels.

**Actor**
Organizer and buyer

**Preconditions**
The product uses tiered pricing.

**Acceptance criteria**

1. The organizer can create multiple tiers with names, prices, and documented availability settings.
2. The product management surface represents the configured tier price range.
3. The buyer can select an available tier during checkout.
4. The selected tier price is used in the order summary.

**Important variants and edge cases**
Tier availability can change independently according to its configuration.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/tickets-and-products/tiered-pricing

**Corroborating evidence**
`e2e/tests/management/product-create.spec.ts`; `e2e/tests/checkout/donation-tiered-checkout.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PRODUCT-050

**Requirement**
An organizer can hide a product completely or reveal it only through an applicable promo code.

**Actor**
Organizer and buyer

**Preconditions**
The product exists.

**Acceptance criteria**

1. A fully hidden product is not shown to public buyers.
2. A promo-gated product remains hidden until an applicable code is accepted.
3. Applying the applicable code reveals the promo-gated product.
4. A promo code does not reveal a product configured as fully hidden.
5. Products outside their documented availability are hidden automatically where specified.

**Important variants and edge cases**
Both the product's promo-gated setting and the promo code's product applicability are required for code-based reveal.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/tickets-and-products/product-visibility-and-hidden-tickets; https://hi.events/docs/help-center/marketing-and-promotions/promo-codes

**Corroborating evidence**
`e2e/tests/checkout/promo-code-checkout.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PRODUCT-060

**Requirement**
An organizer can group tickets and products into named product categories.

**Actor**
Organizer

**Preconditions**
The event exists.

**Acceptance criteria**

1. The organizer can create and rename a product category.
2. Products can be assigned to the category.
3. Category grouping controls how products are organized on the event page as documented.
4. An empty category can be deleted.

**Important variants and edge cases**
Deletion can be restricted when products in the category are associated with orders.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/tickets-and-products/product-categories

**Corroborating evidence**
`e2e/tests/management/product-categories.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PRODUCT-070

**Requirement**
An organizer can apply a shared capacity limit across multiple products.

**Actor**
Organizer and buyer

**Preconditions**
At least one event product exists.

**Acceptance criteria**

1. The organizer can create a named capacity group with a limit.
2. Multiple products can be assigned to the same group.
3. Completed purchases consume the shared capacity.
4. All assigned products respect the group's remaining capacity.
5. The organizer can edit or delete a capacity group subject to documented restrictions.

**Important variants and edge cases**
Recurring events can apply capacity at occurrence level as documented.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/orders-and-attendees/managing-capacity

**Corroborating evidence**
`e2e/tests/management/capacity-*.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-PRODUCT-080

**Requirement**
An account can define taxes and service fees and apply them to selected products with a documented price-display mode.

**Actor**
Account administrator or organizer

**Preconditions**
The actor can access account tax and fee settings.

**Acceptance criteria**

1. The actor can create percentage or fixed tax/fee entries supported by the settings surface.
2. A tax or fee can be associated with selected products.
3. Checkout calculates and displays applicable amounts.
4. The order summary displays the resulting tax and fee amounts.
5. Inclusive or exclusive display follows the configured price-display mode.

**Important variants and edge cases**
Tax obligations and legal correctness remain the organizer's responsibility.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/payments-and-billing/taxes-and-fees

**Corroborating evidence**
`e2e/tests/account/taxes-fees.spec.ts`; `e2e/tests/checkout/taxes-and-fees.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
