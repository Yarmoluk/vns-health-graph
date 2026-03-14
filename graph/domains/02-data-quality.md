# Domain: Data Quality

## Current State

VNS Health tracks 100 quality measures monthly across clinical outcomes, member satisfaction, and operational excellence. SVP Mihriban Gursoy Brickner drives a culture where "every business lead knows what their metrics are."

### What's Working
- Monthly reporting cadence enables rapid detection of underperformance
- Multi-source data integration (care managers, home health agencies, PCPs)
- 5-star MLTC quality rating validates data-driven approach
- Leadership accountability — quality metrics cascade to every team

### Where the Gaps Are

#### Provider Directory Accuracy (Highest Regulatory Risk)
| Requirement | Standard | Consequence of Failure |
|-------------|----------|----------------------|
| Provider info verification | Every 90 days | CMS Corrective Action Plan |
| Directory updates | Within 30 days of change | Compliance violation |
| Annual attestation | Yearly | Directory **suppressed** on Medicare Plan Finder |
| Documentation of awareness | Continuous | CAP even if data was accurate — must prove process |

**Critical insight from CMS:** Many Corrective Action Plans are issued NOT because directory information was wrong, but because the plan **could not demonstrate when it became aware of an inaccuracy and what it did in response.** This is a process documentation problem, not a data accuracy problem.

#### Claims Data Integrity
- Cross-year billing rule (2025/2026 services on separate claims) creates systematic denial risk
- Corrected claims require precise replacement codes (UB-04 freq code 7, CMS-1500 resubmission code 7) — errors cascade
- Provider claim dispute timelines vary by provider type (60 days to 6 months) — inconsistency breeds data quality gaps in dispute resolution tracking

#### Member Data
- 50+ languages served → member communication preference data must be accurate
- Newer plan populations (D-SNP, MA) have different demographic profiles than legacy MLTC
- Member portal recently launched — adoption data and usage patterns are nascent

## Graph-Derived Failure Cascade

```
[Provider Changes Address]
    → NOT CAPTURED within 30 days
        → [Directory Inaccuracy]
            → [Member Can't Find Provider]
                → [Member Satisfaction Drops]
                    → [Star Rating Impact]
                        → [Premium Revenue Affected]
            → [CMS Audit Finds Gap]
                → [Can't Prove Awareness Timeline]
                    → [Corrective Action Plan]
                        → [Directory Suppressed on Plan Finder]
                            → [Enrollment Growth Stalls]
```

**This single failure cascade connects data quality → member experience → growth → revenue.** It is the highest-leverage problem in the graph.

## Opportunities for Graphify

1. **Provider Data Lineage Graph** — Track every provider data change with timestamp, source, and response action — solving the CMS "awareness documentation" gap
2. **Claims Integrity Monitor** — Graph-based detection of cross-year billing violations, replacement code errors, and duplicate submissions before they become denials
3. **Directory Accuracy Scorecard** — Real-time provider directory health score with 90-day verification countdown, change detection, and attestation readiness
4. **Quality Measure Correlation Engine** — Map relationships between 100 quality measures to identify leading indicators and cascade effects
