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
.claude-plugin/               # Organization-wide shared resources
├── brand-guide.md           # Single source of truth for Superpower's value props, approved claims, and messaging
├── agents/
│   ├── meta-ad-copywriter.md        # Writes Meta ad copy using Eugene Schwartz frameworks + 17 human desires
│   └── clinical-claims-analyst.md   # Reviews health claims for FDA/FTC compliance
└── plugin.json              # MCP server configuration (Notion, PostHog)

.claude/                     # Local user configuration (currently empty)
└── agents/                  # Empty - agents moved to .claude-plugin for sharing
```

## Core Architecture Principles

### 1. Brand Guide as Single Source of Truth

**ALL agents reference** `.claude-plugin/brand-guide.md` for:
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

### 3. MCP Server Integration

Configured in `plugin.json`:
- **Notion MCP**: Requires `NOTION_API_KEY` env var
- **PostHog MCP**: Requires `POSTHOG_API_KEY` and `POSTHOG_PROJECT_ID` env vars

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
- **Pricing**: $199/year (most states), $499/year (NY & NJ)
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
