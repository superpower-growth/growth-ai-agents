---
name: create-brief
description: Creates a static ad creative brief by researching Reddit for persona insights, then generating 3-5 ad concepts
---

# Creative Brief Workflow

This command runs a two-agent workflow to create a performance creative brief for static ads.

## Step 1: Gather Brief Requirements

Ask the user for:

1. **Target Persona**: Who are we creating ads for?
   - Example: "Busy moms 35-45 worried about energy levels"
   - Example: "Biohackers who want comprehensive blood work"
   - Example: "Health-anxious men 40+ concerned about preventive care"

2. **Core Problem/Pain Point**: What specific problem are they trying to solve?
   - Example: "Constant fatigue despite eating healthy"
   - Example: "Not getting enough data from annual checkups"
   - Example: "Worried something's wrong but doctors say they're fine"

3. **Campaign Focus (optional)**: Any specific product focus or angle?
   - Example: "Emphasize comprehensive testing vs. standard panels"
   - Example: "Focus on convenience and at-home options"

## Step 2: Run Reddit Research

Once you have the persona and problem, use the **reddit-persona-researcher** agent:

```
Research this persona on Reddit:
- Persona: [user's description]
- Core Problem: [user's description]
- Focus: [any specific angle]

Find authentic language, pain points, and quotes we can use for ad copy.
```

Wait for the research results.

## Step 3: Review Research with User

Present the research findings to the user:

1. Show the **key pain points discovered**
2. Show the **golden quotes** that could inspire copy
3. Show the **desire mapping** (which Steven Reiss desires are strongest)

Ask: "Does this research capture the right pain points? Any angles you want me to emphasize or avoid in the brief?"

## Step 4: Generate Creative Brief

Once the user approves the research direction, use the **static-ad-brief-writer** agent:

```
Create a static ad brief based on this Reddit research:

[Paste the research output]

Requirements:
- 3-5 distinct ad concepts
- Map each to Steven Reiss desires
- Include headline variations (H1.0, H1.1, H1.2)
- Provide visual direction
- Recommend Meta ad formats
```

## Step 5: Present Brief for Approval

Show the complete brief to the user with:

1. **Summary of concepts** - Quick overview of all 3-5 concepts
2. **Testing matrix** - Priority order for testing
3. **Next steps** - What designer needs to execute

Ask: "Ready to save this brief? I can save it to markdown or help you put it in Notion."

## Step 6: Save Output

Based on user preference:

**Option A: Save to Markdown**
Save the brief to `briefs/[date]-[persona-name].md`

**Option B: Save to Notion** (if Notion MCP is connected)
Create a new page in the designated Briefs database

---

## Quick Reference

**Agents Used:**
- `reddit-persona-researcher` - Finds authentic persona language on Reddit
- `static-ad-brief-writer` - Transforms research into ad concepts

**Reference Files:**
- `steven-reiss-16-desires.md` - Desire framework
- `brand-guide.md` - Approved claims and value props
- `meta-ad-formats.md` - Format specifications
- `compliance-guide.md` - Regulatory guardrails

**Expected Output:**
- 3-5 ad concepts with:
  - 3 headline variations each
  - Complete body copy
  - Visual direction
  - Format recommendations
- Testing priority matrix
- Compliance notes

**Typical Duration:** 10-15 minutes for full workflow
