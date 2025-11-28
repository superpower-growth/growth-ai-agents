# Growth AI Agents 🚀

Your AI-powered growth team in a repo. Because writing compliant health-tech copy at 2 AM shouldn't require a law degree and a copywriting PhD.

## What's This?

AI agents for Superpower's Growth org. Built as a Claude Code plugin with a modular agent + skills architecture optimized for Meta's Andromeda algorithm.

**What's Inside:**
- **Meta Creative Strategist** 👩‍💼 - Maya, a 37-year-old strategist who understands 30+ women because she IS one. Generates 20-50 Andromeda-ready concepts per campaign.
- **Clinical Claims Analyst** ⚖️ - Makes sure your "prevents death" claim becomes "may support longevity" without killing conversion
- **5 Modular Skills** 🧩 - Insight generation, concept matrices, brief writing, ad copywriting, compliance checking
- **Brand Guide** 📖 - The one doc that stops arguments about whether it's $199 or $200

## Quick Start

### Installation

**Option 1: Claude Code Plugin Marketplace**
Install directly from Claude Code's plugin marketplace (search "superpower-growth-agents").

**Option 2: Manual Install**
Clone this repo and add the plugin path to your Claude Code settings.

**That's it!** The agents auto-discover and MCP servers use browser OAuth - no API keys to configure.

### Using the Agents

**Create a full campaign (the main workflow):**
```
User: /create-brief for 30-35 women experiencing unexplained fatigue
→ Maya researches Reddit → generates 30 concepts → briefs top 10 → compliance checks all
```

**Quick compliance check:**
```
User: Review this ad copy for FDA/FTC compliance: [paste copy]
→ clinical-claims-analyst flags RED/YELLOW/GREEN with aggressive rewrites
```

**Research only:**
```
User: Research what women on r/Perimenopause are saying about brain fog
→ meta-creative-strategist uses insight-generation skill
```

**Generate concepts from existing insights:**
```
User: Build a concept matrix from these 5 insights: [paste insights]
→ meta-creative-strategist uses concept-matrix skill → 30-50 concepts
```

### Available Commands

- `/create-brief` - End-to-end creative workflow (Research → Insights → 20-50 Concepts → Briefs → Compliance)

### Repository Structure

```
growth-ai-agents/
├── CLAUDE.md                    # Instructions for Claude Code
├── README.md
└── plugins/
    └── superpower-growth-agents/
        ├── .claude-plugin/
        │   └── plugin.json              # Plugin metadata
        ├── .mcp.json                    # MCP server configuration (Notion)
        ├── brand-guide.md               # Value props, approved claims, tone
        ├── compliance-guide.md          # FDA/FTC compliance guidelines
        ├── marketing-personas.md        # ICP definitions & targeting
        ├── meta-ad-formats.md           # Meta ad format specs
        ├── steven-reiss-16-desires.md   # 16 desires framework
        ├── agents/
        │   ├── meta-creative-strategist.md  # Maya - main orchestrating agent
        │   └── clinical-claims-analyst.md   # Standalone compliance specialist
        ├── skills/
        │   ├── insight-generation/      # Reddit → actionable insights
        │   ├── concept-matrix/          # Insights → 20-50 concepts
        │   ├── brief-writing/           # Concepts → designer briefs
        │   ├── ad-copywriting/          # Final polished copy
        │   └── compliance-check/        # FDA/FTC review
        └── commands/
            └── create-brief.md          # End-to-end workflow
```

## Key Features

### Meta Creative Strategist 👩‍💼
Meet **Maya** - a 37-year-old creative strategist who's been in performance marketing for 12 years:

- **Lived Experience** - She's experienced perimenopause symptoms at 33, lurks r/Perimenopause, understands the "Millenopause" generation
- **Eugene Schwartz Expert** - Read Breakthrough Advertising 6 times, deeply versed in 5 Stages of Awareness
- **Andromeda-Optimized** - Generates 20-50 concepts per campaign (not 3-5) because creative volume wins post-Andromeda
- **Segment Intelligence** - Knows 30-35 (early signal), 35-42 (transition), 42-50 (optimization) women are DIFFERENT audiences
- **Skills-Based Workflow** - Invokes specialized skills for each phase: research → insights → concepts → briefs → copy → compliance

### Modular Skills System 🧩

| Skill | Trigger | Output |
|-------|---------|--------|
| **insight-generation** | "generate insights", "research pain points" | 5 insights with desire mapping |
| **concept-matrix** | "create concepts", "build matrix" | 20-50 systematic concepts |
| **brief-writing** | "write brief", "brief this concept" | Designer-ready briefs |
| **ad-copywriting** | "write ad copy", "finalize copy" | Polished Meta ad copy |
| **compliance-check** | "check compliance", "FDA review" | RED/YELLOW/GREEN flags + rewrites |

### Clinical Claims Analyst ⚖️
Your FDA compliance friend who says "yes, and..." instead of just "no":

