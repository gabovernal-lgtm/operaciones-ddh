create table public.ddh_planificacion_diaria (
 id uuid primary key default gen_random_uuid(),
 usuario uuid not null default auth.uid() references auth.users(id),
 fecha date not null,
 turno text not null check (turno in ('A','B')),
 categoria text not null check (categoria in ('Agua','Petróleo','Mantención','Muestras','Limpieza de planta','Traslados e instalaciones','Otros')),
 equipo text not null default '' check (length(equipo)<=80),
 actividad text not null check (length(btrim(actividad)) between 1 and 1500),
 responsable text not null default '' check (length(responsable)<=150),
 prioridad boolean not null default false,
 critica boolean not null default false,
 controles text not null default '' check (length(controles)<=1500),
 porcentaje smallint check (porcentaje between 0 and 100),
 estado text not null default 'Pendiente' check (estado in ('Pendiente','En ejecución','Terminada')),
 creado_en timestamptz not null default now(),
 actualizado_en timestamptz not null default clock_timestamp(),
 check (not critica or length(btrim(controles))>0),
 check (porcentaje is null or categoria in ('Agua','Petróleo'))
);
create index ddh_planificacion_usuario_fecha_turno on public.ddh_planificacion_diaria(usuario,fecha,turno);
alter table public.ddh_planificacion_diaria enable row level security;
revoke all on public.ddh_planificacion_diaria from anon,authenticated;
grant select,insert,update,delete on public.ddh_planificacion_diaria to authenticated;
do $$
declare propietario uuid;
begin
 select id into strict propietario from public.ddh_profiles where lower(email)='gvernal@geotec.cl' and status='approved';
 execute format('create policy planificacion_personal on public.ddh_planificacion_diaria for all to authenticated using (usuario=(select auth.uid()) and usuario=%L::uuid and (select public.ddh_is_admin())) with check (usuario=(select auth.uid()) and usuario=%L::uuid and (select public.ddh_is_admin()))',propietario,propietario);
end $$;
create function public.ddh_planificacion_version() returns trigger language plpgsql security invoker set search_path='' as $$
begin
 new.usuario=old.usuario;
 new.creado_en=old.creado_en;
 new.actualizado_en=clock_timestamp();
 return new;
end $$;
revoke all on function public.ddh_planificacion_version() from public;
create trigger ddh_planificacion_version before update on public.ddh_planificacion_diaria for each row execute function public.ddh_planificacion_version();
