# Recurring and Multi-date Events

## Requirements

### HE-EVENT-100

**Requirement**
An organizer can generate a schedule of occurrences for a recurring event.

**Actor**
Organizer

**Preconditions**
The event was created as recurring.

**Acceptance criteria**

1. The schedule surface accepts a documented recurrence pattern and date range.
2. Generating the schedule creates the matching occurrences.
3. Occurrences are visible in the event schedule for review.
4. The organizer can add or manage dates after initial event creation.

**Important variants and edge cases**
Recurring events with no scheduled dates produce a publication warning.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/managing-events/recurring-events; https://hi.events/docs/help-center/getting-started/creating-your-first-event

**Corroborating evidence**
`e2e/tests/management/recurring-occurrences.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-110

**Requirement**
A buyer selects a specific available occurrence before buying a recurring-event ticket.

**Actor**
Buyer

**Preconditions**
The recurring event is Live and has available occurrences and products.

**Acceptance criteria**

1. The public event page presents available dates and times.
2. The buyer can navigate the schedule to a later month.
3. Selecting an occurrence scopes the product selection and order to that occurrence.
4. A direct occurrence link opens the schedule at the relevant date.
5. Completing checkout records the selected occurrence with the order and attendee.

**Important variants and edge cases**
Past, cancelled, or unavailable occurrences cannot be purchased as available dates.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/managing-events/recurring-events

**Corroborating evidence**
`e2e/tests/events/recurring-event-checkout.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-120

**Requirement**
An organizer can override documented settings for an individual recurring occurrence.

**Actor**
Organizer

**Preconditions**
The recurring event has at least one occurrence.

**Acceptance criteria**

1. The organizer can edit an occurrence independently of the series defaults.
2. Supported overrides include date/time, capacity, label, location or online details, product price, and product visibility where documented.
3. The public occurrence uses its saved override while other occurrences retain their own or series settings.
4. Clearing an override returns that occurrence to the event-level default where documented.

**Important variants and edge cases**
The exact bulk-edit selection behavior is tracked as executable-only where the help center does not specify it.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/managing-events/recurring-events; https://hi.events/docs/help-center/event-page-and-checkout/online-events

**Corroborating evidence**
`e2e/tests/management/recurring-occurrences.spec.ts`; `e2e/tests/management/occurrence-bulk-edit.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-130

**Requirement**
An organizer can cancel an occurrence without deleting its historical or registration context and can reactivate it when allowed.

**Actor**
Organizer

**Preconditions**
The occurrence exists.

**Acceptance criteria**

1. The organizer can cancel the occurrence.
2. A cancelled occurrence is not offered as an available purchase date.
3. Existing attendee or order context remains associated with the occurrence.
4. The organizer can reactivate the occurrence when the documented state permits it.

**Important variants and edge cases**
Deleting an occurrence is distinct from cancellation and can be blocked when orders exist.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/managing-events/recurring-events

**Corroborating evidence**
`e2e/tests/management/recurring-occurrences.spec.ts`; `e2e/tests/management/occurrence-bulk-edit.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-EVENT-140

**Requirement**
Recurring-event operations keep occurrence-specific capacity, check-in, and reporting distinct while retaining event-level totals.

**Actor**
Organizer

**Preconditions**
The recurring event has activity on one or more occurrences.

**Acceptance criteria**

1. Capacity can be managed for an occurrence as documented.
2. Check-in can be scoped to a selected occurrence.
3. Reports and dashboard information distinguish occurrence activity where documented.
4. Event-level totals aggregate qualifying occurrence activity without losing the per-occurrence view.

**Important variants and edge cases**
Orders awaiting payment remain excluded from completed-sales reporting.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/managing-events/recurring-events; https://hi.events/docs/help-center/orders-and-attendees/managing-capacity; https://hi.events/docs/help-center/check-in/setting-up-check-in; https://hi.events/docs/help-center/reporting-and-analytics/event-reports

**Corroborating evidence**
`e2e/tests/management/event-dashboard-stats.spec.ts`; `e2e/tests/management/occurrence-bulk-edit.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
