# Growth AI Agents 🚀

Your AI-powered growth team in a repo. Because writing compliant health-tech copy at 2 AM shouldn't require a law degree and a copywriting PhD.

## What's This?

AI agents for Superpower's Growth org. Built as a Claude Code plugin, these agents are like having Eugene Schwartz, a Reddit anthropologist, and an FDA compliance lawyer on speed dial.

**What's Inside:**
- **Meta Ad Copywriter** 📝 - Writes ads that convert using frameworks from the 1960s that still work better than "growth hacks"
- **Clinical Claims Analyst** ⚖️ - Makes sure your "prevents death" claim becomes "may support longevity" without killing conversion
- **Reddit Persona Researcher** 🔍 - Finds real pain points from r/Biohackers and health subreddits so you stop guessing what people want
- **Static Ad Brief Writer** 📋 - Creates designer-ready creative briefs with Reddit-sourced insights mapped to human desires
- **Brand Guide** 📖 - The one doc that stops arguments about whether it's $199 or $200

## Quick Start

### Installation

**Option 1: Claude Code Plugin Marketplace**
Install directly from Claude Code's plugin marketplace (search "superpower-growth-agents").

**Option 2: Manual Install**
Clone this repo and add the plugin path to your Claude Code settings.

**That's it!** The agents auto-discover and MCP servers use browser OAuth - no API keys to configure.

### Using the Agents

Claude auto-invokes the right agent based on your request:

**Write an ad:**
```
User: Write a Meta ad for our diabetes testing campaign [attach image]
→ meta-ad-copywriter agent creates high-converting, compliant copy
```

**Check compliance:**
```
User: Review this ad copy for FDA/FTC compliance: [paste copy]
→ clinical-claims-analyst reviews for regulatory issues
```

**Research your audience:**
```
User: Research what biohackers on Reddit are saying about blood testing
→ reddit-persona-researcher finds real pain points and language patterns
```

**Create a creative brief:**
```
User: /create-brief for a campaign targeting burned-out executives
→ Runs Reddit research + maps to desires + outputs designer-ready brief
```

### Available Commands

- `/create-brief` - End-to-end creative brief workflow (Reddit research → desire mapping → formatted brief)

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
        ├── brand-guide.md               # Value props, approved claims, tone of voice
        ├── compliance-guide.md          # FDA/FTC compliance guidelines
        ├── marketing-personas.md        # ICP definitions & targeting guides
        ├── meta-ad-formats.md           # Meta ad format specifications
        ├── steven-reiss-16-desires.md   # 16 fundamental desires framework
        ├── agents/
        │   ├── meta-ad-copywriter.md        # Meta ad copywriting (Eugene Schwartz frameworks)
        │   ├── clinical-claims-analyst.md   # FDA/FTC compliance review
        │   ├── reddit-persona-researcher.md # Reddit pain point research
        │   └── static-ad-brief-writer.md    # Designer-ready creative briefs
        └── commands/
            └── create-brief.md              # End-to-end brief workflow
```

## Key Features

### Meta Ad Copywriter 📝
Your copywriter who's read every marketing book from the 1960s and somehow still sounds modern:

- **Eugene Schwartz Frameworks** - 5 Stages of Awareness + Market Sophistication
- **17 Fundamental Human Desires** - People don't buy "100+ biomarkers," they buy "knowing why they're tired"
- **Outcome-Focused** - Verified from brands that actually convert (Hims, Bryan Johnson)
- **Compliance Built-In** - Uses only approved claims from the brand guide
- **Image Analysis** - Attach a creative and get copy matched to the visual

### Clinical Claims Analyst ⚖️
Your FDA compliance friend who says "yes, and..." instead of just "no":

- **RED/YELLOW/GREEN Flags** - Traffic light system for your claims (spoiler: most are fixable)
- **Aggressive-But-Defensible Rewrites** - We don't kill your message, we make it legally bulletproof
- **4-Minute Analysis** - Faster than your legal team's calendar invite response
- **No Claim Left Behind** - We rewrite, not delete (your conversion rate will thank us)

### Reddit Persona Researcher 🔍
Your anthropologist who lurks r/Biohackers so you don't have to:

- **Real Pain Points** - Direct quotes from actual humans, not marketing personas invented in a conference room
- **Language Patterns** - How your audience actually talks about their problems
- **Subreddit Intelligence** - r/Biohackers, r/longevity, r/30PlusSkinCare, and health-adjacent communities
- **Quote Extraction** - Copy-paste ready snippets for ad copy inspiration

### Static Ad Brief Writer 📋
Designer-ready creative briefs that actually get used:

- **Reddit-Sourced Insights** - Calls the persona researcher, so briefs are grounded in real pain points
- **Steven Reiss 16 Desires** - Maps messaging to fundamental human motivations (not just "features")
- **Format Recommendations** - Carousel vs. single image vs. video based on message complexity
- **Structured Output** - Headline, hook, body, CTA, visual direction, compliance notes

### Brand Guide 📖
The single source of truth so you stop debating facts:

- **Value Props**: $199/year, 100+ biomarkers, the all-in-one platform positioning
- **Approved Claims**: Everything verified from superpower.com (not someone's memory)
- **Clinical Creds**: Actual Harvard/UCLA/Stanford MDs (yes, we checked)
- **Competitive Intel**: How we stack up vs Function Health and $100k concierge medicine
- **Tone of Voice**: Real website copy analysis, not vibes

## Core Principles

### 1. Brand Guide as Single Source of Truth

All agents reference `brand-guide.md` because:
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

**Adding PostHog:** If you want analytics integration, add PostHog to your personal Claude Code MCP settings or request it be added to this plugin.

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
