# VNS Health — Intelligent Knowledge Graph

**Organization:** VNS Health (formerly Visiting Nurse Service of New York)
**Domain:** Health Plan / Managed Care — Medicare, Medicaid, MLTC, D-SNP
**Geography:** New York State (NYC, Long Island, 13+ counties)
**Members Served:** 73,000+ patients and members daily
**Heritage:** 130+ years of home-based care

## What This Graph Does

Maps VNS Health's operational ecosystem across **six strategic domains** — surfacing the connections between growth levers, data quality gaps, provider friction, member experience, employee experience, and claims/authorization workflows.

This is not a slide deck. It's a **queryable intelligence layer** that reveals:
- Where data quality failures cascade into member churn
- Which provider pain points drive network attrition
- How claims bottlenecks create authorization backlogs
- Where growth strategy collides with operational capacity

## Graph Structure

```
graph/
├── nodes/           # Entity definitions (orgs, systems, processes, people, metrics)
├── edges/           # Relationship mappings between entities
├── domains/         # Domain-specific analysis (6 strategic domains)
├── patterns/        # Cross-domain failure patterns and opportunity maps
└── visualizations/  # D3.js interactive graph + static views
```

## Strategic Domains

| Domain | Key Insight |
|--------|------------|
| **Growth** | 34-60% enrollment growth (2024) — but geographic expansion into 25 new counties requires provider network adequacy VNS hasn't proven at scale |
| **Data Quality** | 100 quality measures tracked monthly, but provider directory accuracy (CMS 90-day verification) is the compliance tripwire |
| **Provider Experience** | Claims disputes, 90-day filing windows, corrected claim complexity, and Varis post-payment reviews create provider fatigue |
| **Member Experience** | 5-star MLTC rating masks emerging challenge: newer plan populations (EasyCare, D-SNP) have different engagement needs |
| **Employee Experience** | 50+ language capability is a moat, but care manager burnout across 73K daily touches is the silent risk |
| **Claims & Authorization** | Availity EDI + eviCore prior auth = two-vendor dependency; cross-year billing rule (2025/2026 split) adds denial risk |

## Built With

[Graphify.md](https://graphifymd.com) — Knowledge graphs that make AI actually useful.

---

*Generated: March 14, 2026*
