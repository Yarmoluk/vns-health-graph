// Healthcare Organization Knowledge Graph — Neo4j Cypher Schema
// Import this into Neo4j for queryable graph intelligence

// ============================================================
// ORGANIZATION NODES
// ============================================================

CREATE (vns:Organization {
  id: 'vns-health',
  name: 'Healthcare Organization',
  legal_name: 'Healthcare Organization (formerly Visiting Nurse Service of New York)',
  founded: 1893,
  heritage_years: 130,
  headquarters: 'New York, NY',
  website: '[healthplan-website]',
  daily_patients_members: 73000,
  languages_supported: 50,
  charitable_care_2024: 69000000,
  medicare_star_rating: 4.5,
  mltc_star_rating: 5.0
});

CREATE (plans:BusinessUnit {id: 'vns-health-plans', name: 'Healthcare Organization Plans', total_members: 33000, plan_count: 5});
CREATE (homecare:BusinessUnit {id: 'vns-home-care', name: 'Healthcare Organization Home Care'});
CREATE (hospice:BusinessUnit {id: 'vns-hospice', name: 'Healthcare Organization Hospice Care'});
CREATE (behavioral:BusinessUnit {id: 'vns-behavioral-health', name: 'Healthcare Organization Behavioral Health'});
CREATE (research:BusinessUnit {id: 'vns-research', name: 'Center for Home Care Policy & Research'});

// ============================================================
// HEALTH PLAN NODES
// ============================================================

CREATE (easycare:HealthPlan {
  id: 'plan-easycare', name: 'Healthcare Organization EasyCare', plan_type: 'Medicare Advantage HMO',
  plan_id: 'H5549-012', monthly_premium: 25.00, cms_star_rating: 3.5,
  enrollment_growth_2024: 0.34, target_population: 'Medicare beneficiaries'
});

CREATE (easycareplus:HealthPlan {
  id: 'plan-easycare-plus', name: 'Healthcare Organization EasyCare Plus', plan_type: 'D-SNP HMO',
  plan_id: 'H5549-011', beneficiaries_enrolled: 37353,
  enrollment_growth_2024: 0.60, target_population: 'Dual-eligible without LTC needs'
});

CREATE (total:HealthPlan {
  id: 'plan-total', name: 'Healthcare Organization Total', plan_type: 'Medicaid Advantage Plus (MAP)',
  nysdoh_star_rating: 5.0, consecutive_5star_years: 2,
  enrollment_growth_2024: 0.25, expansion_target_counties: 25,
  distinction: 'New York top-rated MAP plan'
});

CREATE (mltc:HealthPlan {
  id: 'plan-mltc', name: 'Healthcare Organization MLTC', plan_type: 'Medicaid Managed Long Term Care',
  rating: 'highest rated MLTC in NYS'
});

CREATE (selecthealth:HealthPlan {
  id: 'plan-selecthealth', name: 'SelectHealth', plan_type: 'Medicaid Special Needs Plan',
  target_populations: 'HIV+, homeless',
  viral_load_suppression: 'significantly exceeds statewide average'
});

// ============================================================
// VENDOR / SYSTEM NODES
// ============================================================

CREATE (availity:VendorSystem {id: 'sys-availity', name: 'Availity', function: 'EDI claims submission', dependency: 'HIGH'});
CREATE (evicore:VendorSystem {id: 'sys-evicore', name: 'eviCore by Evernorth', function: 'Prior authorization', dependency: 'HIGH'});
CREATE (varis:VendorSystem {id: 'sys-varis', name: 'Varis', function: 'Post-payment clinical validation', dependency: 'MEDIUM'});
CREATE (medimpact:VendorSystem {id: 'sys-medimpact', name: 'MedImpact', function: 'Part D vaccine claims', dependency: 'LOW'});
CREATE (provportal:InternalSystem {id: 'sys-provider-portal', name: 'Provider Portal', access: '24/7'});
CREATE (memportal:InternalSystem {id: 'sys-member-portal', name: 'Member Portal', status: 'recently launched'});
CREATE (provdir:InternalSystem {id: 'sys-provider-search', name: 'Provider Directory', cms_verify_days: 90, update_sla_days: 30});

// ============================================================
// PROCESS NODES
// ============================================================

CREATE (claims:Process {id: 'proc-claims-submission', name: 'Claims Submission', timely_filing_days: 90});
CREATE (disputes:Process {id: 'proc-claim-disputes', name: 'Claim Disputes'});
CREATE (appeals:Process {id: 'proc-appeals', name: 'Coverage Appeals', decision_days: 60});
CREATE (priorauth:Process {id: 'proc-prior-auth', name: 'Prior Authorization', inpatient_home_sla: '1 business day'});
CREATE (cred:Process {id: 'proc-credentialing', name: 'Provider Credentialing'});
CREATE (ppr:Process {id: 'proc-post-payment-review', name: 'Post-Payment Review', record_deadline_days: 30});
CREATE (corrected:Process {id: 'proc-corrected-claims', name: 'Corrected Claims'});
CREATE (quality:Process {id: 'proc-quality-measurement', name: 'Quality Measurement', measures_tracked: 100});
CREATE (dirmaint:Process {id: 'proc-directory-maintenance', name: 'Directory Maintenance', cms_cycle_days: 90});

