# From Friction to Fix: The Technical Playbook

This is not theory. These are the specific problems Healthcare Organization has, why they exist, and exactly what we build to eliminate them.

---

## Friction 1: "Prove When You Knew"

### The Problem (spelled out)
CMS doesn't just ask: *"Is your provider directory accurate?"*

CMS asks: *"When did you become aware that Dr. Smith moved from 123 Main St to 456 Oak Ave, and what did you do about it, and how fast?"*

Most health plans — including Healthcare Organization — can answer the first question. Almost none can answer the second. Here's why:

**Today's workflow:**
1. Provider moves offices on January 15
2. Provider maybe tells Healthcare Organization. Maybe doesn't.
3. Someone at Healthcare Organization maybe gets the update. Maybe it comes through credentialing. Maybe a member calls and says "the address is wrong." Maybe a 90-day outreach call catches it.
4. Someone updates the directory. Maybe on February 10. Maybe March 3.
5. CMS auditor asks: "When did you know?"
6. Healthcare Organization can show the directory was updated March 3. But they **cannot prove** whether they knew on January 20 (from a member call) or February 5 (from a credentialing update) or March 1 (from a 90-day verification call).
7. **CMS issues a Corrective Action Plan** — not because the data was wrong, but because Healthcare Organization can't demonstrate their *awareness timeline*.

The gap isn't data accuracy. It's **data provenance** — the chain of custody for every piece of provider information.

### What We Build
**A Provider Data Lineage Graph.** Every provider record becomes a node. Every change to that record becomes a timestamped edge with:

```
(:ProviderRecord {npi, name, address, phone, specialty})
  -[:CHANGED_ON {
      timestamp: "2026-01-20T14:32:00Z",
      source: "member_complaint_call",
      detected_by: "call_center_agent_id_4421",
      field_changed: "practice_address",
      old_value: "123 Main St",
      new_value: "456 Oak Ave",
      response_action: "directory_update_ticket_created",
      response_timestamp: "2026-01-20T15:10:00Z",
      resolution_timestamp: "2026-01-21T09:00:00Z",
      sla_met: true
  }]->
(:ProviderRecord {updated})
```

Now when CMS asks "when did you know?" — Healthcare Organization pulls the graph and shows:
- **Awareness:** January 20 at 2:32 PM via member call
- **Response:** Ticket created 38 minutes later
- **Resolution:** Directory updated next business day
- **SLA:** Met (within 30-day CMS window, within internal 48-hour target)

**That's not a compliance answer. That's a compliance weapon.**

### Why This Matters for Healthcare Organization Specifically
Healthcare Organization is expanding into **25 new counties**. That means hundreds of new provider records they've never managed before. Without provenance tracking, every new county is a new compliance exposure. With it, expansion becomes a strength — they can demonstrate process rigor at scale.

---

## Friction 2: Three Vendors, Zero Visibility

### The Problem (spelled out)
A provider who works with Healthcare Organization touches **four separate systems** for one patient interaction:

| Step | System | Vendor | Login |
|------|--------|--------|-------|
| Check if auth needed | Healthcare Organization Provider Portal | Healthcare Organization | Login #1 |
| Submit prior auth | eviCore | Evernorth/Cigna | Login #2 |
| Submit claim | Availity | Availity | Login #3 |
| Respond to audit | Varis | Varis | Login #4 (if flagged) |

Each system has its own:
- Credentials and login process
- User interface and workflow
- Status terminology ("pending" in eviCore ≠ "pending" in Availity)
- Support phone number and hours
- SLA and deadline rules

**No single system shows the full picture.** A provider cannot see:
- "I submitted auth on Monday, it was approved Wednesday, I billed Thursday, and the claim is now in Varis review"
- That view doesn't exist anywhere. Not for the provider. Not for Healthcare Organization.

### What We Build
**A Claims Lifecycle Graph** that stitches the journey across all four vendors:

```
(:AuthRequest {evicore_id, service_type, submitted_date})
  -[:APPROVED_ON {date, reviewer}]->
(:Authorization {auth_number, valid_through})
  -[:ATTACHED_TO]->
(:Claim {availity_id, service_date, billed_amount})
  -[:ADJUDICATED_AS {status, paid_amount, denial_reason}]->
(:ClaimOutcome {paid|denied|disputed})
  -[:FLAGGED_BY]->
(:PostPaymentReview {varis_id, records_due_by, status})
```

