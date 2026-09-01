# Known Risks

| ID | Severity | Risk | Mitigation | Owner | Status |
|---|---|---|---|---|---|
| R-17 | High | Search index rebuild may increase latency | Run rebuild outside peak hours | Priya | Open |
| R-21 | Critical | Export retry can duplicate an audit event | Add idempotency validation | Mateo | Investigating |
| R-24 | Medium | Notification labels may be unclear | Include updated help text | Priya | Mitigated |

No acceptance record is attached for R-17. R-21 has no closure evidence.
