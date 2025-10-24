-- RLS examples (adapt as needed)
alter table prompts enable row level security;
create policy select_public_prompts on prompts
for select using (visibility = 'public' or auth.uid() = user_id);

create policy modify_own_prompts on prompts
for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
