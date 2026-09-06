# Integrations, Widgets, Webhooks, and API

## Requirements

### HE-INTEGRATION-001

**Requirement**
An organizer can embed a configured ticket-purchase widget on an external website.

**Actor**
Organizer and buyer

**Preconditions**
The event exists and the external site can include the generated snippets.

**Acceptance criteria**

1. The widget settings generate an embed script and placement markup.
2. The organizer can configure documented widget appearance and behavior properties.
3. The embedded surface displays eligible event products.
4. A buyer can begin and complete the supported checkout flow without navigating away from the host site.
5. The widget adjusts its embedded presentation as documented.

**Important variants and edge cases**
Mobile checkout may use a full-screen modal, and abandoning an active checkout requires confirmation.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/customization-and-settings/embedding-the-ticket-widget

**Corroborating evidence**
`e2e/tests/widget/embedded-widget.spec.ts`; `e2e/tests/widget/widget-checkout.spec.ts`; `e2e/tests/widget/widget-playground.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-INTEGRATION-010

**Requirement**
An organizer can configure an event- or organizer-scoped webhook for supported product events.

**Actor**
Organizer or external system owner

**Preconditions**
The actor has a receiving HTTPS endpoint and webhook-management access.

**Acceptance criteria**

1. The organizer can supply a destination URL and select supported event types.
2. The webhook can be scoped as documented to an organizer or event.
3. A matching Hi.Events action creates a delivery to the configured destination.
4. The receiver can verify the webhook using the documented signing mechanism.
5. The organizer can pause, edit, and delete the webhook.

**Important variants and edge cases**
External endpoint availability and receiver behavior are outside Hi.Events control.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/customization-and-settings/webhooks

**Corroborating evidence**
`e2e/tests/management/webhooks.spec.ts`; `e2e/tests/management/webhooks-event.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-INTEGRATION-020

**Requirement**
Webhook management exposes delivery status and logs, and failed deliveries follow the documented retry behavior.

**Actor**
Organizer or external system owner

**Preconditions**
The webhook has attempted at least one delivery.

**Acceptance criteria**

1. The organizer can open delivery logs for a webhook.
2. A log identifies the delivery event and result information documented by the help center.
3. Failed deliveries are retried according to the documented policy.
4. Pausing a webhook prevents ordinary active delivery until it is resumed.

**Important variants and edge cases**
The receiver should handle duplicate delivery attempts safely.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/customization-and-settings/webhooks

**Corroborating evidence**
`e2e/tests/management/webhooks-event.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-INTEGRATION-030

**Requirement**
A self-hosted Hi.Events operator can enable interactive documentation for the product's REST API.

**Actor**
Self-hosted operator or API client

**Preconditions**
The operator controls deployment configuration.

**Acceptance criteria**

1. Enabling the documented API-docs setting exposes interactive API documentation at the documented instance path.
2. The operator can export an OpenAPI specification using the documented command.
3. API clients can use the published contract to identify supported endpoints and authentication requirements.

**Important variants and edge cases**
The repository README confirms API and OpenAPI availability, but it does not establish every endpoint as a product requirement. Endpoint-level contracts are outside this snapshot.

**Evidence status**
Documented

**Primary sources**
Repository `README.md`

**Corroborating evidence**
None at the broad API-documentation boundary

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
