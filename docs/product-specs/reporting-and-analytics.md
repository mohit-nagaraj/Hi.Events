# Reporting and Analytics

## Requirements

### HE-REPORT-001

**Requirement**
An organizer can view event-level reports for sales, products, promotions, revenue, taxes, and attendance where data exists.

**Actor**
Organizer

**Preconditions**
The actor can manage the event and the selected report has reportable activity.

**Acceptance criteria**

1. Event reporting offers the documented report types.
2. Report results can be constrained to a supported date range.
3. Daily sales represent completed orders in the selected period.
4. Product reports show units sold by product.
5. Revenue, tax, fee, promotion, and attendance values are separated where documented.

**Important variants and edge cases**
Reports with no qualifying activity may be empty rather than synthesizing values.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/reporting-and-analytics/event-reports; https://hi.events/docs/help-center/getting-started/event-dashboard

**Corroborating evidence**
`e2e/tests/management/event-reports.spec.ts`; `e2e/tests/management/event-dashboard-stats.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-REPORT-010

**Requirement**
Organizer-level reports aggregate revenue and event performance across that organizer's events.

**Actor**
Organizer

**Preconditions**
The organizer has one or more events with reportable activity.

**Acceptance criteria**

1. The organizer can open reports that span multiple events owned by the organizer.
2. Revenue summary reflects qualifying completed orders.
3. Event performance lists qualifying events with their corresponding results.
4. The selected date range limits the organizer-level results.

**Important variants and edge cases**
The reports are organizer-scoped rather than automatically combining unrelated organizers in the account.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/reporting-and-analytics/event-reports

**Corroborating evidence**
`e2e/tests/organizer/organizer-reports.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-REPORT-020

**Requirement**
Sales and revenue reports include completed orders and exclude orders still awaiting offline payment.

**Actor**
Organizer

**Preconditions**
The event has orders in more than one payment state.

**Acceptance criteria**

1. A completed order contributes to applicable reports.
2. An order awaiting offline payment does not contribute while it remains unpaid.
3. Marking the offline order paid makes it eligible for subsequent report results.
4. Cancelling or refunding activity is represented according to the documented report definition rather than counted as an unchanged completed sale.

**Important variants and edge cases**
Timing can depend on report refresh after a status change.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/reporting-and-analytics/event-reports; https://hi.events/docs/help-center/payments-and-billing/offline-payments

**Corroborating evidence**
`e2e/tests/management/event-dashboard-stats.spec.ts`; `e2e/tests/organizer/organizer-reports.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`

### HE-REPORT-030

**Requirement**
An organizer can download supported report results for external analysis.

**Actor**
Organizer

**Preconditions**
The selected report is available to the organizer.

**Acceptance criteria**

1. A supported report exposes a download action.
2. The downloaded data respects the selected report and date range.
3. Event-level and organizer-level exports remain scoped to the actor's selected context.

**Important variants and edge cases**
Available file formats vary by report; this requirement does not prescribe an undocumented format.

**Evidence status**
Documented and corroborated

**Primary sources**
https://hi.events/docs/help-center/reporting-and-analytics/event-reports

**Corroborating evidence**
`e2e/tests/organizer/organizer-reports.spec.ts`; `e2e/tests/management/affiliates.spec.ts`

**Reviewed commit**
`0497418d5c66d20693751e68be066260eda3f37f`
