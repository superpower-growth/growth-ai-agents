# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains **AI agents and brand guidelines** for Superpower's growth marketing. It's organized as a Claude Code plugin with specialized agents for health-tech copywriting and compliance review.

**Key Context:**
- **Company**: Superpower - preventive health company offering comprehensive biomarker testing
- **Purpose**: AI agents that write Meta ads and review health claims for regulatory compliance
- **Architecture**: Claude Code plugin system with shared brand resources

## Directory Structure

```
growth-ai-agents/
├── marketplace.json         # Marketplace manifest for plugin distribution
├── plugins/
│   └── superpower-growth-agents/    # Main plugin directory
│       ├── plugin.json              # Plugin metadata & MCP server configuration
│       ├── brand-guide.md          # Single source of truth for Superpower messaging
│       ├── agents/                 # Custom AI agents
│       │   ├── meta-ad-copywriter.md        # Meta ad copy using Eugene Schwartz frameworks
│       │   ├── clinical-claims-analyst.md   # Health claims compliance reviewer
│       │   └── static-ad-brief-writer.md    # Creative brief generator with Reddit research
│       ├── marketing-personas.md    # ICP definitions and targeting guides
│       ├── meta-ad-formats.md      # Meta ad format specifications
│       └── steven-reiss-16-desires.md  # Steven Reiss desire framework reference
└── .claude/                 # Local user configuration
    └── agents/              # Local development agents
```

## Core Architecture Principles

### 1. Brand Guide as Single Source of Truth

**ALL agents reference** `plugins/superpower-growth-agents/brand-guide.md` for:
- Value propositions and pricing
- Approved vs. prohibited health claims language
- Clinical team credentials and verified social proof
- Competitive positioning (Function Health, concierge medicine)
- Actual tone of voice from website (verified, not manufactured)

**Critical**: Never hardcode value props in agents. Always reference brand guide to ensure consistency and easy updates.

### 2. Agent System Design

**meta-ad-copywriter Agent:**
- Uses Eugene Schwartz's 5 Stages of Awareness framework
- Channels 17 fundamental human desires (not features → outcomes)
- Focuses on 1-2 primary desires per ad for sharp messaging
- Meta ad compliance built-in (approved vs. prohibited language)
- Output-focused copy style verified from Hims/Bryan Johnson

**clinical-claims-analyst Agent:**
- Identifies RED/YELLOW/GREEN compliance flags
- Provides aggressive-but-defensible rewrites
- Never removes claims - always provides compliant alternatives
- Rapid analysis in under 4 minutes

**static-ad-brief-writer Agent:**
- Creates comprehensive static ad briefs for designers
- Performs Reddit research to find authentic audience pain points
- Maps messaging to Steven Reiss 16 fundamental desires
- Recommends Meta ad formats (carousel, single image, video)
- Structures creative briefs with target template format

### 3. MCP Server Integration

Configured in `plugin.json`:
- **Notion MCP**: Requires `NOTION_API_KEY` env var
- **PostHog MCP**: Requires `POSTHOG_API_KEY` and `POSTHOG_PROJECT_ID` env vars

## Superpower Analytics Guide

### PII Protection Guidelines

**⚠️ CRITICAL: Avoid Querying Individual-Level PII**

**NEVER query:** `email`, `first_name`, `last_name`, `name`, `phone`, `birthday`, individual `person_id` in result sets

**Always aggregate:** Use `count(DISTINCT person_id)`, `sum()`, `avg()` grouped by state/week/month - NO individual rows

**Best practices:**
- Always use state fallback: `coalesce(person.properties.state, person.properties.$geoip_subdivision_1_code)`
- Filter incomplete weeks: `WHERE timestamp < toStartOfWeek(now())`
- Convert cents to dollars: `properties.value / 100`
- Filter zero values: `WHERE properties.value > 0`

### PostHog Data Model Essentials

**Key Events:**
- `USER_CREATED` - New user signup (use for user counts, ARPU denominators)
- `$pageview` - Page views (use `$initial_current_url` for landing page attribution)

