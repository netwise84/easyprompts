-- Supabase indicative schema (subset)

create table if not exists users_profile (
  id uuid primary key references auth.users(id) on delete cascade,
  username text unique not null,
  name text,
  bio text,
  avatar_url text,
  role text check (role in ('user','editor','admin')) default 'user',
  public_profile boolean default true,
  joined_at timestamp with time zone default now()
);

create table if not exists prompts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references users_profile(id) on delete set null,
  slug text unique not null,
  title text not null,
  short_description text,
  content text not null,
  visibility text check (visibility in ('public','private','draft')) default 'public',
  featured boolean default false,
  views int default 0,
  favorites_count int default 0,
  seo_title text,
  seo_description text,
  canonical text,
  robots_index boolean default true,
  schema_flags jsonb default '{}'::jsonb,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

create table if not exists workflows (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references users_profile(id) on delete set null,
  slug text unique not null,
  title text not null,
  description text,
  steps jsonb not null,
  steps_count int default 0,
  used_count int default 0,
  visibility text check (visibility in ('public','private','draft')) default 'public',
  featured boolean default false,
  views int default 0,
  favorites_count int default 0,
  seo_title text,
  seo_description text,
  canonical text,
  robots_index boolean default true,
  schema_flags jsonb default '{}'::jsonb,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

create table if not exists tags (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text unique not null,
  description text,
  created_at timestamp with time zone default now()
);

create table if not exists prompt_tags (
  prompt_id uuid references prompts(id) on delete cascade,
  tag_id uuid references tags(id) on delete cascade,
  primary key (prompt_id, tag_id)
);

create table if not exists workflow_tags (
  workflow_id uuid references workflows(id) on delete cascade,
  tag_id uuid references tags(id) on delete cascade,
  primary key (workflow_id, tag_id)
);

create table if not exists comments (
  id uuid primary key default gen_random_uuid(),
  parent_id uuid,
  entity_type text check (entity_type in ('prompt','workflow')) not null,
  entity_id uuid not null,
  user_id uuid references users_profile(id) on delete set null,
  content text not null,
  status text check (status in ('visible','hidden','reported')) default 'visible',
  ai_toxicity_score float,
  created_at timestamp with time zone default now()
);

create table if not exists comment_reactions (
  id uuid primary key default gen_random_uuid(),
  comment_id uuid references comments(id) on delete cascade,
  user_id uuid references users_profile(id) on delete cascade,
  emoji text not null,
  created_at timestamp with time zone default now(),
  unique (comment_id, user_id, emoji)
);

create table if not exists favorites (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references users_profile(id) on delete cascade,
  entity_type text check (entity_type in ('prompt','workflow')) not null,
  entity_id uuid not null,
  created_at timestamp with time zone default now(),
  unique (user_id, entity_type, entity_id)
);

create table if not exists follows (
  id uuid primary key default gen_random_uuid(),
  follower_id uuid references users_profile(id) on delete cascade,
  target_user_id uuid references users_profile(id) on delete cascade,
  created_at timestamp with time zone default now(),
  unique (follower_id, target_user_id)
);

create table if not exists platform_settings (
  key text primary key,
  value text,
  category text,
  encrypted boolean default false,
  updated_by uuid references users_profile(id),
  updated_at timestamp with time zone default now()
);

create table if not exists security_log (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  ip text,
  user_agent text,
  event_type text,
  meta jsonb,
  created_at timestamp with time zone default now()
);

create table if not exists admin_audit_log (
  id uuid primary key default gen_random_uuid(),
  admin_id uuid references users_profile(id),
  action text,
  target_type text,
  target_id uuid,
  diff jsonb,
  created_at timestamp with time zone default now()
);

create table if not exists newsletter_subscribers (
  id uuid primary key default gen_random_uuid(),
  email text unique not null,
  user_id uuid,
  status text check (status in ('active','unsubscribed')) default 'active',
  created_at timestamp with time zone default now()
);

-- Index examples
create index if not exists idx_prompts_user on prompts(user_id);
create index if not exists idx_prompts_slug on prompts(slug);
create index if not exists idx_workflows_slug on workflows(slug);
create index if not exists idx_tags_slug on tags(slug);
