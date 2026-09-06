# Communication and Email

## Requirements

### HE-COMMS-001

**Requirement**
An eligible organizer can send an event message to all attendees or a documented subset of recipients.

**Actor**
Organizer

**Preconditions**
The event has eligible recipients and the organizer meets the documented messaging prerequisites.

**Acceptance criteria**

1. The composer accepts a subject and message body.
2. The organizer can select all attendees or a supported filtered recipient group.
3. The organizer can send a test message before the attendee delivery.
4. A sent message appears in message history.
5. The recipient view identifies the intended recipients.

**Important variants and edge cases**
Messaging can be unavailable until required account verification or payment connection conditions are met.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/communication/sending-messages

**Corroborating evidence**
`e2e/tests/management/messages.spec.ts`; `e2e/tests/management/messages-lifecycle.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-COMMS-010

**Requirement**
An organizer can schedule an attendee message for later delivery and cancel it before sending.

**Actor**
Organizer

**Preconditions**
The organizer is eligible to message attendees and has composed a valid message.

**Acceptance criteria**

1. The organizer can choose a future delivery time.
2. The message is represented as scheduled rather than sent immediately.
3. The organizer can cancel the scheduled message before delivery.
4. A cancelled scheduled message is not delivered as the scheduled send.

**Important variants and edge cases**
Documented sending limits and review rules still apply to scheduled messages.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/communication/sending-messages

**Corroborating evidence**
`e2e/tests/management/messages-lifecycle.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-COMMS-020

**Requirement**
Hi.Events applies documented eligibility, sending-limit, and review controls before attendee messages are delivered.

**Actor**
Organizer

**Preconditions**
The organizer attempts to send or schedule a message.

**Acceptance criteria**

1. Ineligible accounts are shown the documented prerequisite instead of an active send flow.
2. Applicable recipient or sending limits are communicated to the organizer.
3. A message requiring review remains pending rather than being represented as delivered.
4. Delivery proceeds only after required approval or eligibility conditions are satisfied.

**Important variants and edge cases**
The exact review policy may depend on deployment mode and account trust state.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/communication/sending-messages

**Corroborating evidence**
`e2e/tests/management/orders.spec.ts`; `e2e/tests/admin/message-approval.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-COMMS-030

**Requirement**
An organizer can customize supported transactional email templates and restore the default template.

**Actor**
Organizer

**Preconditions**
The organizer or event has access to email-template settings.

**Acceptance criteria**

1. The settings identify the supported transactional template types.
2. The organizer can customize the subject and body of an available template.
3. A preview reflects the saved subject and body.
4. Event-level customization applies to the selected event.
5. Organizer-level customization supplies the documented default across events.
6. Removing a customization restores the default template behavior.

**Important variants and edge cases**
Required transactional content or placeholders may not be removable.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/communication/email-templates

**Corroborating evidence**
`e2e/tests/management/email-templates.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
