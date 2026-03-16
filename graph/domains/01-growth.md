# Domain: Growth Strategy

## Current State

Healthcare Organization is in a high-growth phase, recognized among the country's fastest-growing Medicare Advantage plans for 2025.

### Enrollment Momentum (2024)
| Plan | Growth | Signal |
|------|--------|--------|
| EasyCare (HMO) | 34% | Medicare-only market responding to 4.5-star quality |
| EasyCare Plus (D-SNP) | 60% | Dual-eligible segment is the breakout — 37,353 enrolled |
| Healthcare Organization Total (MAP) | 25% | Steady on 5-star foundation, but slower than peers |
| Net New Enrollees | 15,000 | Across all plans |

### Geographic Expansion
- **Current footprint:** 13 New York counties
- **Expansion target:** 25 additional counties where MLTC is already offered
- **Strategy:** Leverage existing MLTC network presence to launch Total (MAP) in new geographies

## Graph-Derived Insights

### Growth ↔ Data Quality Dependency
```
[Geographic Expansion] → REQUIRES → [Provider Network Adequacy]
                                          ↓
                               DEPENDS_ON → [Provider Directory Accuracy]
                                                    ↓
                                          REGULATED_BY → [CMS 90-Day Verification]
```
**Insight:** You cannot grow into 25 new counties without proving network adequacy. Network adequacy proof requires accurate provider directories. CMS suppresses directories that fail attestation. **Growth strategy is bottlenecked by data quality.**

### Growth ↔ Member Experience Tension
- 60% D-SNP growth means thousands of new members with different care needs than legacy MLTC population
- Healthcare Organization leadership acknowledges: "developing more creative member engagement strategies for newer plan populations with different needs"
- **Risk:** Applying MLTC engagement playbooks to D-SNP/MA populations will erode satisfaction scores

### Growth ↔ Provider Experience Risk
- 25-county expansion requires recruiting providers in markets where Healthcare Organization brand is weaker
- Provider onboarding friction (credentialing, portal setup, Availity enrollment, eviCore auth learning curve) creates lag between signing and active participation
- **Risk:** Provider network on paper ≠ provider network in practice

## Opportunities for Graphify

1. **Network Adequacy Modeling** — Graph-based coverage gap analysis across target counties, mapping provider specialties against member population health needs
2. **Growth Corridor Intelligence** — Identify which of the 25 target counties have highest dual-eligible density + lowest competitive MA penetration
3. **Provider Recruitment Prioritization** — Rank provider acquisition targets by specialty gaps, geographic coverage contribution, and quality scores
