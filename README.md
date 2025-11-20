# Growth AI Agents

AI agents and brand guidelines for Superpower's growth marketing. Built as a Claude Code plugin with specialized agents for health-tech copywriting and compliance review.

## Overview

This repository contains:
- **Meta Ad Copywriter** - Writes conversion-focused Meta ads using Eugene Schwartz frameworks and 17 fundamental human desires
- **Clinical Claims Analyst** - Reviews health marketing copy for FDA/FTC compliance while maintaining message power
- **Brand Guide** - Single source of truth for Superpower's value propositions, approved claims, and messaging

## Quick Start

### Using the Agents

**Meta Ad Copywriter:**
```bash
# In Claude Code
@agent-meta-ad-copywriter write copy for this [attach image]
```

**Clinical Claims Analyst:**
```bash
# In Claude Code
@agent-clinical-claims-analyst review this copy for compliance:
[paste your ad copy]
```

### Repository Structure

```
.claude-plugin/               # Organization-wide shared resources
├── brand-guide.md           # Value props, approved claims, tone of voice
├── agents/
│   ├── meta-ad-copywriter.md        # Meta ad copywriting agent
│   └── clinical-claims-analyst.md   # Compliance review agent
└── plugin.json              # MCP server configuration

CLAUDE.md                    # Repository documentation for Claude Code
```

## Key Features

### Meta Ad Copywriter
- **Eugene Schwartz Frameworks**: 5 Stages of Awareness, Market Sophistication
- **17 Fundamental Human Desires**: Emotional persuasion framework
- **Staccato Rhythm Formatting**: 10-15 word sentences for Meta ads
- **Outcome-Focused Copy**: Verified principles from Hims/Bryan Johnson
- **Compliance Built-In**: Uses approved claims language only

### Clinical Claims Analyst
- **Risk Assessment**: RED/YELLOW/GREEN compliance flags
- **Aggressive-But-Defensible Rewrites**: Never removes claims, provides compliant alternatives
- **Rapid Analysis**: Complete review in under 4 minutes
- **Grey Area Toolkit**: 10 strategic rewriting techniques

### Brand Guide
- **Value Propositions**: $199/year, 100+ biomarkers, all-in-one platform
- **Approved Claims**: Verified from superpower.com
- **Clinical Team**: Harvard/UCLA/Stanford MD credentials
- **Competitive Positioning**: vs Function Health, concierge medicine
- **Tone of Voice**: Actual writing style from website (not manufactured)

## Core Principles

### 1. Brand Guide as Single Source of Truth

All agents reference `.claude-plugin/brand-guide.md` for:
- Current pricing and value propositions
- Approved vs. prohibited health claims language
- Clinical team credentials and verified study results
- Competitive comparisons

**Never hardcode value props in agents.** Always reference the brand guide.

### 2. Verified Claims Only

All claims in the brand guide are verified from superpower.com:
- ✅ 100+ biomarkers in 1 blood draw
- ✅ $199/year (most states), $499/year (NY & NJ)
- ✅ 24/7 access to Superpower's clinical team
- ✅ Protocols co-created with Harvard, UCLA & Stanford MDs
- ✅ Early detection capabilities for 1,000+ conditions

### 3. Outcome-Focused Copywriting

Lead with outcomes, not features:
- ❌ "100+ biomarkers tested"
- ✅ "Know exactly why you're tired. Fix it in 90 days."

## Agent Usage Examples

### Meta Ad Copywriter

**Input:** Ad creative showing iPhone with Superpower dashboard

**Output:** 3 copy variations matching ICP awareness stage:
1. Power & Control angle - "Complete health visibility. Finally."
2. Avoiding Uncertainty angle - "Stop guessing. Start knowing."
3. Health Optimization angle - "Optimize with real data"

Each variation includes:
- ICP analysis with demographics and psychographics
- 1-2 core desires identified from 17 fundamental desires
- Copy structured for awareness stage (Problem/Solution/Product/Most Aware)
- Staccato rhythm formatting (10-15 word sentences)
- 3-4 benefits with ✅ emoji
- Approved claims language only

### Clinical Claims Analyst

**Input:** Draft ad copy with health claims

**Output:** Compliance review with:
- Overall risk assessment (Low/Medium/High)
- YELLOW flags with slight adjustments for defensibility
- RED flags with 3 aggressive-but-compliant rewrites
- Strategic recommendations for maintaining conversion power

## MCP Server Integration

Configured in `plugin.json`:
- **Notion MCP**: Requires `NOTION_API_KEY` environment variable
- **PostHog MCP**: Requires `POSTHOG_API_KEY` and `POSTHOG_PROJECT_ID`

## Compliance Red Lines

### ❌ PROHIBITED Language
- "Prevent disease" or "Cure" or "Diagnose"
- "Replace your doctor"
- "Year-round clinical support" (use "24/7" instead)
- Guarantees of health outcomes

### ✅ APPROVED Language
- "Detect early signs" or "Early detection of"
- "Optimize your health" or "Track biomarkers"
- "24/7 access to Superpower's clinical team"
- "Personalized health recommendations"

## Updating the Brand Guide

When Superpower's value propositions or messaging changes:

1. **Research first**: Verify claims from superpower.com
2. **Update brand-guide.md**: Single location for all brand messaging
3. **Agents auto-sync**: All agents reference brand-guide.md automatically
4. **Version history**: Update the version history section in brand-guide.md

## Contributing

When adding new agents or updating existing ones:
1. Always reference `.claude-plugin/brand-guide.md` for value props
2. Verify examples from actual websites (don't manufacture)
3. Update `CLAUDE.md` with any architectural changes
4. Add version history notes to relevant files

## License

Apache-2.0

---

**Repository:** [github.com/superpowerdotcom/growth-ai-agents](https://github.com/superpowerdotcom/growth-ai-agents)

**Company:** [Superpower](https://superpower.com) - Preventive health through comprehensive biomarker testing
