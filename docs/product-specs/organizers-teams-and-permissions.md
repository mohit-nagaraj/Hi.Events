# Organizers, Teams, and Permissions

## Requirements

### HE-ORG-001

**Requirement**
An account can maintain organizer-level profile information and defaults that apply across the organizer's events.

**Actor**
Account administrator or organizer manager

**Preconditions**
An organizer exists and the actor can access its settings.

**Acceptance criteria**

1. Organizer settings expose basic identity information, address, website, and social-link configuration.
2. Event defaults configured at organizer level are available when creating events for that organizer.
3. Organizer settings provide access to payout, email-template, tracking, SEO, and danger-zone sections when applicable.
4. Changes are scoped to the selected organizer rather than every organizer in the account.

**Important variants and edge cases**
Payout and platform-fee settings differ between cloud and self-hosted deployments.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/getting-started/configuring-organizer-settings

**Corroborating evidence**
`e2e/tests/organizer/organizer-management.spec.ts`; `e2e/tests/organizer/locations.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ORG-010

**Requirement**
An organizer can publish a branded organizer homepage that lists its published events.

**Actor**
Organizer

**Preconditions**
The organizer exists and has access to its homepage designer.

**Acceptance criteria**

1. The designer supports organizer logo, cover image, background, colors, color mode, and typography.
2. The designer presents a preview before changes are saved.
3. The public organizer page lists the organizer's published events.
4. A visitor can follow an event listing to the corresponding public event page.

**Important variants and edge cases**
Draft events are not expected in the public event listing.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/getting-started/designing-your-organizer-homepage

**Corroborating evidence**
`e2e/tests/organizers/organizer-public-page.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ORG-020

**Requirement**
An account administrator can invite another person to join the account team.

**Actor**
Account administrator

**Preconditions**
The actor can access the account Users settings.

**Acceptance criteria**

1. The administrator can enter an invitee's email address and select a documented role.
2. The product sends the invitee an invitation.
3. The invitee can accept the invitation and establish access to the account.
4. The accepted member appears in team management.

**Important variants and edge cases**
Only users with the documented administrative role can see the Users settings.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/customization-and-settings/managing-your-team

**Corroborating evidence**
`e2e/tests/account/team-invite.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-ORG-030

**Requirement**
Team members receive dashboard access according to their assigned Admin or Organizer role.

**Actor**
Account administrator or team member

**Preconditions**
The team member belongs to the account.

**Acceptance criteria**

1. An Admin can access account Users settings and manage team members.
2. An Organizer role does not see the account Users settings.
3. An administrator can change a member's role.
4. An administrator can deactivate a member so that the member no longer has active account access.

**Important variants and edge cases**
More granular permission levels are not documented in the reviewed help-center source.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/customization-and-settings/managing-your-team

**Corroborating evidence**
`e2e/tests/account/team-invite.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