**Revenue Events (all values in cents):**
- `CHECKOUT_PROCESSED` - **Primary revenue event** (replacing deprecated `subscription_created`)
- `SUBSCRIPTION_CREATED` - New subscriptions (value in cents: 19900=$199, 39900=$399)
- `ORDER_CREATED` - Lab test orders during onboarding or services page
- `ORDER_UPGRADED` - Lab test upgrades during onboarding or services page
- `ORDERED_PRODUCT` - Marketplace e-commerce sales (supplements + Rx) - **No COGS property available**
- ⚠️ **DEPRECATED:** `subscription_created` (lowercase) - being replaced by CHECKOUT_PROCESSED

**State attribution:** `coalesce(person.properties.state, person.properties.$geoip_subdivision_1_code)` (98%+ coverage)

**Revenue formula (all revenue events combined):**
```sql
sum(if(properties.value > 0, properties.value / 100, 0)) as revenue
FROM events
WHERE event IN (
  'CHECKOUT_PROCESSED',
  'SUBSCRIPTION_CREATED',
  'ORDER_CREATED',
  'ORDER_UPGRADED',
  'ORDERED_PRODUCT'
)
AND properties.value > 0
```

**Customer Acquisition Events:**
- `CHECKOUT_PROCESSED` + `SUBSCRIPTION_CREATED` (for new customer counts)
- **NOT** `subscription_created` (deprecated lowercase variant)

**ARPU:** Total revenue / USER_CREATED count (by week + state)

**Data quality notes:**
- Always filter `properties.value > 0` (excludes $0 trials)
- `subscription_created` (lowercase) is deprecated - use CHECKOUT_PROCESSED or SUBSCRIPTION_CREATED
- Complex JOINs timeout - use weekly aggregations

### Attribution & Revenue Definitions (Source of Truth)

