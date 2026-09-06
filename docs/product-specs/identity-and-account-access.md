# Identity and Account Access

## Requirements

### HE-AUTH-001

**Requirement**
A new cloud user can create a Hi.Events account using an email address and proceed to event setup.

**Actor**
Account owner

**Preconditions**
The user can access the cloud registration surface.

**Acceptance criteria**

1. The registration surface accepts an email-based account registration.
2. After registration, the user can proceed toward creating and configuring an event.
3. Registration does not require a payment card to begin.

**Important variants and edge cases**
Self-hosted availability depends on a successfully deployed instance rather than the managed-cloud signup surface.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/getting-started/quick-start-cloud

**Corroborating evidence**
`e2e/tests/auth/registration.spec.ts`; `e2e/tests/smoke.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-AUTH-010

**Requirement**
An account must be email-verified before its user can publish or unpublish an event.

**Actor**
Account owner or authorized team member

**Preconditions**
The account has an event whose publication status can be changed.

**Acceptance criteria**

1. An unverified account is prevented from changing an event from Draft to Live.
2. An unverified account is prevented from changing an event from Live to Draft.
3. The product provides a verification step or a way to resend the confirmation from the profile surface.
4. After verification, the publication status action is available subject to other publication checks.

**Important variants and edge cases**
Paid events may still be blocked by payment-setup requirements after email verification.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/getting-started/publishing-and-sharing-your-event

**Corroborating evidence**
`e2e/tests/auth/registration.spec.ts`; `e2e/fixtures/account.fixture.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-AUTH-020

**Requirement**
An account owner can request account deletion and cancel a pending deletion request.

**Actor**
Account owner

**Preconditions**
The actor has access to account settings.

**Acceptance criteria**

1. Only the account owner can submit the deletion request, although other Admin users can see the documented restriction.
2. Confirmation requires the account name to match before the deletion action is enabled.
3. A request immediately deactivates the account, unpublishes its events, disables team access, and starts a 30-day grace period.
4. The owner receives request, reminder, and completion emails at the documented stages.
5. The owner can cancel during the grace period, immediately reactivating the account while leaving its events unpublished.
6. After the grace period, deletion is automatic and cannot be undone.
7. Upcoming events with completed orders block deletion until the documented cancellation and refund prerequisites are resolved.

**Important variants and edge cases**
Accounts without completed orders are fully deleted. Where completed orders exist, personal data is deleted or anonymized while unlinkable transaction records may be retained for tax and accounting obligations.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/customization-and-settings/deleting-your-account

**Corroborating evidence**
`e2e/tests/management/account-deletion.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