- **RED/YELLOW/GREEN Flags** - Traffic light system for your claims (spoiler: most are fixable)
- **Aggressive-But-Defensible Rewrites** - We don't kill your message, we make it legally bulletproof
- **4-Minute Analysis** - Faster than your legal team's calendar invite response
- **No Claim Left Behind** - We rewrite, not delete (your conversion rate will thank us)

### Brand Guide 📖
The single source of truth so you stop debating facts:

- **Value Props**: $199/year, 100+ biomarkers, the all-in-one platform positioning
- **Approved Claims**: Everything verified from superpower.com (not someone's memory)
- **Clinical Creds**: Actual Harvard/UCLA/Stanford MDs (yes, we checked)
- **Competitive Intel**: How we stack up vs Function Health and $100k concierge medicine
- **Tone of Voice**: Real website copy analysis, not vibes

## Architecture: Why Agent + Skills?

### The Problem with Multiple Agents
Old architecture had 4 separate agents (copywriter, brief writer, researcher, compliance). This caused:
- Fragmented workflows
- Context lost between agents
- Inconsistent outputs
- No systematic concept generation

### The Solution: 1 Agent + Modular Skills
New architecture has Maya (orchestrating agent) + 5 skills she invokes:

```
User Request
     ↓
meta-creative-strategist (Maya)
     ├── insight-generation skill
     ├── concept-matrix skill
     ├── brief-writing skill
     ├── ad-copywriting skill
     └── compliance-check skill
     ↓
Complete Campaign Package
```

**Benefits:**
- Single context throughout workflow
- Systematic 20-50 concept generation
- Andromeda-optimized volume
- Consistent persona (Maya) who understands the audience

## Core Principles

### 1. Brand Guide as Single Source of Truth

All agents/skills reference `${CLAUDE_PLUGIN_ROOT}/brand-guide.md` because:
- Pricing shouldn't be a choose-your-own-adventure
- "Did we say 24/7 or year-round support?" shouldn't be a Slack thread
- When value props change, update one file, not hunt through 15 files

### 2. Andromeda-First Creative Strategy

Meta's algorithm changed. Creative volume wins:
- Old: 3-5 ads, precise targeting
- New: 20-50 ads, broad targeting, AI finds your audience

Maya generates systematic concept matrices, not one-off ads.

### 3. Outcome-Focused Copywriting

People don't wake up thinking "I need biomarker testing." They think "Why am I so tired?"

Lead with what they actually want:
- ❌ "100+ biomarkers tested" (features)
- ✅ "Know exactly why you're tired. Fix it in 90 days." (outcomes)

## MCP Server Integration

The plugin includes MCP servers with browser-based OAuth authentication:
- **Notion MCP** (official): Access marketing docs, content calendars, and team resources

### How It Works

MCP servers are configured in `.mcp.json` and automatically available when the plugin is installed:

```json
{
  "mcpServers": {
    "notion": {
      "type": "http",
      "url": "https://mcp.notion.com/mcp"
    }
  }
}
```

**No API keys needed!** When you first use a Notion tool, your browser opens for OAuth. Sign in and authorize access.

## Compliance Red Lines

Words that will get you a strongly-worded letter from the FDA:

### ❌ PROHIBITED (Don't Even Think About It)
- "Prevent disease" / "Cure" / "Diagnose" - You're not a doctor, the product isn't a drug
- "Replace your doctor" - We complement, we don't replace
- "Year-round clinical support" - It's "24/7" (we checked, legal cares about this)
- "Guaranteed health outcomes" - Unless you enjoy depositions

### ✅ APPROVED (Say These Instead)
- "Detect early signs" / "Early detection of" - Observation, not diagnosis
- "Optimize your health" / "Track biomarkers" - Data, not treatment
- "24/7 access to Superpower's clinical team" - Specific, accurate, defensible
- "Personalized health recommendations" - Suggestions, not prescriptions

## Updating the Brand Guide

When pricing changes or someone adds a new value prop:

1. **Research first** - Check superpower.com, not Slack memory
2. **Update brand-guide.md** - One file, one source of truth
3. **Agents auto-sync** - They all reference the brand guide, so you're done
4. **Version history** - Add a note at the bottom so future you remembers why

## Contributing

Adding new skills or updating existing ones? Follow these rules:

1. **Always use `${CLAUDE_PLUGIN_ROOT}/`** - For referencing guide files
2. **Skills use SKILL.md format** - With proper frontmatter (name, description)
3. **Update CLAUDE.md** - Future Claude instances will thank you
4. **Test the workflow** - Run `/create-brief` end-to-end

## License

Apache-2.0

---

**Repository:** [github.com/superpower-growth/growth-ai-agents](https://github.com/superpower-growth/growth-ai-agents)

**Company:** [Superpower](https://superpower.com) - Preventive health through comprehensive biomarker testing
