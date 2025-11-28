---
name: create-brief
description: Creates a static ad creative brief by researching Reddit for persona insights, then generating 20-50 ad concepts optimized for Meta Andromeda
---

# Creative Brief Workflow

This command uses the **meta-creative-strategist** agent to create high-volume, Andromeda-optimized creative briefs.

## Step 1: Gather Brief Requirements

Ask the user for:

1. **Target Segment**: Which 30+ women segment?
   - 30-35: Early signal women (unexplained fatigue, early hormonal shifts)
   - 35-42: Transition warriors (active perimenopause, juggling life)
   - 42-50: Optimization generation (deep in transition, cracking the code)
   - Or: All segments with different approaches

2. **Core Pain Point**: What specific problem?
   - Example: "Exhausted but doctors say labs are normal"
   - Example: "Brain fog and mood swings starting in early 30s"
   - Example: "Dismissed by healthcare system"

3. **Campaign Volume**: How many concepts needed?
   - Standard: 20-30 concepts
   - Full Andromeda: 40-50 concepts

## Step 2: Research & Insights

Use the **meta-creative-strategist** agent with the **insight-generation** skill:

```
Research this persona on Reddit:
- Segment: [user's segment choice]
- Core Pain Point: [user's description]

Generate 5 actionable insights mapped to Steven Reiss desires.
```

Present insights to user for approval before proceeding.

## Step 3: Concept Matrix

Once insights are approved, use the **concept-matrix** skill:

```
Build a concept matrix from these insights:
[Paste approved insights]

Generate [20-50] concepts across:
- Multiple desires (Power, Independence, Curiosity, Acceptance, Tranquility)
- Multiple awareness stages (Problem Aware, Solution Aware, Product Aware)
- Multiple formats (Single image, Carousel, UGC-style)
```

## Step 4: Brief Top Concepts

Use the **brief-writing** skill for the top 10 priority concepts:

```
Create complete briefs for these top 10 concepts:
[Paste priority concepts]

Include:
- 3 headline variations (H1.0, H1.1, H1.2)
- Hook and body copy
- Visual direction
- Format specs
- Compliance notes
```

## Step 5: Compliance Check

Use the **compliance-check** skill on all copy:

```
Review all briefs for FDA/FTC compliance.
Flag RED/YELLOW issues and provide aggressive-but-defensible rewrites.
```

## Step 6: Deliver Final Package

Present to user:

1. **Insight Report** - 5 core insights with evidence
2. **Concept Matrix** - Full 20-50 concept grid
3. **Top 10 Briefs** - Complete creative briefs
4. **Testing Roadmap** - Priority order and success metrics
5. **Compliance Summary** - All flags resolved

Save options:
- Markdown: `briefs/[date]-[segment].md`
- Notion: If MCP connected, create in Briefs database

---

## Quick Reference

**Agent Used:**
- `meta-creative-strategist` - Maya, the 30+ women creative strategist

**Skills Invoked:**
- `insight-generation` - Reddit research → actionable insights
- `concept-matrix` - Systematic 20-50+ concept generation
- `brief-writing` - Designer-ready briefs
- `compliance-check` - FDA/FTC review with rewrites

**Reference Files (at `${CLAUDE_PLUGIN_ROOT}/`):**
- `brand-guide.md` - Approved claims and value props
- `steven-reiss-16-desires.md` - Desire framework
- `meta-ad-formats.md` - Format specifications
- `compliance-guide.md` - Regulatory guardrails
- `marketing-personas.md` - ICP definitions

**Expected Output:**
- 5 insights with desire mapping
- 20-50 concept matrix
- 10 complete briefs with 3 headline variations each
- Testing priority matrix
- Compliance-cleared copy

**Typical Duration:** 15-20 minutes for full workflow
