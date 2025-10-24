# EasyPrompts – Product & Technical Specification (EN)

## 1) PROJECT OVERVIEW
### Purpose & Objectives
- Build a modern, fast, SEO-strong platform for discovering, creating, organizing, and sharing AI prompts and workflows.
- Beginner-first UX, clear discovery, comments, and basic gamification.
- Future-ready architecture with feature flags and admin/editor tools.

### Target Audience
- Beginners/intermediate users of AI tools.
- Creators who publish prompts/workflows.
- Staff (Editors/Admins) who moderate and manage SEO, imports, and settings.

### Unique Value Proposition
- Clear Prompt/Workflow pages with Copy, Comments, Reactions, Favorites.
- Strong automated SEO per page type, segmented sitemaps, IndexNow.
- Admin Settings with encrypted API keys and runtime hot reload.

## 2) FULL SITE STRUCTURE
Domain: https://easyprompts.org

Global URL rules:
- Prompts: /prompt/{slug}
- Workflows: /workflow/{slug}
- Tags: /tag/{slug}
- Browse: /browse (tabs Prompts/Workflows)
- Trending: /trending
- Leaderboard: /leaderboard
- For You: /for-you (auth only)
- Profiles: /u/{username}, Dashboard: /dashboard
- Auth: /login, /register, /forgot-password, /reset-password
- Legal/Privacy: /privacy-policy, /privacy-center, /cookies, /terms
- Help: /faq, /how-to
- Admin: /admin (+ subroutes)
- Sitemaps: /sitemap.xml, /sitemaps/sitemap-prompts.xml, /sitemaps/sitemap-workflows.xml, /sitemaps/sitemap-tags.xml

Header: EasyPrompts text logo, Home, Browse, Workflows, Tags, Leaderboard, Search, Create, User menu.
Footer: Explore, Resources, Legal & Privacy, Connect, Organization schema.

## 3) PAGE SPECS (Highlights)
- **Home**: Hero, global search, trending tags, featured prompts/workflows, categories, SEO text.
- **Browse**: search, filters, sort, tabs Prompt/Workflow, grid cards, pagination/infinite scroll, sidebar filters (desktop).
- **Prompt View**: title/meta, content block with Copy, tags/actions, author card, comments + reactions, related prompts, schema CreativeWork.
- **Workflow View**: header, summary, step-by-step with per-step Copy, actions, comments, related workflows, schema HowTo + CreativeWorkSeries.
- **Tag View**: header, stats, prompts/workflows grids, related tags, follow tag.
- **Trending**: time filters, top prompts list, top workflows grid, top tags this week, sidebar stats.
- **Leaderboard**: time filters, top creators podium + list, top prompts/workflows, badges & milestones.
- **For You**: personalized feed from follows + tags.
- **Public Profile**: header, tabs Prompts/Workflows/Comments/Favorites (public subset), stats, Follow button.
- **Dashboard**: tabs Prompts, Workflows, Favorites, Comments, Activity, Achievements, Settings; sidebar stats + quick actions.
- **Auth**: login/register/forgot/reset with email verification; optional 2FA.
- **Admin**: prompts/workflows/comments moderation, SEO index panel, import/export CSV, users (roles, suspend, force reset, activity), settings (encrypted), security logs.
- **Privacy Center**: export data (ZIP 24h), delete account (7-day grace), cookies manager, notifications preferences.
- **FAQ/How-To**: beginner friendly; exclude Paywall/Affiliate questions until activation.

## 4) DESIGN SYSTEM
Colors: Primary #3B82F6, Hover #2563EB, Text #1F2937, Secondary #6B7280, BG #FFFFFF/#F9FAFB, Border #E5E7EB; Success #10B981, Warning #F59E0B, Danger #EF4444; Dark mode prepared (#0F172A, #E5E7EB, #60A5FA).
Typography: Inter; H1 32/700, H2 24/700, H3 20/600, Body 15–16/400, Small 13–14; Monospace JetBrains Mono 15 for prompt blocks.
Spacing/Grid: 4px scale; cards 16–24 padding; grids 3/2/1 cols.
Breakpoints: <640, 641–1024, >1024.
Components: buttons, inputs, cards, pills, tooltips, badges; transitions 150–200ms; icons: lucide-react.

