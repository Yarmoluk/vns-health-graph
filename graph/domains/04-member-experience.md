# Domain: Member Experience

## Current State

Healthcare Organization serves 73,000+ patients and members daily across five health plans, with personal support from nurses, pharmacists, and social workers. The organization recently launched an online member portal.

### Strengths
- **5-star MLTC rating** (consecutive years) — validated member satisfaction in legacy population
- **4.5-star Medicare Advantage** — highest in NYC and Long Island
- **50+ languages** — deep cultural and linguistic accessibility
- **SelectHealth viral load suppression** — significantly exceeds statewide average for vulnerable populations
- **Integrated care model** — home care, hospice, behavioral health, and health plans under one roof

### Emerging Challenges

#### Population Shift Problem
| Segment | Profile | Engagement Need |
|---------|---------|----------------|
| Legacy MLTC | Long-term, high-touch, known | Relationship continuity, care plan stability |
| New D-SNP (60% growth) | Dual-eligible, diverse needs, less familiar with Healthcare Organization | Onboarding, education, trust-building |
| New EasyCare (34% growth) | Medicare-only, may be healthier, digitally savvy | Self-service, portal adoption, preventive care |
| SelectHealth | HIV+, homeless — highest acuity | Crisis response, housing support, adherence |

**The 5-star rating was built on legacy MLTC relationships.** The 15,000 new enrollees have fundamentally different expectations. Applying the same playbook risks:
- Lower CAHPS scores from unmet expectations
- Star rating erosion (MLTC ≠ MA measurement sets)
- Member churn in competitive MA market

#### Portal Adoption Risk
- Member portal recently launched — no adoption metrics available yet
- 50+ language requirement means portal must be multilingual or risk excluding core populations
- Digital divide: many MLTC/D-SNP members may prefer phone or in-person interaction

#### Care Coordination Complexity
```
MEMBER touches:
  ├── Primary Care Physician
  ├── Care Manager (Health Plan)
  ├── Home Health Aide
  ├── Specialist(s)
  ├── Pharmacist
  ├── Social Worker
  └── Behavioral Health (if applicable)
```
Each touchpoint generates data. Fragmented data = fragmented experience.

## Graph-Derived Insights

### Member Experience ↔ Provider Experience Link
```
[Provider Leaves Network]
    → [Member's Provider No Longer In-Network]
        → [Member Must Find New Provider]
            → [Directory May Be Inaccurate]
                → [Member Calls Wrong Number / Goes to Wrong Address]
                    → [Member Frustration → Complaint → CAHPS Impact]
```

**Provider experience and member experience are not separate domains.** They are connected through the provider directory, and the directory is a data quality problem.

### Engagement Segmentation Gap
```
[All Members Get Same Outreach]
    → [MLTC Members: Fine — Already Engaged]
    → [New D-SNP Members: Overwhelmed or Under-Served]
    → [New MA Members: Want Self-Service, Get Phone Calls]
        → [Satisfaction Divergence by Segment]
            → [Blended Star Rating Masks Segment Problems]
```

## Opportunities for Graphify

1. **Member Journey Graph** — Map every member interaction across care team, portal, phone, and in-person — segmented by plan type and enrollment tenure
2. **Segment-Specific Engagement Intelligence** — Graph-based identification of which engagement patterns drive satisfaction for each member segment (MLTC vs D-SNP vs MA)
3. **Care Coordination Network** — Visualize the complete care team around each member, identifying coordination gaps and communication breakdowns
4. **Churn Prediction Model** — Graph features (care gaps, provider changes, complaint frequency, portal non-adoption) as inputs to member retention scoring