**Last Updated:** December 2, 2025
**Reference Dashboard:** [Growth Source of Truth](https://us.posthog.com/project/195693/dashboard/806720)

**Attribution Model:**
- **Default: First-Touch Attribution** - Use for strategic reporting and channel performance
- **Event-Level Attribution** - Only use when optimizing specific campaigns

**Total Revenue Calculation:**
Sum of 4 revenue events (all values in cents):
1. `CHECKOUT_PROCESSED` - Primary event for new subscriptions ($199, $399)
2. `order_created` - Lab test orders during onboarding/services (⚠️ only ~39% have revenue values)
3. `order_upgraded` - Lab test upgrades (100% have revenue values)
4. `ORDERED_PRODUCT` - Marketplace e-commerce (supplements + Rx, server-side event)

**Core Metrics Definitions:**
- **Sessions:** Unique session count (traffic volume)
- **Registrations (`registration_created`):** New user signups - always cohorted by signup week
- **Checkouts:** `CHECKOUT_PROCESSED` event count
- **Revenue:** Sum of 4 revenue events in dollars (filter out $0 values)
- **First Week ARPU:** Revenue per paying member in first 7 days (excludes $0 trials) ÷ Paying `registration_created` (users with $0+ revenue in first week, grouped by cohort week + state)
- **Member Acquisition (First Week - Cohorted):** Unique paying members who made their first purchase within 7 days of signup, grouped by signup week (use for first-week conversion rates)
- **Marketplace Revenue Margin:** All `ORDERED_PRODUCT` transactions calculated at 20% margin in ARPU metrics (estimated profit contribution)

**Cohorted vs Non-Cohorted Analysis:**
- **Cohorted (First Week):** Groups by signup week, counts conversions within 7 days → Use for conversion rate analysis
- **Non-Cohorted:** Groups by purchase week, counts all conversions → Use for weekly revenue tracking

**Cohorted Conversion Funnel Logic:**
- **Cohort Week:** Users grouped by first session week (`toStartOfWeek(min(timestamp))` for `$pageview` events)
- **Conversion Window:** 7 days from first session (not from signup)
- **Lead Event:** `registration_started` (not USER_CREATED - avoids post-payment timing issues)
- **Session → Lead:** Users who fired `registration_started` within 7 days / total sessions
- **Lead → Subscription:** Leads who converted within 7 days / total leads
- **Session → Subscription:** Leads who converted within 7 days / total sessions
- **Alignment Rule:** All 3 charts use same cohort definition (first session week) and same 7-day window

**Channel Classification (6 Primary Channels):**
1. **Growth Marketing:** Paid Search, Paid Social, and Podcast advertising
2. **Direct/None + Organic Home Page:** Direct traffic (bookmarks, typed URLs, unknown sources) AND organic search landing on home page (`person.properties.$virt_initial_channel_type IN ('Direct', 'None')` OR `person.properties.$virt_initial_channel_type = 'SEO'` with home page landing)
3. **SEO:** Organic Search from search engines (Google, Bing) and LLM tools (ChatGPT, Perplexity, Claude, Gemini, Copilot, Bard, You.com, Phind). **Excludes home page traffic** and `/welcome` page to prevent double-counting
4. **Email:** Email marketing campaigns and newsletters
5. **Organic Social:** Unpaid social media (Instagram, LinkedIn, Twitter, Facebook, TikTok, YouTube)
6. **Referral/Affiliate:** Referral programs and affiliate partnerships (**excludes LLM traffic** - counted in SEO to prevent double-counting)

## Brand Guide Maintenance

**When updating Superpower's value propositions or messaging:**

1. **Research first**: Use sub-agents to verify claims from superpower.com
2. **Update brand-guide.md**: Single location for all brand messaging
3. **Agents auto-sync**: All agents reference brand-guide.md, no manual updates needed
4. **Version history**: Update the version history section at bottom of brand-guide.md

**Verification Protocol:**
- Always verify pricing, biomarker counts, location counts from actual website
- Use sub-agents to browse superpower.com before making claims
- Flag anything as "verified from website" vs. "inferred" vs. "speculative"

## Agent Guidelines

### Writing Ad Copy with meta-ad-copywriter

**Systematic Process:**
1. **Image Analysis** → Identify ICP, demographics, awareness stage
2. **Core Desire Identification** → Select 1-2 primary desires from 17 fundamental desires
3. **Copy Structure** → Match structure to awareness stage (Problem/Solution/Product/Most Aware)
4. **Outcome Focus** → Lead with outcomes, not features ("Know exactly why you're tired" vs. "100+ biomarkers")

**Key Frameworks:**
- Eugene Schwartz 5 Stages of Awareness
- Market Sophistication (Stage 3-4 for health testing)
- 17 Fundamental Human Desires (Health & Vitality, Power & Control, Avoiding Uncertainty, etc.)

**Formatting for Meta Ads:**
- Headlines: 3-8 words
- Hook: 5-10 words
- Body: 10-15 words per sentence (NOT ultra-short staccato)
- Blank lines between sentences
- 3-4 benefits with ✅ emoji (grouped, no blank lines between them)

### Reviewing Claims with clinical-claims-analyst

**Risk Assessment:**
- **GREEN** (no change needed) - don't mention
- **YELLOW** (grey area) - provide slight adjustments
- **RED** (indefensible) - requires rewrite

**Key Compliance Rules:**
- ✅ CORRECT: "24/7 access to Superpower's clinical team"
- ❌ WRONG: "24/7 access to Harvard/UCLA/Stanford clinicians"
- ✅ CORRECT: "Protocols co-created with Harvard, UCLA & Stanford MDs"
- ❌ WRONG: "Year-round clinical support" (use "24/7" instead)

## Important Context

### Superpower Value Prop Summary
- **Pricing**: $199/year (most states), $499/year (NY & NJ: $400/year + $99 mandatory at-home draw fee)
- **Mechanism**: 100+ biomarkers in 1 draw → personalized protocols → marketplace action
- **Key Message**: "Most companies stop at testing. We go further."
- **All-in-one platform**: Diagnostics → Protocols → Marketplace (supplements + Rx)

### Compliance Red Lines
Never claim: "prevent disease", "cure", "diagnose", "treat", "fix"
Always use: "detect early signs", "optimize health", "track biomarkers", "may help support"

### Tone of Voice (Verified from Website)
- **NOT** ultra-short staccato (that was manufactured)
- **ACTUAL**: Confident expert who explains clearly (12-20 word sentences)
- Empowering, not scary
- Data-driven but accessible
- Professional but conversational

## Git Workflow

This is a documentation/configuration repository with no build process or tests. Changes are typically:
1. Updating brand-guide.md with verified claims
2. Refining agent prompts based on performance
3. Adding new agents for additional marketing channels

**No CI/CD, no package.json, no build commands needed.**