**What this enables:**
- **Provider dashboard:** One view of auth → claim → payment → audit status across all vendors
- **Denial root cause:** Was the denial because auth expired? Wrong billing code? Cross-year error? The graph traces backward from denial to root cause in one query
- **Varis early warning:** Flag claims likely to trigger post-payment review BEFORE Varis requests records — giving providers time to prepare instead of scrambling in a 30-day window
- **Cross-year billing catch:** Pre-submission validation that rejects mixed 2025/2026 claims before they hit Availity — preventing 100% of those denials

### The Money Math
If Healthcare Organization processes 50,000 claims/year and the denial rate drops from (industry average) 10% to 7%:
- 1,500 fewer denials
- At ~$200 average admin cost per denial (rework, dispute, resubmission): **$300K/year saved**
- Plus: providers stop leaving the network over billing frustration

---

## Friction 3: 15,000 New Members, One Playbook

### The Problem (spelled out)
Healthcare Organization's 5-star rating was earned by deeply knowing their MLTC members — long-term, high-touch, relationship-based care. These are people Healthcare Organization has known for years.

Now 15,000 new members just walked in the door. They look different:

| | Legacy MLTC | New D-SNP (60% growth) | New EasyCare (34% growth) |
|---|---|---|---|
| **Relationship with the health plan** | Years | Days/weeks | Days/weeks |
| **Care complexity** | High (LTC needs) | Medium (dual-eligible) | Lower (Medicare-only) |
| **Engagement preference** | Phone, in-person | Unknown — never asked | Likely digital-first |
| **What drives satisfaction** | Care continuity, same aide | Benefits understanding, access | Cost, convenience, self-service |
| **CAHPS risk** | Low (known, managed) | High (unmet expectations) | High (wrong channel) |

Healthcare Organization is calling new EasyCare members the same way they call MLTC members. A 45-year-old Medicare beneficiary who chose a $25/month HMO does not want the same outreach as an 80-year-old with a home health aide. **One is annoyed. The other depends on it.**

The blended star rating masks this. Overall satisfaction might look fine while D-SNP satisfaction is cratering and MA satisfaction is mediocre. By the time it shows up in the annual star rating, it's 12-18 months too late.

### What We Build
**A Member Segment Intelligence Graph:**

```
(:Member {id, plan_type, enrollment_date, language, zip})
  -[:HAD_INTERACTION {type, channel, date, satisfaction_signal}]->
(:Touchpoint {call|portal_login|complaint|claim|care_visit})
  -[:RESULTED_IN {outcome, follow_up_needed}]->
(:Outcome {resolved|escalated|churned})
```

For each member segment, the graph reveals:
- **Which interaction patterns correlate with retention** (e.g., D-SNP members who get a benefits education call within 14 days of enrollment retain at 2x the rate)
- **Which channels each segment prefers** (MA members who never log into the portal are a churn signal; MLTC members who stop answering calls are a different signal)
- **Where care coordination breaks** (member sees 4 providers but no one coordinated the referral — visible as disconnected nodes in the care team subgraph)
- **Early churn signals** — complaint + missed appointment + provider change within 60 days = 85% churn probability

### The Money Math
Medicare Advantage plans receive ~$10K-$15K per member per year in capitation. Losing 5% of 15,000 new members = 750 members = **$7.5M-$11.25M annual revenue loss.** Reducing churn by even 2 percentage points pays for the entire engagement.

---

## Friction 4: The Varis Trap

### The Problem (spelled out)
Varis conducts post-payment reviews on behalf of the health plan. The dynamic is:

1. Healthcare Organization pays a claim
2. Weeks or months later, Varis flags it for clinical validation or DRG readmission review
3. Varis sends the provider a records request
4. Provider has **30 days** to respond with medical records
5. If the provider doesn't respond: **Healthcare Organization reclaims the full payment as overpayment**

The problem isn't the audit — it's the power asymmetry:
- Provider is running a practice. The Varis letter lands in a pile of mail.
- 30 days goes fast. There's no reminder system. No escalation. No grace period.
- The provider did the work. The patient got the care. But a missed deadline means the provider gets paid **zero**.
- After this happens once or twice, the provider stops accepting Healthcare Organization members.

