# EasyPrompts – Complete Technical Specifications

This repository contains all documentation, configuration, and schema for building and maintaining **EasyPrompts**, the AI prompt and workflow management platform.

## 📖 Documentation Index

| Section | File |
|----------|------|
| Full Specification | [docs/EasyPrompts_Specifications_EN.md](docs/EasyPrompts_Specifications_EN.md) |
| Roadmap | [docs/ROADMAP.md](docs/ROADMAP.md) |
| Admin Panel Guide | [docs/ADMIN_GUIDE.md](docs/ADMIN_GUIDE.md) |
| GA4 Events | [docs/GA4_EVENTS.md](docs/GA4_EVENTS.md) |
| Newsletter Templates | [docs/NEWSLETTER_TEMPLATES.md](docs/NEWSLETTER_TEMPLATES.md) |
| Database Schema | [schema/database_schema.sql](schema/database_schema.sql) |
| Policies | [schema/policies.sql](schema/policies.sql) |
| Config | [config/feature_flags.env](config/feature_flags.env) |
| SEO Setup | [seo/SEO_CHECKLIST.md](seo/SEO_CHECKLIST.md) |
| Sitemaps | [seo/SITEMAPS.md](seo/SITEMAPS.md) |
| Legal | [legal/PRIVACY_POLICY_PLACEHOLDER.md](legal/PRIVACY_POLICY_PLACEHOLDER.md), [legal/TERMS_PLACEHOLDER.md](legal/TERMS_PLACEHOLDER.md) |

## 🛠️ Usage
Clone the repository and use the documentation to guide development in Cursor, LM Studio, or VS Code.

## 🧰 Tech Stack
Next.js 14 • Tailwind CSS • Supabase • HuggingFace API • Google Analytics 4 • Vercel

## 🧑‍💻 Repository Maintenance
- **Update docs:** edit files under `/docs`, commit, and push to `main`.
- **Auto-publish:** GitHub Actions deploys `/docs` to GitHub Pages on each push to `main`.
- **Issues & PRs:** use `.github/ISSUE_TEMPLATE/*` and `.github/PULL_REQUEST_TEMPLATE.md`.
- **Branching:** use feature branches, open PRs to `main`. Enable branch protection if needed.
- **Versioning:** tag significant spec milestones as `vX.Y` using Git tags and GitHub releases.
- **Security:** never commit secrets. Use placeholders in `/config/example.env`.

## ⚖️ License
MIT © 2025 EasyPrompts
