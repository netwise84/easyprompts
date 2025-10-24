# Admin Guide – EasyPrompts

## Roles
- User: create content, comment, react, follow
- Editor: manage all content, SEO & indexing, import/export, analytics read-only
- Admin: everything + platform settings, users/roles, security logs

## Key Panels
- **Prompts/Workflows**: feature/hide/delete, SEO tab, AI tag suggest
- **Comments**: hide/delete, report queue, AI moderation scores
- **SEO & Indexing**: sitemap regenerate, IndexNow ping, robots flags, page inspector
- **Import/Export**: CSV import with preview/validation; export CSV/JSON
- **Users**: suspend/reactivate, force reset password, change roles, view activity
- **Settings**: general/social/SEO/AI keys; encrypted storage; hot reload
- **Security Logs**: filter by user/IP/event, export

## Safety
- Sensitive values encrypted and masked
- Each change logged to `admin_audit_log`
- Backups: JSON snapshot of Platform Settings after every change