## 5) TECH & ARCH
- Next.js 14 (App Router), React 18, Tailwind, shadcn/ui (selectively)
- Supabase (Auth, Postgres, Realtime, RLS)
- Forms: React Hook Form + Zod
- Charts: Recharts (light)
- Images: next/image + Vercel optimization
- AI: HuggingFace Inference API (AI tagging, comment moderation, auto-thumbnails)
- SEO: Next Metadata API, canonical, schema JSON-LD, segmented sitemaps, IndexNow
- Analytics: Google Analytics 4 (consent-aware)
- Email: Supabase SMTP
- Hosting: Vercel (app) + Supabase (DB)
- CI/CD: Vercel previews + production on main; GitHub Actions for docs pages

## 6) TECH FEATURES
Auth & Roles: user/editor/admin; email verification; optional 2FA; device management; security logs.
Comments & Reactions: nested 1 level, reaction emojis, report flow, AI moderation scores; editor can hide/delete.
Content Management: Editor manages content + SEO + import/export; Admin manages users, roles, settings, logs.
Following & For You: follow creators + tags; feed + notifications.
Newsletter: opt-in; weekly digest; unsubscribe one-click.
Emails: verification, reset, comment reply, digest, export ready, delete scheduled.
Platform Settings: general/social/SEO/AI keys; encrypted storage (masked); audit log; JSON snapshot; hot reload.
Privacy & Data: export ZIP (24h), delete with 7-day grace; cookies banner; notification preferences.
SEO: title/meta per page, canonical, schema (CreativeWork/HowTo/ItemList/BreadcrumbList/Organization), OG/Twitter, sitemaps, IndexNow.
Analytics GA4: events for search, view, copy, favorite, follow, comment, share, auth.
Auto-Thumbnails: generated via HF and cached under /public/thumbnails.
Loading/Empty/a11y: skeletons across lists, clear empty states, AA contrast, keyboard nav, aria labels.

## 7) REUSABLE COMPONENTS
HeaderNav, Footer, SearchBar, PromptCard, WorkflowCard, TagPill, AuthorCard, CommentThread, ReactionBar, ReportModal, SEOEditorPanel, WorkflowStep, Pagination/InfiniteLoader, Skeletons, Toast.

## 8) ASSETS
Text-only logo; HF-generated cover images; avatar initials fallback; lucide icons; fonts via next/font.

## 9) RESPONSIVE & BROWSER
Navbar collapse <768; search icon-only on small; grids 3/2/1; workflows accordion on mobile; sticky bars on desktop; support latest 2 versions of major browsers.

## 10) CHECKLIST
Phased implementation order (MVP → Growth → Pro), dependencies, acceptance criteria for auth, content, comments, admin, SEO, thumbnails, privacy, settings, GA4, a11y.

## 11) DATABASE (Supabase – indicative)
Tables: users_profile, prompts, workflows, tags, prompt_tags, workflow_tags, comments, comment_reactions, favorites, follows, platform_settings (encrypted), security_log, admin_audit_log, imports, exports, index_queue, thumbnails, newsletter_subscribers. Indexes on slugs, FKs. RLS enabled.

## 12) FORMS & VALIDATION
Zod schemas for auth, prompt, workflow, comments, admin settings; inline errors + toast feedback.

## 13) INTEGRATIONS
HuggingFace (tagging, moderation, thumbnails), GA4 (consent-aware), Sitemaps + IndexNow, Supabase SMTP with logging.

## 14) DEPLOY & CI/CD
Vercel env vars; preview builds; migrations; health checks for sitemap routes and indexnow endpoint.

## 15) FEATURE FLAGS
See /config/feature_flags.env

## 16) TEST PLAN
Covers auth, roles, CRUD, comments, reactions, follows, SEO, thumbnails, privacy flows, admin settings encryption, GA4 consent.
