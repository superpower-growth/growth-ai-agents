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
- `subscription_created` - New subscription (value in cents: 19900=$199, 39900=$399)
- `order_upgraded` - Subscription upgrades (18900-19900 cents)
- `order_created` - Lab tests (21000-188600 cents)
- `$pageview` - Page views (use `$initial_current_url` for landing page attribution)
- `checkout_completed` - E-commerce (EXCLUDED due to duplicate tracking issues)

**State attribution:** `coalesce(person.properties.state, person.properties.$geoip_subdivision_1_code)` (98%+ coverage)

**Revenue formula:**
```sql
sum(if(properties.value > 0, properties.value / 100, 0)) as revenue
FROM events WHERE event = 'subscription_created'
```

**ARPU:** subscription_created revenue / USER_CREATED count (by week + state)

**Data quality notes:**
- E-commerce excluded (duplicate tracking)
- Filter `properties.value > 0` (excludes $0 trials)
- Complex JOINs timeout - use weekly aggregations

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