Healthcare Organization doesn't see this as a Varis problem. They see it as "providers leaving the network" — and they wonder why. The graph connects the dots.

### What We Build
**A Provider Risk & Retention Graph:**

```
(:Provider {npi, name, network_status})
  -[:HAS_CLAIM {claim_id, paid_amount}]->
(:Claim)
  -[:FLAGGED_FOR_REVIEW {varis_id, records_due_date}]->
(:PostPaymentReview)
  -[:RESULTED_IN {outcome: recouped|upheld|no_response}]->
(:ReviewOutcome)

(:Provider)
  -[:RISK_SCORE {
      varis_recoupment_count: 3,
      dispute_frequency: "high",
      avg_claim_cycle_days: 45,
      engagement_trend: "declining",
      network_exit_probability: 0.72
  }]->
(:ProviderRiskProfile)
```

**What this enables:**
- **Proactive Varis outreach:** 15 days before the records deadline, Healthcare Organization (not Varis) calls the provider: "Hey, Varis is going to recoup claim #12345 if you don't submit records by March 30. Need help?" — that one call saves the provider relationship
- **Network attrition prediction:** Providers with 2+ recoupments AND declining claim volume AND no portal logins in 60 days = about to leave. Intervene before they do.
- **Varis pattern detection:** If Varis is flagging the same DRG codes repeatedly, that's a billing education opportunity — not an audit problem

---

## Friction 5: The Employee Knowledge Drain

### The Problem (spelled out)
Healthcare Organization has operated for 130 years. The nurses, care managers, and social workers who've been there for decades carry knowledge that doesn't exist in any system:
- Which providers actually return calls
- Which home health aide agencies are reliable in which neighborhoods
- Which members need their daughter called first before scheduling
- How to navigate the specific bureaucracy of a given county's Medicaid office

When these people retire — and they are retiring — that knowledge vanishes. The new hire gets a procedure manual. They don't get 20 years of relationship intelligence.

The 50+ language capability makes this worse. A Mandarin-speaking care manager who retires doesn't just take language skills — they take the entire relationship network of Mandarin-speaking members and providers in their territory.

### What We Build
**An Institutional Knowledge Graph:**

```
(:CareManager {id, languages, territory, tenure_years})
  -[:MANAGES {since, interaction_frequency}]->
(:Member {id, language, preferences})

(:CareManager)
  -[:HAS_RELATIONSHIP {quality, responsiveness, notes}]->
(:Provider {npi, specialty, languages})

(:CareManager)
  -[:KNOWS {type: "operational_knowledge"}]->
(:InsightNode {
    topic: "Queens Medicaid office",
    insight: "Submit prior auth requests before 10am — afternoon submissions get delayed by 2 days",
    verified_by: ["cm_4421", "cm_3392"],
    last_verified: "2026-02-15"
})
```

**What this enables:**
- **Succession planning:** When a care manager announces retirement, generate their full knowledge profile — every member relationship, provider connection, and operational insight — and transfer it to their successor
- **Language coverage mapping:** Real-time view of language capability by geography. If the only Bengali-speaking care manager in the Bronx leaves, flag it immediately
- **Operational insight preservation:** The "submit before 10am" tip lives forever in the graph, verified by multiple sources, instead of dying in someone's head

---

## The Signal: Where Healthcare Organization Should Start

| Priority | Friction | Impact | Build Time | Revenue at Risk |
|----------|---------|--------|-----------|----------------|
| **1** | Prove When You Knew (data lineage) | Blocks 25-county expansion | 6-8 weeks | Entire growth strategy |
| **2** | Three Vendors Zero Visibility (claims graph) | Provider attrition + denial cost | 8-10 weeks | $300K+/year admin savings |
| **3** | One Playbook for All Members (segment intelligence) | Churn in new populations | 6-8 weeks | $7.5M-$11.25M/year |
| **4** | The Varis Trap (provider risk scoring) | Silent network erosion | 4-6 weeks | Network adequacy |
| **5** | Knowledge Drain (institutional knowledge) | Irreversible once lost | 8-12 weeks | Competitive moat |

**#1 and #3 are existential.** The rest are expensive but survivable.

The play: start with provider data lineage (#1) because it's the compliance foundation for everything else. Layer member segment intelligence (#3) on top because that's where the revenue protection is. The rest follow.
