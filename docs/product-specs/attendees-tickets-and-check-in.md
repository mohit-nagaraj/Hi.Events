# Attendees, Tickets, and Check-in

## Requirements

### HE-ATTENDEE-001

**Requirement**
The attendee management surface lists each ticket holder independently of the order that created the ticket.

**Actor**
Organizer

**Preconditions**
The event has at least one attendee.

**Acceptance criteria**

1. Each ticket holder appears as an attendee record.
2. The organizer can view the attendee's ticket, contact, status, order, and registration information documented for the list or detail view.
3. Search and filters narrow attendees.
4. The organizer can export attendee data.

**Important variants and edge cases**
One order may create multiple independently managed attendees.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/orders-and-attendees/managing-attendees

**Corroborating evidence**
`e2e/tests/management/attendees.spec.ts`; `e2e/tests/checkout/multi-ticket-checkout.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ATTENDEE-010

**Requirement**
An organizer can add an attendee manually and manage permitted attendee details and status.

**Actor**
Organizer

**Preconditions**
The event has an eligible ticket product.

**Acceptance criteria**

1. The organizer can create an attendee without requiring the attendee to complete public checkout.
2. The new attendee receives or can be sent a ticket email.
3. The organizer can edit the documented attendee fields.
4. The organizer can cancel or reactivate an attendee where the current status allows it.

**Important variants and edge cases**
Manual attendee creation may affect capacity and event statistics even though it is not a buyer-created order.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/orders-and-attendees/managing-attendees

**Corroborating evidence**
`e2e/tests/management/attendees.spec.ts`; `e2e/tests/management/event-dashboard-stats.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ATTENDEE-020

**Requirement**
An attendee can access a ticket page and printable ticket containing the documented event and ticket information.

**Actor**
Attendee

**Preconditions**
The attendee has an eligible ticket and access link.

**Acceptance criteria**

1. The ticket link opens a ticket-specific page.
2. The page identifies the event and attendee ticket.
3. The attendee can open a printable ticket representation.
4. Restricted online-event details appear only after the associated order has completed.
5. The organizer's configured ticket design is reflected in the generated ticket where documented.

**Important variants and edge cases**
Cancelled or otherwise invalid tickets may have restricted use even when an old link exists.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/managing-events/designing-your-ticket; https://hi.events/docs/help-center/event-page-and-checkout/attendee-self-service; https://hi.events/docs/help-center/event-page-and-checkout/online-events

**Corroborating evidence**
`e2e/tests/self-service/attendee-ticket-page.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ATTENDEE-030

**Requirement**
Every event has a default check-in list, and an organizer can create additional restricted lists.

**Actor**
Organizer

**Preconditions**
The event exists.

**Acceptance criteria**

1. A default check-in list is available for the event.
2. The organizer can create additional lists for documented entrances, sessions, or dates.
3. A list can be restricted to selected products or attendees as documented.
4. The organizer can configure staff privacy controls and list expiry.
5. An expired list is represented as inactive.

**Important variants and edge cases**
Recurring events can use occurrence-specific check-in lists.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/check-in/setting-up-check-in

**Corroborating evidence**
`e2e/tests/management/check-in-lists.spec.ts`; `e2e/tests/management/check-in-lists-lifecycle.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ATTENDEE-040

**Requirement**
Authorized check-in staff can find an eligible attendee and record or undo check-in.

**Actor**
Check-in staff member

**Preconditions**
The staff member has an active check-in-list access link and an internet connection.

**Acceptance criteria**

1. Staff can search the permitted attendee set.
2. Staff can check in an eligible pending attendee by the documented manual or QR path.
3. The attendee's state changes to checked in and check-in totals update.
4. Staff can undo the check-in and return the attendee to pending.
5. Attendees outside the list's scope are not available through that restricted list.

**Important variants and edge cases**
The documented check-in application requires an internet connection; camera-specific QR behavior was not exercised for this snapshot.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/check-in/setting-up-check-in

**Corroborating evidence**
`e2e/tests/check-in/check-in-app.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
