# Growth AI Agents 🚀

Your AI-powered growth team in a repo. Because writing compliant health-tech copy at 2 AM shouldn't require a law degree and a copywriting PhD.

## What's This?

AI agents for Superpower's Growth org. Built as a Claude Code plugin, these agents are like having Eugene Schwartz and an FDA compliance lawyer on speed dial.

**What's Inside:**
- **Meta Ad Copywriter** 📝 - Writes ads that convert using frameworks from the 1960s that still work better than "growth hacks"
- **Clinical Claims Analyst** ⚖️ - Makes sure your "prevents death" claim becomes "may support longevity" without killing conversion
- **Brand Guide** 📖 - The one doc that stops arguments about whether it's $199 or $200

## Quick Start

### Team Setup (One-Time)

**3 commands. That's it.**

```bash
# 1. Clone the repository
git clone https://github.com/superpowerdotcom/growth-ai-agents
cd growth-ai-agents

# 2. Run setup script (prompts for API keys)
./setup.sh

# 3. Install plugin in Claude Code
/plugin install https://github.com/superpowerdotcom/growth-ai-agents
```

**Done!** The agents are now available in Claude Code.

### Using the Agents

**Write an ad (the fun part):**
```bash
# In Claude Code
@agent-meta-ad-copywriter write copy for this [attach image]
```

**Make sure it won't get you sued (the responsible part):**
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

The setup script automatically configures these MCP servers:
- **Notion MCP**: For accessing workspace documentation
- **PostHog MCP**: For product analytics and insights

API keys are configured during `setup.sh` and stored in your shell config (`~/.zshrc` or `~/.bashrc`).

**Where to get your keys:**
- Notion: https://www.notion.so/my-integrations
- PostHog: https://app.posthog.com/settings/user-api-keys

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
