# Event Creation and Configuration

## Requirements

### HE-EVENT-001

**Requirement**
An organizer can create a single or recurring event with its core public details.

**Actor**
Organizer or authorized team member

**Preconditions**
At least one organizer is available to own the event.

**Acceptance criteria**

1. Event creation accepts an organizer, name, category, and description.
2. A single event accepts a start date and an optional end date.
3. A recurring event can be selected without defining all occurrences in the initial form.
4. Successful creation leads to an event setup/dashboard surface.

**Important variants and edge cases**
The organizer selector is omitted when creation begins inside a specific organizer.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/getting-started/creating-your-first-event

**Corroborating evidence**
`e2e/tests/events/event-creation.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-010

**Requirement**
A newly created event starts as a non-public Draft.

**Actor**
Organizer

**Preconditions**
Event creation succeeds.

**Acceptance criteria**

1. The new event displays Draft status in management surfaces.
2. The event is not publicly available as a live event before publication.
3. The organizer can continue setup while the event remains Draft.

**Important variants and edge cases**
An authenticated organizer may preview and test a draft event without making it public.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/getting-started/creating-your-first-event; https://hi.events/docs/help-center/getting-started/publishing-and-sharing-your-event

**Corroborating evidence**
`e2e/tests/management/event-lifecycle.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-020

**Requirement**
An eligible organizer can publish a Draft event, making it Live and publicly purchasable.

**Actor**
Organizer or authorized team member

**Preconditions**
The account is verified and the event is a Draft.

**Acceptance criteria**

1. Publishing requires explicit confirmation.
2. A Live event is visible on its public event page.
3. Buyers can select available products and begin checkout on the Live event.
4. A paid event is blocked from publication when Stripe is enabled but required Stripe setup is incomplete.
5. Missing products or missing recurring dates produce the documented warning rather than being silently ignored.

**Important variants and edge cases**
The publication dialog may offer offline payments as an alternative for a paid event that cannot use Stripe.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/getting-started/publishing-and-sharing-your-event

**Corroborating evidence**
`e2e/tests/management/event-lifecycle.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-030

**Requirement**
An eligible organizer can return a Live event to Draft without altering existing orders or attendees.

**Actor**
Organizer or authorized team member

**Preconditions**
The account is verified and the event is Live.

**Acceptance criteria**

1. The organizer can select the documented unpublish action and confirm it.
2. The event returns to Draft and is hidden from public view.
3. Existing orders remain recorded.
4. Existing attendees remain recorded.

**Important variants and edge cases**
An unverified account is blocked from unpublishing.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/getting-started/publishing-and-sharing-your-event

**Corroborating evidence**
`e2e/tests/management/event-lifecycle.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-040

**Requirement**
An in-person event can use a saved venue or manually entered location information.

**Actor**
Organizer

**Preconditions**
The event is configured as in-person.

**Acceptance criteria**

1. The organizer can select an existing saved venue.
2. The organizer can create a venue using manual address information.
3. Saved venue information is reusable for later event configuration.
4. The selected location is presented on the event's public-facing information.

**Important variants and edge cases**
Online events use connection details instead of venue-address fields.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/managing-events/event-location-settings

**Corroborating evidence**
`e2e/tests/organizer/locations.spec.ts`; `e2e/tests/management/event-settings.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-050

**Requirement**
An event can be configured as online with connection details restricted to holders of completed orders.

**Actor**
Organizer and attendee

**Preconditions**
The organizer selects the online-event mode.

**Acceptance criteria**

1. Enabling online mode replaces venue fields with a connection-details editor.
2. Connection details are required before the online event can be saved.
3. Connection details appear on the completed order summary, attendee ticket page, and printable ticket.
4. Connection details are not shown for an order still awaiting offline payment.
5. Connection details are not included directly in the email body.

**Important variants and edge cases**
An event is either online or in-person; a combined event-level mode is not documented. Individual recurring occurrences can override the event location.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/event-page-and-checkout/online-events

**Corroborating evidence**
`e2e/tests/management/occurrence-bulk-edit.spec.ts`; `e2e/tests/self-service/attendee-ticket-page.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-060

**Requirement**
An organizer can duplicate an existing event into a new Draft without copying transactional records.

**Actor**
Organizer

**Preconditions**
The source event exists and the actor can manage it.

**Acceptance criteria**

1. The organizer can initiate duplication from the existing event.
2. The resulting copy is created with Draft status.
3. Reusable setup and configuration are copied as documented.
4. Orders and attendees from the source event are not copied into the new event.

**Important variants and edge cases**
The copied event must be reviewed and published independently.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/managing-events/duplicating-an-event

**Corroborating evidence**
`e2e/tests/management/event-lifecycle.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-070

**Requirement**
An organizer can customize and preview the public event page before saving design changes.

**Actor**
Organizer

**Preconditions**
The event exists.

**Acceptance criteria**

1. The designer supports a cover image, background mode, accent and background colors, color mode, font, and checkout button text.
2. Design controls update a preview of the public page.
3. Readability feedback is shown for potentially difficult color combinations.
4. Non-image design changes remain unsaved until the organizer saves them.
5. A cover image is saved when uploaded.

**Important variants and edge cases**
Cover-image backgrounds remain unavailable until a cover image exists; documented upload size limits apply.

**Evidence status**
Documented

**Primary sources**
https://hi.events/docs/help-center/event-page-and-checkout/customizing-the-event-page

**Corroborating evidence**
None identified

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-080

**Requirement**
An organizer can configure event search and social-preview metadata.

**Actor**
Organizer

**Preconditions**
The event exists.

**Acceptance criteria**

1. Event settings expose SEO configuration for the public event page.
2. The organizer can supply documented metadata used for search and link previews.
3. Saved metadata is associated with the selected event.

**Important variants and edge cases**
Search-engine indexing and third-party preview-cache refresh timing are outside Hi.Events control.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/managing-events/seo-settings

**Corroborating evidence**
`e2e/tests/management/event-settings.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-090

**Requirement**
An organizer can use an existing event as a reusable template for a new event.

**Actor**
Organizer

**Preconditions**
The organizer has access to an existing event suitable for reuse.

**Acceptance criteria**

1. The organizer can select the documented template action from the existing event.
2. Reusable event setup is carried into a new event configuration.
3. The new event remains independently editable before publication.
4. Transactional records from the source event are not treated as records of the new event.

**Important variants and edge cases**
Dates, availability, payment setup, and public content must be reviewed for the new event rather than assumed current.

**Evidence status**
Documented

**Primary sources**
https://hi.events/docs/help-center/managing-events/event-templates

**Corroborating evidence**
None identified as a dedicated E2E specification

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
