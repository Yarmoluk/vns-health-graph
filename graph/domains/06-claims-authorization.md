# Domain: Claims & Authorization Workflows

## Current State

Healthcare Organization's claims and authorization ecosystem relies on a multi-vendor architecture with Availity (claims), eviCore (prior auth), Varis (post-payment review), and MedImpact (Part D vaccines).

### Claims Architecture

```
CLAIM LIFECYCLE:

  Provider → [Availity EDI] → Healthcare Organization Adjudication → Payment
       ↓              ↓              ↓              ↓
  [Paper Mail]   [Rejection]    [Denial]      [Varis Audit]
       ↓              ↓              ↓              ↓
  [Slower SLA]  [Resubmit]   [Dispute/Appeal]  [Recoupment Risk]
```

### Authorization Architecture

```
AUTH LIFECYCLE:

  Provider → [eviCore Portal/Phone] → Clinical Review → Approval/Denial
       ↓                                                      ↓
  [Healthcare Organization Provider Portal]                              [Appeal Process]
  (status check only)                               (60-120 day decision)
```

### Key Process Rules

| Rule | Detail | Risk |
|------|--------|------|
| Timely filing | 90 days from service | Hard deadline — denials are final |
| Secondary claims | 60 days from primary EOB | Tighter window for coordination of benefits |
| Cross-year billing | 2025/2026 on separate claims | **Systematic denial risk during transition** |
| Corrected claims | UB-04 code 7 / CMS-1500 code 7 | Must reference original — errors cascade |
| Post-payment records | 30 days to respond to Varis | Non-response = full reclamation |
| Dispute windows | 60 days (LHCSA/SNF), 90 days (meals), 6 months (ancillary) | **Inconsistency breeds missed deadlines** |
| Appeal decisions | 60 days standard, 120 days OON | Long cycle times |

### Vendor Dependency Analysis

| Vendor | Function | Dependency Level | Single Point of Failure? |
|--------|----------|-----------------|------------------------|
| **Availity** | EDI claims submission + remittance | HIGH — preferred/primary channel | Yes — paper is fallback but slower |
| **eviCore** | Prior authorization management | HIGH — sole auth vendor | Yes — auth delays block care delivery |
| **Varis** | Post-payment audit + recovery | MEDIUM — audit is periodic | No — but recoupment power is asymmetric |
| **MedImpact** | Part D vaccine claims | LOW — narrow scope | No — limited to one claim type |

### Process Friction Points

#### 1. The Two-Vendor Auth Problem
Providers must know which services need eviCore auth vs. Healthcare Organization direct auth. Getting it wrong delays care. The provider portal shows status but doesn't route — providers must figure out the right door.

#### 2. Cross-Year Billing Trap
"Services from 2025 and 2026 must be billed on separate claims. Submitting multiple service years on one claim may result in denials or delayed payment."

This affects every provider during Q1 2026. It's a known, predictable, and preventable denial spike.

#### 3. Varis Asymmetric Power
- Varis requests records → provider has 30 days
- Provider doesn't respond → **full claim payment reclamation**
- No evidence of proportional provider support during this window
- Creates adversarial dynamic between plan and providers

#### 4. Dispute Resolution Inconsistency
Why does an LHCSA get 60 days but an ancillary provider gets 6 months? The inconsistency may have historical/regulatory reasons, but it creates:
- Provider confusion about their rights
- Internal tracking complexity
- Potential equity concerns across provider types

## Graph-Derived Failure Patterns

### The Denial Cascade
```
[Cross-Year Billing Error]
    → [Claim Denied]
        → [Provider Submits Corrected Claim]
            → [Wrong Replacement Code]
                → [Corrected Claim Also Denied]
                    → [Provider Files Dispute]
                        → [60-Day Window May Already Be Running]
                            → [Dispute Rejected as Untimely]
                                → [Provider Eats the Cost]
                                    → [Network Satisfaction Drops]
```

### The Auth Bottleneck
```
[Provider Needs Auth for Service]
    → [Unsure: eviCore or Healthcare Organization Direct?]
        → [Submits to Wrong Entity]
            → [Redirected — Time Lost]
                → [Auth Delayed]
                    → [Care Delivery Delayed]
                        → [Member Experience Impact]
                            → [For Inpatient→Home Health: SLA is 1 Business Day]
                                → [Delay = Readmission Risk]
```

## Opportunities for Graphify

1. **Claims Flow Intelligence** — End-to-end graph of every claim from submission through final disposition, with real-time bottleneck detection and denial pattern analysis
2. **Authorization Routing Engine** — Graph-based routing logic that tells providers exactly where to submit auth requests, eliminating the eviCore vs. Healthcare Organization guessing game
3. **Cross-Year Billing Prevention** — Automated pre-submission validation that flags mixed-year claims before they reach Availity
4. **Denial Pattern Graph** — Map denial reasons → root causes → provider types → time periods to identify systemic issues vs. one-off errors
5. **Vendor Dependency Risk Map** — Model cascading impacts of vendor outages or performance degradation across the claims/auth ecosystem