// ============================================================
// STAKEHOLDER NODES
// ============================================================

CREATE (members:Stakeholder {id: 'stakeholder-members', name: 'Plan Members', daily_served: 73000});
CREATE (providers:Stakeholder {id: 'stakeholder-providers', name: 'Network Providers'});
CREATE (employees:Stakeholder {id: 'stakeholder-employees', name: 'Healthcare Organization Workforce', languages: 50});
CREATE (regulators:Stakeholder {id: 'stakeholder-regulators', name: 'Regulators (CMS, NYSDOH)'});

// LEADER
CREATE (mgb:Leader {id: 'leader-gursoy-brickner', name: 'Mihriban Gursoy Brickner', title: 'SVP Quality & Clinical Operations'});

// ============================================================
// RELATIONSHIPS
// ============================================================

// Org structure
MATCH (a {id:'vns-health'}), (b {id:'vns-health-plans'}) CREATE (a)-[:OPERATES]->(b);
MATCH (a {id:'vns-health'}), (b {id:'vns-home-care'}) CREATE (a)-[:OPERATES]->(b);
MATCH (a {id:'vns-health'}), (b {id:'vns-hospice'}) CREATE (a)-[:OPERATES]->(b);
MATCH (a {id:'vns-health'}), (b {id:'vns-behavioral-health'}) CREATE (a)-[:OPERATES]->(b);
MATCH (a {id:'vns-health'}), (b {id:'vns-research'}) CREATE (a)-[:OPERATES]->(b);

// Plans
MATCH (a {id:'vns-health-plans'}), (b {id:'plan-easycare'}) CREATE (a)-[:ADMINISTERS]->(b);
MATCH (a {id:'vns-health-plans'}), (b {id:'plan-easycare-plus'}) CREATE (a)-[:ADMINISTERS]->(b);
MATCH (a {id:'vns-health-plans'}), (b {id:'plan-total'}) CREATE (a)-[:ADMINISTERS]->(b);
MATCH (a {id:'vns-health-plans'}), (b {id:'plan-mltc'}) CREATE (a)-[:ADMINISTERS]->(b);
MATCH (a {id:'vns-health-plans'}), (b {id:'plan-selecthealth'}) CREATE (a)-[:ADMINISTERS]->(b);

// Provider interactions
MATCH (a {id:'stakeholder-providers'}), (b {id:'sys-availity'}) CREATE (a)-[:SUBMITS_CLAIMS_VIA]->(b);
MATCH (a {id:'stakeholder-providers'}), (b {id:'sys-evicore'}) CREATE (a)-[:SUBMITS_AUTH_VIA]->(b);
MATCH (a {id:'stakeholder-providers'}), (b {id:'sys-provider-portal'}) CREATE (a)-[:ACCESSES]->(b);
MATCH (a {id:'sys-varis'}), (b {id:'stakeholder-providers'}) CREATE (a)-[:AUDITS]->(b);

// Process flows
MATCH (a {id:'sys-availity'}), (b {id:'proc-claims-submission'}) CREATE (a)-[:ENABLES]->(b);
MATCH (a {id:'sys-evicore'}), (b {id:'proc-prior-auth'}) CREATE (a)-[:MANAGES]->(b);
MATCH (a {id:'proc-claims-submission'}), (b {id:'proc-claim-disputes'}) CREATE (a)-[:ESCALATES_TO]->(b);
MATCH (a {id:'proc-claim-disputes'}), (b {id:'proc-appeals'}) CREATE (a)-[:ESCALATES_TO]->(b);

// Regulatory
MATCH (a {id:'stakeholder-regulators'}), (b {id:'proc-directory-maintenance'}) CREATE (a)-[:MANDATES]->(b);
MATCH (a {id:'stakeholder-regulators'}), (b {id:'proc-quality-measurement'}) CREATE (a)-[:EVALUATES_VIA]->(b);

// Leadership
MATCH (a {id:'leader-gursoy-brickner'}), (b {id:'proc-quality-measurement'}) CREATE (a)-[:LEADS]->(b);

// Care delivery
MATCH (a {id:'stakeholder-employees'}), (b {id:'stakeholder-members'}) CREATE (a)-[:DELIVERS_CARE_TO {daily_touchpoints: 73000}]->(b);
