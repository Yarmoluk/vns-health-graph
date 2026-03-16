# Domain: Provider Experience

## Current State

Healthcare Organization's provider network spans PCPs, specialists, home health agencies, LHCSAs, SNFs, and ancillary providers across New York. Providers interact with Healthcare Organization through multiple systems and processes, each with its own friction.

### Provider Touchpoint Map

```
PROVIDER
  ├── Claims → Availity (EDI) or Paper Mail
  ├── Prior Auth → eviCore by Evernorth
  ├── Portal → Healthcare Organization Provider Portal (24/7)
  ├── Credentialing → Healthcare Organization Plans
  ├── Post-Payment Review → Varis
  ├── Disputes → Online Dispute Form
  ├── Appeals → Clinical Review Process
  └── Support → 1-866-783-0222 (M-F 8am-5pm)
```

**Core problem:** Providers must navigate **3 different vendor systems** (Availity, eviCore, Varis) plus Healthcare Organization's own portal. Each has different logins, different workflows, different SLAs.

### Pain Point Analysis

| Pain Point | Root Cause | Impact |
|-----------|-----------|--------|
| **Multi-vendor fragmentation** | Claims (Availity), auth (eviCore), audit (Varis) are separate systems | Provider admin burden, training cost, workflow breaks |
| **90-day timely filing deadline** | Industry standard, but tight for complex cases | Claim denials on valid services → disputes → admin cost |
| **Corrected claim complexity** | Must use exact replacement codes + reference original claim | High error rate → re-denials → provider frustration |
| **Varis post-payment recoupment** | 30-day records request; non-response = full reclamation | Providers lose legitimate revenue due to admin delays |
| **Inconsistent dispute timelines** | 60 days (LHCSA/SNF) vs 90 days (meals) vs 6 months (ancillary) | Confusion, missed deadlines, unresolved disputes |
| **Cross-year billing rule** | 2025/2026 services must be separate claims | Systematic denials during year transition |
| **eviCore auth learning curve** | External vendor with own protocols for each clinical program | Providers must learn organization-specific AND eviCore-specific rules |

### Provider Support Gaps
- Phone support is M-F 8am-5pm only — no evening/weekend coverage
- Portal is 24/7 but self-service capabilities are limited to status checks
- Provider education exists but is passive (web-based resources, not proactive outreach)

## Graph-Derived Insights

### Provider Fatigue Cascade
```
[Multi-Vendor System Complexity]
    → [Higher Admin Burden Per Claim]
        → [Provider Staff Burnout]
            → [Slower Claims Submission]
                → [Timely Filing Violations]
                    → [Revenue Loss for Provider]
                        → [Provider Considers Leaving Network]
                            → [Network Adequacy Threatened]
                                → [Growth Strategy Blocked]
```

### The Varis Trap
```
[Varis Requests Records]
    → [Provider Has 30 Days]
        → [Provider Misses Deadline (admin overload)]
            → [Full Claim Reclamation]
                → [Provider Loses Legitimate Revenue]
                    → [Provider Trust Eroded]
                        → [Reduced Willingness to Accept Healthcare Organization Members]
```

## Opportunities for Graphify

1. **Provider Journey Graph** — Map every provider interaction across all vendor systems, identifying friction hotspots and drop-off points
2. **Claims Lifecycle Intelligence** — Single-pane view of a claim's journey from submission → adjudication → dispute → resolution, across Availity + Healthcare Organization + Varis
3. **Provider Risk Scoring** — Identify providers at highest risk of network departure based on dispute frequency, recoupment history, and engagement decline
4. **Unified Provider Relationship Graph** — Connect credentialing, claims, auth, and quality data into one provider profile, eliminating the multi-vendor visibility gap
