create table public.ddh_planificacion_bloques (
 usuario uuid not null default auth.uid() references auth.users(id),
 fecha date not null,
 turno text not null check(turno in ('A','B')),
 agua text not null default '' check(length(agua)<=12000),
 petroleo text not null default '' check(length(petroleo)<=12000),
 mantencion text not null default '' check(length(mantencion)<=12000),
 muestras text not null default '' check(length(muestras)<=12000),
 trabajos text not null default '' check(length(trabajos)<=12000),
 criticas text not null default '' check(length(criticas)<=12000),
 creado_en timestamptz not null default now(),
 actualizado_en timestamptz not null default clock_timestamp(),
 primary key(usuario,fecha,turno)
);
alter table public.ddh_planificacion_bloques enable row level security;
revoke all on public.ddh_planificacion_bloques from anon,authenticated;
grant select,insert,update on public.ddh_planificacion_bloques to authenticated;
do $$ declare propietario uuid; begin
 select id into strict propietario from public.ddh_profiles where lower(email)='gvernal@geotec.cl' and status='approved';
 execute format('create policy planificacion_bloques_personal on public.ddh_planificacion_bloques for all to authenticated using (usuario=(select auth.uid()) and usuario=%L::uuid and (select public.ddh_is_admin())) with check (usuario=(select auth.uid()) and usuario=%L::uuid and (select public.ddh_is_admin()))',propietario,propietario);
end $$;
create trigger ddh_planificacion_bloques_version before update on public.ddh_planificacion_bloques for each row execute function public.ddh_planificacion_version();
