# Growth AI Agents 🚀

Your AI-powered growth team in a repo. Because writing compliant health-tech copy at 2 AM shouldn't require a law degree and a copywriting PhD.

## What's This?

AI agents for Superpower's Growth org. Built as a Claude Code plugin, these agents are like having Eugene Schwartz and an FDA compliance lawyer on speed dial.

**What's Inside:**
- **Meta Ad Copywriter** 📝 - Writes ads that convert using frameworks from the 1960s that still work better than "growth hacks"
- **Clinical Claims Analyst** ⚖️ - Makes sure your "prevents death" claim becomes "may support longevity" without killing conversion
- **Brand Guide** 📖 - The one doc that stops arguments about whether it's $199 or $200

## Quick Start

### Team Setup (One-Time, No Terminal Required!)

**Step 1: Install the Plugin**

Install from Claude's plugin marketplace or via GitHub URL.

**Step 2: Run `/setup` Command**

1. Type `/setup` in Claude
2. Provide your API keys when asked
3. Claude creates the configuration file for you
4. Restart Claude Code

**Done!** The agents and MCP servers are now active. No shell commands or terminal knowledge needed!

### Using the Agents

**Write an ad (the fun part):**
```
User: Write a Meta ad for our diabetes testing campaign [attach image]
Claude: I'll use the meta-ad-copywriter agent to create high-converting, compliant copy...
```

**Check compliance (the responsible part):**
```
User: Review this ad copy for FDA/FTC compliance: [paste copy]
Claude: I'll use the clinical-claims-analyst to review for regulatory issues...
```

### Available Commands

- `/setup` - Interactive API key configuration helper
- `/pr` - Quick PR review and GitHub push workflow
- `/create-brief` - Create a static ad creative brief (runs Reddit research + brief writing)
- `/meta-ad-copywriter` - Launch the Meta ad copywriting agent
- `/clinical-claims-analyst` - Launch the compliance review agent

### Repository Structure

```
growth-ai-agents/
├── CLAUDE.md                    # Repository documentation for Claude Code
└── plugins/
    └── superpower-growth-agents/
        ├── .claude-plugin/
        │   ├── plugin.json              # Plugin metadata
        │   └── .mcp.json                # MCP server configuration (Notion)
        ├── brand-guide.md               # Value props, approved claims, tone of voice
        ├── compliance-guide.md          # FDA/FTC compliance guidelines
        ├── marketing-personas.md        # ICP definitions
        ├── meta-ad-formats.md           # Meta ad format specifications
        ├── steven-reiss-16-desires.md   # 16 fundamental desires framework
        ├── agents/
        │   ├── meta-ad-copywriter.md        # Meta ad copywriting agent
        │   ├── clinical-claims-analyst.md   # Compliance review agent
        │   ├── reddit-persona-researcher.md # Reddit research agent
        │   └── static-ad-brief-writer.md    # Creative brief generator
        └── commands/
            ├── create-brief.md              # Creative brief workflow
            ├── pr.md                        # PR workflow
            └── setup.md                     # Plugin setup helper
```

## Key Features

### Meta Ad Copywriter 📝
Think of this as your copywriter who's read every marketing book from the 1960s and somehow still sounds modern:

- **Eugene Schwartz Frameworks** - 5 Stages of Awareness + Market Sophistication (turns out people in the 60s understood psychology better than most "growth hackers")
- **17 Fundamental Human Desires** - Because people don't buy "100+ biomarkers," they buy "knowing why they're tired"
- **Staccato Rhythm** - Short sentences. Like this. Because nobody reads long paragraphs on Meta.
- **Outcome-Focused** - Verified from brands that actually convert (Hims, Bryan Johnson), not made-up BS
- **Compliance Built-In** - Uses only approved claims so you don't accidentally practice medicine without a license

### Clinical Claims Analyst ⚖️
Your FDA compliance friend who says "yes, and..." instead of just "no":

- **RED/YELLOW/GREEN Flags** - Traffic light system for your claims (spoiler: most are fixable)
- **Aggressive-But-Defensible Rewrites** - We don't kill your message, we make it legally bulletproof
- **4-Minute Analysis** - Faster than your legal team's calendar invite response
- **Grey Area Toolkit** - 10 ways to say powerful things without crossing the line
- **No Claim Left Behind** - We rewrite, not delete (your conversion rate will thank us)

### Brand Guide 📖
The single source of truth so you stop debating facts:

- **Value Props**: $199/year, 100+ biomarkers, the all-in-one platform positioning
- **Approved Claims**: Everything verified from superpower.com (not someone's memory)
- **Clinical Creds**: Actual Harvard/UCLA/Stanford MDs (yes, we checked)
- **Competitive Intel**: How we stack up vs Function Health and $100k concierge medicine
- **Tone of Voice**: Real website copy analysis, not vibes

## Core Principles

### 1. Brand Guide as Single Source of Truth

All agents reference `.claude-plugin/brand-guide.md` because:
- Pricing shouldn't be a choose-your-own-adventure
- "Did we say 24/7 or year-round support?" shouldn't be a Slack thread
- When value props change, update one file, not hunt through 15 agents

**Never hardcode value props.** Your future self will thank you.

### 2. Verified Claims Only

Everything in the brand guide comes from superpower.com, not:
- ❌ Someone's memory from a meeting 3 months ago
- ❌ "I'm pretty sure it's..."
- ❌ What we wish we could claim

Actual verified claims:
- ✅ 100+ biomarkers in 1 blood draw
- ✅ $199/year (most states), $499/year (NY & NJ: $400/year + $99 mandatory at-home draw fee)
- ✅ 24/7 access to Superpower's clinical team
- ✅ Protocols co-created with Harvard, UCLA & Stanford MDs
- ✅ Early detection capabilities for 1,000+ conditions

### 3. Outcome-Focused Copywriting

People don't wake up thinking "I need biomarker testing." They think "Why am I so tired?"

Lead with what they actually want:
- ❌ "100+ biomarkers tested" (features)
- ✅ "Know exactly why you're tired. Fix it in 90 days." (outcomes)

## MCP Server Integration

The plugin includes hosted MCP servers with browser-based OAuth authentication:
- **Notion MCP** (official): Access and manage marketing documentation, content calendars, and team resources
- **PostHog MCP**: Track campaign performance, analyze user behavior, and measure conversion rates

### How It Works

MCP servers are configured in `plugin.json` and automatically available when the plugin is installed:

```json
{
  "mcpServers": {
    "notion": {
      "type": "sse",
      "url": "https://mcp.notion.com/sse"
    },
    "posthog": {
      "type": "sse",
      "url": "https://mcp.posthog.com/sse"
    }
  }
}
```

**No API keys needed!** When you first use an MCP tool, your browser opens for OAuth authentication. Just sign in and authorize access.

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

That's it. No hunting through 47 files to update "100+ biomarkers" to "120+ biomarkers."

## Contributing

Adding new agents or updating existing ones? Follow these rules:

1. **Always reference the brand guide** - No hardcoded value props, ever
2. **Verify examples from real websites** - If you're citing Hims copy, actually check Hims
3. **Update CLAUDE.md** - Future Claude instances will thank you
4. **Add version notes** - "Why did we change this?" shouldn't be a mystery

Basically: Don't make stuff up, document your changes, reference the brand guide.

## License

Apache-2.0

---

**Repository:** [github.com/superpowerdotcom/growth-ai-agents](https://github.com/superpowerdotcom/growth-ai-agents)

**Company:** [Superpower](https://superpower.com) - Preventive health through comprehensive biomarker testing
