--
-- PostgreSQL database dump
--

\restrict egmuJpd7SE7u4VzDnFObFuFwd7G31fRma0n1Z15EgyQg8DThPeYZsLTFGhseD9J

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auth;


--
-- Name: drizzle; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA drizzle;


--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA extensions;


--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql;


--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA graphql_public;


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA pgbouncer;


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA realtime;


--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vault;


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone',
    'recovery_code'
);


--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: -
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


--
-- Name: base_unit; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.base_unit AS ENUM (
    'gram',
    'millilitre',
    'piece'
);


--
-- Name: ingredient_display_unit; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.ingredient_display_unit AS ENUM (
    'kg',
    'g',
    'L',
    'ml',
    'pc'
);


--
-- Name: movement_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.movement_type AS ENUM (
    'PURCHASE_RECEIPT',
    'SALE_CONSUMPTION',
    'WASTE',
    'MANUAL_ADJUSTMENT_IN',
    'MANUAL_ADJUSTMENT_OUT',
    'STOCK_COUNT_CORRECTION',
    'ORDER_CANCELLATION_REVERSAL',
    'REFUND_REVERSAL',
    'OPENING_BALANCE'
);


--
-- Name: order_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.order_status AS ENUM (
    'DRAFT',
    'SUBMITTED',
    'PRINT_PENDING',
    'PRINTED',
    'COMPLETED',
    'CANCELLED',
    'REFUNDED'
);


--
-- Name: order_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.order_type AS ENUM (
    'dine_in',
    'takeaway',
    'other'
);


--
-- Name: print_destination; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.print_destination AS ENUM (
    'CUSTOMER_RECEIPT',
    'KITCHEN_TICKET'
);


--
-- Name: print_provider; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.print_provider AS ENUM (
    'mock',
    'browser',
    'bridge',
    'device'
);


--
-- Name: print_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.print_status AS ENUM (
    'QUEUED',
    'PROCESSING',
    'PRINTED',
    'FAILED',
    'CANCELLED'
);


--
-- Name: purchase_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.purchase_status AS ENUM (
    'DRAFT',
    'FINALIZED',
    'REVERSED'
);


--
-- Name: role_name; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.role_name AS ENUM (
    'super_admin',
    'owner',
    'manager',
    'cashier',
    'inventory_staff',
    'viewer'
);


--
-- Name: stock_count_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.stock_count_status AS ENUM (
    'OPEN',
    'SUBMITTED',
    'CANCELLED'
);


--
-- Name: waste_reason; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.waste_reason AS ENUM (
    'expired',
    'spilled',
    'damaged',
    'preparation_waste',
    'incorrect_preparation',
    'other'
);


--
-- Name: action; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in',
    'like',
    'ilike',
    'is',
    'match',
    'imatch',
    'isdistinct'
);


--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text,
	negate boolean
);


--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: -
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: -
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: -
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
    revoke trigger on cron.job_run_details from postgres;
  END IF;
END;
$$;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $_$
begin
    if not exists (
        select 1
        from pg_catalog.pg_event_trigger_ddl_commands() ev
        join pg_catalog.pg_extension e on ev.objid = e.oid
        where e.extname = 'pg_graphql'
    ) then
        return;
    end if;

    drop function if exists graphql_public.graphql;
    create or replace function graphql_public.graphql(
        "operationName" text default null,
        query text default null,
        variables jsonb default null,
        extensions jsonb default null
    )
        returns jsonb
        language sql
    as $$
        select graphql.resolve(
            query := query,
            variables := coalesce(variables, '{}'),
            "operationName" := "operationName",
            extensions := extensions
        );
    $$;

    -- Attach the wrapper to the extension so DROP EXTENSION cascades to it,
    -- which in turn triggers set_graphql_placeholder to reinstall the "not enabled" stub.
    alter extension pg_graphql add function graphql_public.graphql(text, text, jsonb, jsonb);

    grant usage on schema graphql to postgres, anon, authenticated, service_role;
    grant execute on function graphql.resolve to postgres, anon, authenticated, service_role;
    grant usage on schema graphql to postgres with grant option;
    grant usage on schema graphql_public to postgres with grant option;
end;
$_$;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8.0', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: -
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    SET search_path TO ''
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
            set search_path to ''
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: -
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: graphql(text, text, jsonb, jsonb); Type: FUNCTION; Schema: graphql_public; Owner: -
--

CREATE FUNCTION graphql_public.graphql("operationName" text DEFAULT NULL::text, query text DEFAULT NULL::text, variables jsonb DEFAULT NULL::jsonb, extensions jsonb DEFAULT NULL::jsonb) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: -
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
    -- Regclass of the table e.g. public.notes
    entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

    -- I, U, D, T: insert, update ...
    action realtime.action = (
        case wal ->> 'action'
            when 'I' then 'INSERT'
            when 'U' then 'UPDATE'
            when 'D' then 'DELETE'
            else 'ERROR'
        end
    );

    -- Is row level security enabled for the table
    is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

    subscriptions realtime.subscription[] = array_agg(subs)
        from
            realtime.subscription subs
        where
            subs.entity = entity_
            -- Filter by action early - only get subscriptions interested in this action
            -- action_filter column can be: '*' (all), 'INSERT', 'UPDATE', or 'DELETE'
            and (subs.action_filter = '*' or subs.action_filter = action::text);

    -- Subscription vars
    working_role regrole;
    working_selected_columns text[];
    claimed_role regrole;
    claims jsonb;

    subscription_id uuid;
    subscription_has_access bool;
    visible_to_subscription_ids uuid[] = '{}';

    -- structured info for wal's columns
    columns realtime.wal_column[];
    -- previous identity values for update/delete
    old_columns realtime.wal_column[];

    error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

    -- Primary jsonb output for record
    output jsonb;

    -- Loop record for iterating unique roles (outer loop)
    role_record record;
    -- Loop record for iterating unique selected_columns within a role (inner loop)
    cols_record record;
    -- Subscription ids visible at the role level (before fanning out by selected_columns)
    visible_role_sub_ids uuid[] = '{}';

begin
    perform set_config('role', null, true);

    columns =
        array_agg(
            (
                x->>'name',
                x->>'type',
                x->>'typeoid',
                realtime.cast(
                    (x->'value') #>> '{}',
                    coalesce(
                        (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                        (x->>'type')::regtype
                    )
                ),
                (pks ->> 'name') is not null,
                true
            )::realtime.wal_column
        )
        from
            jsonb_array_elements(wal -> 'columns') x
            left join jsonb_array_elements(wal -> 'pk') pks
                on (x ->> 'name') = (pks ->> 'name');

    old_columns =
        array_agg(
            (
                x->>'name',
                x->>'type',
                x->>'typeoid',
                realtime.cast(
                    (x->'value') #>> '{}',
                    coalesce(
                        (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                        (x->>'type')::regtype
                    )
                ),
                (pks ->> 'name') is not null,
                true
            )::realtime.wal_column
        )
        from
            jsonb_array_elements(wal -> 'identity') x
            left join jsonb_array_elements(wal -> 'pk') pks
                on (x ->> 'name') = (pks ->> 'name');

    for role_record in
        select claims_role
        from (select distinct claims_role from unnest(subscriptions)) t
        order by claims_role::text
    loop
        working_role := role_record.claims_role;

        -- Update `is_selectable` for columns and old_columns (once per role)
        columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(columns) c;

        old_columns =
                array_agg(
                    (
                        c.name,
                        c.type_name,
                        c.type_oid,
                        c.value,
                        c.is_pkey,
                        pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                    )::realtime.wal_column
                )
                from
                    unnest(old_columns) c;

        if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
            -- Fan out 400 error per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where s.claims_role = working_role and (s.selected_columns is not distinct from working_selected_columns)),
                    array['Error 400: Bad Request, no primary key']
                )::realtime.wal_rls;
            end loop;

        -- The claims role does not have SELECT permission to the primary key of entity
        elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
            -- Fan out 401 error per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where s.claims_role = working_role and (s.selected_columns is not distinct from working_selected_columns)),
                    array['Error 401: Unauthorized']
                )::realtime.wal_rls;
            end loop;

        else
            -- Create the prepared statement (once per role)
            if is_rls_enabled and action <> 'DELETE' then
                if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                    deallocate walrus_rls_stmt;
                end if;
                execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
            end if;

            -- Collect all visible subscription IDs for this role (filter check + RLS check)
            visible_role_sub_ids = '{}';

            for subscription_id, claims in (
                    select
                        subs.subscription_id,
                        subs.claims
                    from
                        unnest(subscriptions) subs
                    where
                        subs.entity = entity_
                        and subs.claims_role = working_role
                        and (
                            realtime.is_visible_through_filters(columns, subs.filters)
                            or (
                              action = 'DELETE'
                              and realtime.is_visible_through_filters(old_columns, subs.filters)
                            )
                        )
            ) loop

                if not is_rls_enabled or action = 'DELETE' then
                    visible_role_sub_ids = visible_role_sub_ids || subscription_id;
                else
                    -- Check if RLS allows the role to see the record
                    perform
                        -- Trim leading and trailing quotes from working_role because set_config
                        -- doesn't recognize the role as valid if they are included
                        set_config('role', trim(both '"' from working_role::text), true),
                        set_config('request.jwt.claims', claims::text, true);

                    execute 'execute walrus_rls_stmt' into subscription_has_access;

                    -- Reset the role on every FOR..LOOP batch execution.
                    -- The first batch of 10 rows is pre-fetched using the current connection role (PG internal behaviour)
                    -- then we have to reset it again otherwise it would use the role defined in the `set_config` above
                    -- to fetch the remaining rows when rows>10, which could be a user-defined role that lacks execution grants.
                    -- The flow is:
                    --   1. run batch with conn role
                    --   2. set_config working_role
                    --   3. execute walrus
                    --   4. reset role (revert)
                    --   5. repeat
                    perform set_config('role', null, true);

                    if subscription_has_access then
                        visible_role_sub_ids = visible_role_sub_ids || subscription_id;
                    end if;
                end if;
            end loop;

            perform set_config('role', null, true);

            -- Inner loop: per distinct selected_columns for this role
            for cols_record in
                select selected_columns
                from (select distinct selected_columns from unnest(subscriptions) s where s.claims_role = working_role) t
                order by coalesce(array_to_string(selected_columns, ','), '')
            loop
                working_selected_columns := cols_record.selected_columns;

                output = jsonb_build_object(
                    'schema', wal ->> 'schema',
                    'table', wal ->> 'table',
                    'type', action,
                    'commit_timestamp', to_char(
                        ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                        'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
                    ),
                    'columns', (
                        select
                            jsonb_agg(
                                jsonb_build_object(
                                    'name', pa.attname,
                                    'type', pt.typname
                                )
                                order by pa.attnum asc
                            )
                        from
                            pg_attribute pa
                            join pg_type pt
                                on pa.atttypid = pt.oid
                            left join (
                                select unnest(conkey) as pkey_attnum
                                from pg_constraint
                                where conrelid = entity_ and contype = 'p'
                            ) pk on pk.pkey_attnum = pa.attnum
                        where
                            attrelid = entity_
                            and attnum > 0
                            and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
                            and (working_selected_columns is null or pa.attname = any(working_selected_columns) or pk.pkey_attnum is not null)
                    )
                )
                -- Add "record" key for insert and update
                || case
                    when action in ('INSERT', 'UPDATE') then
                        jsonb_build_object(
                            'record',
                            (
                                select
                                    jsonb_object_agg(
                                        -- if unchanged toast, get column name and value from old record
                                        coalesce((c).name, (oc).name),
                                        case
                                            when (c).name is null then (oc).value
                                            else (c).value
                                        end
                                    )
                                from
                                    unnest(columns) c
                                    full outer join unnest(old_columns) oc
                                        on (c).name = (oc).name
                                where
                                    coalesce((c).is_selectable, (oc).is_selectable)
                                    and (working_selected_columns is null or coalesce((c).name, (oc).name) = any(working_selected_columns) or coalesce((c).is_pkey, (oc).is_pkey))
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            )
                        )
                    else '{}'::jsonb
                end
                -- Add "old_record" key for update and delete
                || case
                    when action = 'UPDATE' then
                        jsonb_build_object(
                                'old_record',
                                (
                                    select jsonb_object_agg((c).name, (c).value)
                                    from unnest(old_columns) c
                                    where
                                        (c).is_selectable
                                        and (working_selected_columns is null or (c).name = any(working_selected_columns) or (c).is_pkey)
                                        and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                )
                            )
                    when action = 'DELETE' then
                        jsonb_build_object(
                            'old_record',
                            (
                                select jsonb_object_agg((c).name, (c).value)
                                from unnest(old_columns) c
                                where
                                    (c).is_selectable
                                    and (working_selected_columns is null or (c).name = any(working_selected_columns) or (c).is_pkey)
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                    and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                            )
                        )
                    else '{}'::jsonb
                end;

                -- Filter visible_role_sub_ids to those matching the current selected_columns group
                visible_to_subscription_ids = coalesce(
                    (
                        select array_agg(s.subscription_id)
                        from unnest(subscriptions) s
                        where s.claims_role = working_role
                          and (s.selected_columns is not distinct from working_selected_columns)
                          and s.subscription_id = any(visible_role_sub_ids)
                    ),
                    '{}'::uuid[]
                );

                return next (
                    output,
                    is_rls_enabled,
                    visible_to_subscription_ids,
                    case
                        when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                        else '{}'
                    end
                )::realtime.wal_rls;
            end loop;

        end if;
    end loop;

    perform set_config('role', null, true);
end;
$$;


--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
declare
  res jsonb;
begin
  if type_::text = 'bytea' then
    return to_jsonb(val);
  end if;
  execute format('select to_jsonb(%L::'|| type_::text || ')', val) into res;
  return res;
end
$$;


--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
/*
Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
*/
declare
    op_symbol text = (
        case
            when op = 'eq' then '='
            when op = 'neq' then '!='
            when op = 'lt' then '<'
            when op = 'lte' then '<='
            when op = 'gt' then '>'
            when op = 'gte' then '>='
            when op = 'in' then '= any'
            else 'UNKNOWN OP'
        end
    );
    res boolean;
begin
    execute format(
        'select %L::'|| type_::text || ' ' || op_symbol
        || ' ( %L::'
        || (
            case
                when op = 'in' then type_::text || '[]'
                else type_::text end
        )
        || ')', val_1, val_2) into res;
    return res;
end;
$$;


--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text, negate boolean) RETURNS boolean
    LANGUAGE plpgsql STABLE
    AS $$
declare
    op_symbol text;
    res boolean;
begin
    -- IS DISTINCT FROM / IS NOT DISTINCT FROM: infix, both sides typed literals
    if op = 'isdistinct' then
        execute format(
            'select %L::%s %s %L::%s',
            val_1,
            type_::text,
            case when negate then 'IS NOT DISTINCT FROM' else 'IS DISTINCT FROM' end,
            val_2,
            type_::text
        ) into res;
        return res;
    end if;

    -- IS requires a keyword RHS (NULL, TRUE, FALSE, UNKNOWN), not a typed literal
    if op = 'is' then
        if val_2 not in ('null', 'true', 'false', 'unknown') then
            raise exception 'invalid value for is filter: must be null, true, false, or unknown';
        end if;
        execute format(
            'select %L::%s %s %s',
            val_1,
            type_::text,
            case when negate then 'IS NOT' else 'IS' end,
            upper(val_2)
        ) into res;
        return res;
    end if;

    op_symbol = case
        when op = 'eq'    then '='
        when op = 'neq'   then '!='
        when op = 'lt'    then '<'
        when op = 'lte'   then '<='
        when op = 'gt'    then '>'
        when op = 'gte'   then '>='
        when op = 'in'    then '= any'
        when op = 'like'   then 'LIKE'
        when op = 'ilike'  then 'ILIKE'
        when op = 'match'  then '~'
        when op = 'imatch' then '~*'
        else null
    end;

    if op_symbol is null then
        raise exception 'unsupported equality operator: %', op::text;
    end if;

    execute format(
        'select %L::%s %s (%L::%s)',
        val_1,
        type_::text,
        op_symbol,
        val_2,
        case when op = 'in' then type_::text || '[]' else type_::text end
    ) into res;

    return case when negate then not res else res end;
end;
$$;


--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
    select
        filters is null
        or array_length(filters, 1) is null
        or coalesce(
            count(col.name) = count(1)
            and sum(
                realtime.check_equality_op(
                    op:=f.op,
                    type_:=coalesce(col.type_oid::regtype, col.type_name::regtype),
                    val_1:=col.value #>> '{}',
                    val_2:=f.value,
                    negate:=coalesce(f.negate, false)
                )::int
            ) filter (where col.name is not null) = count(col.name),
            false
        )
    from
        unnest(filters) f
        left join unnest(columns) col
            on f.column_name = col.name;
$$;


--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS TABLE(wal jsonb, is_rls_enabled boolean, subscription_ids uuid[], errors text[], slot_changes_count bigint)
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
  WITH pub AS (
    SELECT
      concat_ws(
        ',',
        CASE WHEN bool_or(pubinsert) THEN 'insert' ELSE NULL END,
        CASE WHEN bool_or(pubupdate) THEN 'update' ELSE NULL END,
        CASE WHEN bool_or(pubdelete) THEN 'delete' ELSE NULL END
      ) AS w2j_actions,
      coalesce(
        string_agg(
          realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
          ','
        ) filter (WHERE ppt.tablename IS NOT NULL),
        ''
      ) AS w2j_add_tables
    FROM pg_publication pp
    LEFT JOIN pg_publication_tables ppt ON pp.pubname = ppt.pubname
    WHERE pp.pubname = publication
    GROUP BY pp.pubname
    LIMIT 1
  ),
  -- MATERIALIZED ensures pg_logical_slot_get_changes is called exactly once
  w2j AS MATERIALIZED (
    SELECT x.*, pub.w2j_add_tables
    FROM pub,
         pg_logical_slot_get_changes(
           slot_name, null, max_changes,
           'include-pk', 'true',
           'include-transaction', 'false',
           'include-timestamp', 'true',
           'include-type-oids', 'true',
           'format-version', '2',
           'actions', pub.w2j_actions,
           'add-tables', pub.w2j_add_tables
         ) x
  ),
  slot_count AS (
    SELECT count(*)::bigint AS cnt
    FROM w2j
    WHERE w2j.w2j_add_tables <> ''
  ),
  rls_filtered AS (
    SELECT xyz.wal, xyz.is_rls_enabled, xyz.subscription_ids, xyz.errors
    FROM w2j,
         realtime.apply_rls(
           wal := w2j.data::jsonb,
           max_record_bytes := max_record_bytes
         ) xyz(wal, is_rls_enabled, subscription_ids, errors)
    WHERE w2j.w2j_add_tables <> ''
      AND xyz.subscription_ids[1] IS NOT NULL
  )
  SELECT rf.wal, rf.is_rls_enabled, rf.subscription_ids, rf.errors, sc.cnt
  FROM rls_filtered rf, slot_count sc

  UNION ALL

  SELECT null, null, null, null, sc.cnt
  FROM slot_count sc
  WHERE NOT EXISTS (SELECT 1 FROM rls_filtered)
$$;


--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  SELECT
    realtime.wal2json_escape_identifier(nsp.nspname::text)
    || '.'
    || realtime.wal2json_escape_identifier(pc.relname::text)
  FROM pg_class pc
  JOIN pg_namespace nsp ON pc.relnamespace = nsp.oid
  WHERE pc.oid = entity
$$;


--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      RAISE WARNING 'WarnSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


--
-- Name: send_binary(bytea, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.send_binary(payload bytea, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
BEGIN
  BEGIN
    generated_id := gen_random_uuid();

    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    INSERT INTO realtime.messages (id, binary_payload, event, topic, private, extension)
    VALUES (generated_id, payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      RAISE WARNING 'WarnSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
    col_names text[] = coalesce(
            array_agg(a.attname order by a.attnum),
            '{}'::text[]
        )
        from
            pg_catalog.pg_attribute a
        where
            a.attrelid = new.entity
            and a.attnum > 0
            and not a.attisdropped
            and pg_catalog.has_column_privilege(
                (new.claims ->> 'role'),
                a.attrelid,
                a.attnum,
                'SELECT'
            );
    filter realtime.user_defined_filter;
    col_type regtype;
    in_val jsonb;
    selected_col text;
begin
    for filter in select * from unnest(new.filters) loop
        if not filter.column_name = any(col_names) then
            raise exception 'invalid column for filter %', filter.column_name;
        end if;

        col_type = (
            select atttypid::regtype
            from pg_catalog.pg_attribute
            where attrelid = new.entity
                  and attname = filter.column_name
        );
        if col_type is null then
            raise exception 'failed to lookup type for column %', filter.column_name;
        end if;

        if filter.op = 'in'::realtime.equality_op then
            in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
            if coalesce(jsonb_array_length(in_val), 0) > 100 then
                raise exception 'too many values for `in` filter. Maximum 100';
            end if;
        elsif filter.op = 'is'::realtime.equality_op then
            -- `is` requires a keyword RHS rather than a typed literal
            if filter.value not in ('null', 'true', 'false', 'unknown') then
                raise exception 'invalid value for is filter: must be null, true, false, or unknown';
            end if;
            -- IS NULL works for any type, but IS TRUE/FALSE/UNKNOWN require a boolean
            -- operand. Reject the non-null keywords on non-boolean columns here so they
            -- don't abort apply_rls at WAL time.
            if filter.value <> 'null' and col_type <> 'boolean'::regtype then
                raise exception 'is % filter requires a boolean column, got %', filter.value, col_type::text;
            end if;
        elsif filter.op in ('like'::realtime.equality_op, 'ilike'::realtime.equality_op) then
            -- like/ilike apply the text pattern operator (~~); reject column types that
            -- have no such operator instead of failing at WAL time
            if not exists (
                select 1 from pg_catalog.pg_operator
                where oprname = '~~' and oprleft = col_type
            ) then
                raise exception 'operator % requires a text-compatible column type, got %', filter.op::text, col_type::text;
            end if;
        elsif filter.op in ('match'::realtime.equality_op, 'imatch'::realtime.equality_op) then
            -- match/imatch apply the regex operators ~ / ~*; reject column types that have
            -- no such operator (e.g. integer) instead of failing at WAL time, mirroring the
            -- like/ilike guard above.
            if not exists (
                select 1 from pg_catalog.pg_operator
                where oprname = case when filter.op = 'imatch'::realtime.equality_op then '~*' else '~' end
                  and oprleft = col_type
                  and oprright = col_type
                  and oprresult = 'boolean'::regtype
            ) then
                raise exception 'operator % requires a text-compatible column type, got %', filter.op::text, col_type::text;
            end if;
            -- validate the regex eagerly so a bad pattern is rejected here, not inside
            -- apply_rls where it would abort the WAL stream for the entity
            begin
                perform '' ~ filter.value;
            exception when others then
                raise exception 'invalid regular expression for % filter: %', filter.op::text, sqlerrm;
            end;
        else
            -- eq/neq/lt/lte/gt/gte: value must be coercable to the type
            perform realtime.cast(filter.value, col_type);
        end if;
    end loop;

    if new.selected_columns is not null then
        for selected_col in select * from unnest(new.selected_columns) loop
            if not selected_col = any(col_names) then
                raise exception 'invalid column for select %', selected_col;
            end if;
        end loop;
    end if;

    -- Apply consistent order to filters so the unique constraint can't be tricked by a
    -- different filter order. negate is part of the sort key.
    new.filters = coalesce(
        array_agg(f order by f.column_name, f.op, f.value, f.negate),
        '{}'
    ) from unnest(new.filters) f;

    new.selected_columns = (
        select array_agg(c order by c)
        from unnest(new.selected_columns) c
    );

    return new;
end;
$$;


--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


--
-- Name: wal2json_escape_identifier(text); Type: FUNCTION; Schema: realtime; Owner: -
--

CREATE FUNCTION realtime.wal2json_escape_identifier(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
  -- Prefix `\`, `,`, `.`, and any whitespace with `\`
  SELECT regexp_replace(name, '([\\,.[:space:]])', '\\\1', 'g')
$$;


--
-- Name: allow_any_operation(text[]); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.allow_any_operation(expected_operations text[]) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT CASE
      WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
      ELSE raw_operation
    END AS current_operation
    FROM current_operation
  )
  SELECT EXISTS (
    SELECT 1
    FROM normalized n
    CROSS JOIN LATERAL unnest(expected_operations) AS expected_operation
    WHERE expected_operation IS NOT NULL
      AND expected_operation <> ''
      AND n.current_operation = CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END
  );
$$;


--
-- Name: allow_only_operation(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.allow_only_operation(expected_operation text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
  WITH current_operation AS (
    SELECT storage.operation() AS raw_operation
  ),
  normalized AS (
    SELECT
      CASE
        WHEN raw_operation LIKE 'storage.%' THEN substr(raw_operation, 9)
        ELSE raw_operation
      END AS current_operation,
      CASE
        WHEN expected_operation LIKE 'storage.%' THEN substr(expected_operation, 9)
        ELSE expected_operation
      END AS requested_operation
    FROM current_operation
  )
  SELECT CASE
    WHEN requested_operation IS NULL OR requested_operation = '' THEN FALSE
    ELSE COALESCE(current_operation = requested_operation, FALSE)
  END
  FROM normalized;
$$;


--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Get the last path segment (the actual filename)
    SELECT _parts[array_length(_parts, 1)] INTO _filename;
    -- Extract extension: reverse, split on '.', then reverse again
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    RETURN _parts[array_length(_parts, 1)];
END
$$;


--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


--
-- Name: get_common_prefix(text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_common_prefix(p_key text, p_prefix text, p_delimiter text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT CASE
    WHEN position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)) > 0
    THEN left(p_key, length(p_prefix) + position(p_delimiter IN substring(p_key FROM length(p_prefix) + 1)))
    ELSE NULL
END;
$$;


--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint)::bigint as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.list_objects_with_delimiter(_bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;

    -- Configuration
    v_is_asc BOOLEAN;
    v_prefix TEXT;
    v_start TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_is_asc := lower(coalesce(sort_order, 'asc')) = 'asc';
    v_prefix := coalesce(prefix_param, '');
    v_start := CASE WHEN coalesce(next_token, '') <> '' THEN next_token ELSE coalesce(start_after, '') END;
    v_file_batch_size := LEAST(GREATEST(max_keys * 2, 100), 1000);

    -- Calculate upper bound for prefix filtering (bytewise, using COLLATE "C")
    IF v_prefix = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix, 1) = delimiter_param THEN
        v_upper_bound := left(v_prefix, -1) || chr(ascii(delimiter_param) + 1);
    ELSE
        v_upper_bound := left(v_prefix, -1) || chr(ascii(right(v_prefix, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'AND o.name COLLATE "C" < $3 ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" >= $2 ' ||
                'ORDER BY o.name COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'AND o.name COLLATE "C" >= $3 ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND o.name COLLATE "C" < $2 ' ||
                'ORDER BY o.name COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- ========================================================================
    -- SEEK INITIALIZATION: Determine starting position
    -- ========================================================================
    IF v_start = '' THEN
        IF v_is_asc THEN
            v_next_seek := v_prefix;
        ELSE
            -- DESC without cursor: find the last item in range
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_next_seek FROM storage.objects o
                WHERE o.bucket_id = _bucket_id
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;

            IF v_next_seek IS NOT NULL THEN
                v_next_seek := v_next_seek || delimiter_param;
            ELSE
                RETURN;
            END IF;
        END IF;
    ELSE
        -- Cursor provided: determine if it refers to a folder or leaf
        IF EXISTS (
            SELECT 1 FROM storage.objects o
            WHERE o.bucket_id = _bucket_id
              AND o.name COLLATE "C" LIKE v_start || delimiter_param || '%'
            LIMIT 1
        ) THEN
            -- Cursor refers to a folder
            IF v_is_asc THEN
                v_next_seek := v_start || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_start || delimiter_param;
            END IF;
        ELSE
            -- Cursor refers to a leaf object
            IF v_is_asc THEN
                v_next_seek := v_start || delimiter_param;
            ELSE
                v_next_seek := v_start;
            END IF;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= max_keys;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek AND o.name COLLATE "C" < v_upper_bound
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" >= v_next_seek
                ORDER BY o.name COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek AND o.name COLLATE "C" >= v_prefix
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = _bucket_id AND o.name COLLATE "C" < v_next_seek
                ORDER BY o.name COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(v_peek_name, v_prefix, delimiter_param);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Emit and skip to next folder (no heap access needed)
            name := rtrim(v_common_prefix, delimiter_param);
            id := NULL;
            updated_at := NULL;
            created_at := NULL;
            last_accessed_at := NULL;
            metadata := NULL;
            RETURN NEXT;
            v_count := v_count + 1;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := left(v_common_prefix, -1) || chr(ascii(delimiter_param) + 1);
            ELSE
                v_next_seek := v_common_prefix;
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query USING _bucket_id, v_next_seek,
                CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix) ELSE v_prefix END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(v_current.name, v_prefix, delimiter_param);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := v_current.name;
                    EXIT;
                END IF;

                -- Emit file
                name := v_current.name;
                id := v_current.id;
                updated_at := v_current.updated_at;
                created_at := v_current.created_at;
                last_accessed_at := v_current.last_accessed_at;
                metadata := v_current.metadata;
                RETURN NEXT;
                v_count := v_count + 1;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := v_current.name || delimiter_param;
                ELSE
                    v_next_seek := v_current.name;
                END IF;

                EXIT WHEN v_count >= max_keys;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


--
-- Name: protect_delete(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.protect_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Check if storage.allow_delete_query is set to 'true'
    IF COALESCE(current_setting('storage.allow_delete_query', true), 'false') != 'true' THEN
        RAISE EXCEPTION 'Direct deletion from storage tables is not allowed. Use the Storage API instead.'
            USING HINT = 'This prevents accidental data loss from orphaned objects.',
                  ERRCODE = '42501';
    END IF;
    RETURN NULL;
END;
$$;


--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_peek_name TEXT;
    v_current RECORD;
    v_common_prefix TEXT;
    v_delimiter CONSTANT TEXT := '/';

    -- Configuration
    v_limit INT;
    v_prefix TEXT;
    v_prefix_lower TEXT;
    v_prefix_len INT;
    v_prefix_start INT;
    v_combined_levels INT;
    v_is_asc BOOLEAN;
    v_order_by TEXT;
    v_sort_order TEXT;
    v_upper_bound TEXT;
    v_file_batch_size INT;

    -- Dynamic SQL for batch query only
    v_batch_query TEXT;

    -- Seek state
    v_next_seek TEXT;
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- ========================================================================
    -- INITIALIZATION
    -- ========================================================================
    v_limit := LEAST(coalesce(limits, 100), 1500);
    v_prefix := coalesce(prefix, '') || coalesce(search, '');
    v_prefix_lower := lower(v_prefix);
    v_prefix_len := length(coalesce(prefix, ''));
    v_prefix_start := coalesce(array_length(string_to_array(coalesce(prefix, ''), v_delimiter), 1), 1);
    v_combined_levels := coalesce(array_length(string_to_array(v_prefix, v_delimiter), 1), 1);
    v_is_asc := lower(coalesce(sortorder, 'asc')) = 'asc';
    v_file_batch_size := LEAST(GREATEST(v_limit * 2, 100), 1000);

    -- Validate sort column
    CASE lower(coalesce(sortcolumn, 'name'))
        WHEN 'name' THEN v_order_by := 'name';
        WHEN 'updated_at' THEN v_order_by := 'updated_at';
        WHEN 'created_at' THEN v_order_by := 'created_at';
        WHEN 'last_accessed_at' THEN v_order_by := 'last_accessed_at';
        ELSE v_order_by := 'name';
    END CASE;

    v_sort_order := CASE WHEN v_is_asc THEN 'asc' ELSE 'desc' END;

    -- ========================================================================
    -- NON-NAME SORTING: Use path_tokens approach
    -- ========================================================================
    IF v_order_by != 'name' THEN
        RETURN QUERY EXECUTE format(
            $sql$
            WITH folders AS (
                SELECT array_to_string(path_tokens[$1:$2], '/') AS folder
                FROM storage.objects
                WHERE objects.name ILIKE $3 || '%%'
                  AND bucket_id = $4
                  AND array_length(objects.path_tokens, 1) <> $2
                GROUP BY folder
                ORDER BY folder %s
            )
            (SELECT folder AS "name",
                   NULL::uuid AS id,
                   NULL::timestamptz AS updated_at,
                   NULL::timestamptz AS created_at,
                   NULL::timestamptz AS last_accessed_at,
                   NULL::jsonb AS metadata FROM folders)
            UNION ALL
            (SELECT array_to_string(path_tokens[$1:$2], '/') AS "name",
                   id, updated_at, created_at, last_accessed_at, metadata
             FROM storage.objects
             WHERE objects.name ILIKE $3 || '%%'
               AND bucket_id = $4
               AND array_length(objects.path_tokens, 1) = $2
             ORDER BY %I %s)
            LIMIT $5 OFFSET $6
            $sql$, v_sort_order, v_order_by, v_sort_order
        ) USING v_prefix_start, v_combined_levels, v_prefix, bucketname, v_limit, offsets;
        RETURN;
    END IF;

    -- ========================================================================
    -- NAME SORTING: Hybrid skip-scan with batch optimization
    -- ========================================================================

    -- Calculate upper bound for prefix filtering
    IF v_prefix_lower = '' THEN
        v_upper_bound := NULL;
    ELSIF right(v_prefix_lower, 1) = v_delimiter THEN
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(v_delimiter) + 1);
    ELSE
        v_upper_bound := left(v_prefix_lower, -1) || chr(ascii(right(v_prefix_lower, 1)) + 1);
    END IF;

    -- Build batch query (dynamic SQL - called infrequently, amortized over many rows)
    IF v_is_asc THEN
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'AND lower(o.name) COLLATE "C" < $3 ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" >= $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" ASC LIMIT $4';
        END IF;
    ELSE
        IF v_upper_bound IS NOT NULL THEN
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'AND lower(o.name) COLLATE "C" >= $3 ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        ELSE
            v_batch_query := 'SELECT o.name, o.id, o.updated_at, o.created_at, o.last_accessed_at, o.metadata ' ||
                'FROM storage.objects o WHERE o.bucket_id = $1 AND lower(o.name) COLLATE "C" < $2 ' ||
                'ORDER BY lower(o.name) COLLATE "C" DESC LIMIT $4';
        END IF;
    END IF;

    -- Initialize seek position
    IF v_is_asc THEN
        v_next_seek := v_prefix_lower;
    ELSE
        -- DESC: find the last item in range first (static SQL)
        IF v_upper_bound IS NOT NULL THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower AND lower(o.name) COLLATE "C" < v_upper_bound
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSIF v_prefix_lower <> '' THEN
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_prefix_lower
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        ELSE
            SELECT o.name INTO v_peek_name FROM storage.objects o
            WHERE o.bucket_id = bucketname
            ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
        END IF;

        IF v_peek_name IS NOT NULL THEN
            v_next_seek := lower(v_peek_name) || v_delimiter;
        ELSE
            RETURN;
        END IF;
    END IF;

    -- ========================================================================
    -- MAIN LOOP: Hybrid peek-then-batch algorithm
    -- Uses STATIC SQL for peek (hot path) and DYNAMIC SQL for batch
    -- ========================================================================
    LOOP
        EXIT WHEN v_count >= v_limit;

        -- STEP 1: PEEK using STATIC SQL (plan cached, very fast)
        IF v_is_asc THEN
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek AND lower(o.name) COLLATE "C" < v_upper_bound
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" >= v_next_seek
                ORDER BY lower(o.name) COLLATE "C" ASC LIMIT 1;
            END IF;
        ELSE
            IF v_upper_bound IS NOT NULL THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSIF v_prefix_lower <> '' THEN
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek AND lower(o.name) COLLATE "C" >= v_prefix_lower
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            ELSE
                SELECT o.name INTO v_peek_name FROM storage.objects o
                WHERE o.bucket_id = bucketname AND lower(o.name) COLLATE "C" < v_next_seek
                ORDER BY lower(o.name) COLLATE "C" DESC LIMIT 1;
            END IF;
        END IF;

        EXIT WHEN v_peek_name IS NULL;

        -- STEP 2: Check if this is a FOLDER or FILE
        v_common_prefix := storage.get_common_prefix(lower(v_peek_name), v_prefix_lower, v_delimiter);

        IF v_common_prefix IS NOT NULL THEN
            -- FOLDER: Handle offset, emit if needed, skip to next folder
            IF v_skipped < offsets THEN
                v_skipped := v_skipped + 1;
            ELSE
                name := substring(rtrim(storage.get_common_prefix(v_peek_name, v_prefix, v_delimiter), v_delimiter) from v_prefix_len + 1);
                id := NULL;
                updated_at := NULL;
                created_at := NULL;
                last_accessed_at := NULL;
                metadata := NULL;
                RETURN NEXT;
                v_count := v_count + 1;
            END IF;

            -- Advance seek past the folder range
            IF v_is_asc THEN
                v_next_seek := lower(left(v_common_prefix, -1)) || chr(ascii(v_delimiter) + 1);
            ELSE
                v_next_seek := lower(v_common_prefix);
            END IF;
        ELSE
            -- FILE: Batch fetch using DYNAMIC SQL (overhead amortized over many rows)
            -- For ASC: upper_bound is the exclusive upper limit (< condition)
            -- For DESC: prefix_lower is the inclusive lower limit (>= condition)
            FOR v_current IN EXECUTE v_batch_query
                USING bucketname, v_next_seek,
                    CASE WHEN v_is_asc THEN COALESCE(v_upper_bound, v_prefix_lower) ELSE v_prefix_lower END, v_file_batch_size
            LOOP
                v_common_prefix := storage.get_common_prefix(lower(v_current.name), v_prefix_lower, v_delimiter);

                IF v_common_prefix IS NOT NULL THEN
                    -- Hit a folder: exit batch, let peek handle it
                    v_next_seek := lower(v_current.name);
                    EXIT;
                END IF;

                -- Handle offset skipping
                IF v_skipped < offsets THEN
                    v_skipped := v_skipped + 1;
                ELSE
                    -- Emit file
                    name := substring(v_current.name from v_prefix_len + 1);
                    id := v_current.id;
                    updated_at := v_current.updated_at;
                    created_at := v_current.created_at;
                    last_accessed_at := v_current.last_accessed_at;
                    metadata := v_current.metadata;
                    RETURN NEXT;
                    v_count := v_count + 1;
                END IF;

                -- Advance seek past this file
                IF v_is_asc THEN
                    v_next_seek := lower(v_current.name) || v_delimiter;
                ELSE
                    v_next_seek := lower(v_current.name);
                END IF;

                EXIT WHEN v_count >= v_limit;
            END LOOP;
        END IF;
    END LOOP;
END;
$_$;


--
-- Name: search_by_timestamp(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_by_timestamp(p_prefix text, p_bucket_id text, p_limit integer, p_level integer, p_start_after text, p_sort_order text, p_sort_column text, p_sort_column_after text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    v_cursor_op text;
    v_query text;
    v_prefix text;
    v_sort_order text;
    v_sort_column text;
BEGIN
    v_prefix := coalesce(p_prefix, '');

    -- Defense-in-depth: this function is independently reachable and must
    -- not trust p_sort_order/p_sort_column to already be validated by a
    -- caller. Normalize to the same strict allow-list storage.search_v2
    -- uses before interpolating anything into dynamic SQL below.
    v_sort_order := lower(coalesce(p_sort_order, 'asc'));
    IF v_sort_order NOT IN ('asc', 'desc') THEN
        v_sort_order := 'asc';
    END IF;

    v_sort_column := lower(coalesce(p_sort_column, 'updated_at'));
    IF v_sort_column NOT IN ('updated_at', 'created_at') THEN
        v_sort_column := 'updated_at';
    END IF;

    IF v_sort_order = 'asc' THEN
        v_cursor_op := '>';
    ELSE
        v_cursor_op := '<';
    END IF;

    v_query := format($sql$
        WITH raw_objects AS (
            SELECT
                o.name AS obj_name,
                o.id AS obj_id,
                o.updated_at AS obj_updated_at,
                o.created_at AS obj_created_at,
                o.last_accessed_at AS obj_last_accessed_at,
                o.metadata AS obj_metadata,
                storage.get_common_prefix(o.name, $1, '/') AS common_prefix
            FROM storage.objects o
            WHERE o.bucket_id = $2
              AND o.name COLLATE "C" LIKE $1 || '%%'
        ),
        -- Aggregate common prefixes (folders)
        -- Both created_at and updated_at use MIN(obj_created_at) to match the old prefixes table behavior
        aggregated_prefixes AS (
            SELECT
                rtrim(common_prefix, '/') AS name,
                NULL::uuid AS id,
                MIN(obj_created_at) AS updated_at,
                MIN(obj_created_at) AS created_at,
                NULL::timestamptz AS last_accessed_at,
                NULL::jsonb AS metadata,
                TRUE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NOT NULL
            GROUP BY common_prefix
        ),
        leaf_objects AS (
            SELECT
                obj_name AS name,
                obj_id AS id,
                obj_updated_at AS updated_at,
                obj_created_at AS created_at,
                obj_last_accessed_at AS last_accessed_at,
                obj_metadata AS metadata,
                FALSE AS is_prefix
            FROM raw_objects
            WHERE common_prefix IS NULL
        ),
        combined AS (
            SELECT * FROM aggregated_prefixes
            UNION ALL
            SELECT * FROM leaf_objects
        ),
        filtered AS (
            SELECT *
            FROM combined
            WHERE (
                $5 = ''
                OR ROW(
                    date_trunc('milliseconds', %I),
                    name COLLATE "C"
                ) %s ROW(
                    COALESCE(NULLIF($6, '')::timestamptz, 'epoch'::timestamptz),
                    $5
                )
            )
        )
        SELECT
            split_part(name, '/', $3) AS key,
            name,
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
        FROM filtered
        ORDER BY
            COALESCE(date_trunc('milliseconds', %I), 'epoch'::timestamptz) %s,
            name COLLATE "C" %s
        LIMIT $4
    $sql$,
        v_sort_column,
        v_cursor_op,
        v_sort_column,
        v_sort_order,
        v_sort_order
    );

    RETURN QUERY EXECUTE v_query
    USING v_prefix, p_bucket_id, p_level, p_limit, p_start_after, p_sort_column_after;
END;
$_$;


--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_sort_col text;
    v_sort_ord text;
    v_limit int;
BEGIN
    -- Cap limit to maximum of 1500 records
    v_limit := LEAST(coalesce(limits, 100), 1500);

    -- Validate and normalize sort_order
    v_sort_ord := lower(coalesce(sort_order, 'asc'));
    IF v_sort_ord NOT IN ('asc', 'desc') THEN
        v_sort_ord := 'asc';
    END IF;

    -- Validate and normalize sort_column
    v_sort_col := lower(coalesce(sort_column, 'name'));
    IF v_sort_col NOT IN ('name', 'updated_at', 'created_at') THEN
        v_sort_col := 'name';
    END IF;

    -- Route to appropriate implementation
    IF v_sort_col = 'name' THEN
        -- Use list_objects_with_delimiter for name sorting (most efficient: O(k * log n))
        RETURN QUERY
        SELECT
            split_part(l.name, '/', levels) AS key,
            l.name AS name,
            l.id,
            l.updated_at,
            l.created_at,
            l.last_accessed_at,
            l.metadata
        FROM storage.list_objects_with_delimiter(
            bucket_name,
            coalesce(prefix, ''),
            '/',
            v_limit,
            start_after,
            '',
            v_sort_ord
        ) l;
    ELSE
        -- Use aggregation approach for timestamp sorting
        -- Not efficient for large datasets but supports correct pagination
        RETURN QUERY SELECT * FROM storage.search_by_timestamp(
            prefix, bucket_name, v_limit, levels, start_after,
            v_sort_ord, v_sort_col, sort_column_after
        );
    END IF;
END;
$$;


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: -
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: custom_oauth_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.custom_oauth_providers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    provider_type text NOT NULL,
    identifier text NOT NULL,
    name text NOT NULL,
    client_id text NOT NULL,
    client_secret text NOT NULL,
    acceptable_client_ids text[] DEFAULT '{}'::text[] NOT NULL,
    scopes text[] DEFAULT '{}'::text[] NOT NULL,
    pkce_enabled boolean DEFAULT true NOT NULL,
    attribute_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    authorization_params jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email_optional boolean DEFAULT false NOT NULL,
    issuer text,
    discovery_url text,
    skip_nonce_check boolean DEFAULT false NOT NULL,
    cached_discovery jsonb,
    discovery_cached_at timestamp with time zone,
    authorization_url text,
    token_url text,
    userinfo_url text,
    jwks_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    custom_claims_allowlist text[] DEFAULT '{}'::text[] NOT NULL,
    CONSTRAINT custom_oauth_providers_authorization_url_https CHECK (((authorization_url IS NULL) OR (authorization_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_authorization_url_length CHECK (((authorization_url IS NULL) OR (char_length(authorization_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_client_id_length CHECK (((char_length(client_id) >= 1) AND (char_length(client_id) <= 512))),
    CONSTRAINT custom_oauth_providers_discovery_url_length CHECK (((discovery_url IS NULL) OR (char_length(discovery_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_identifier_format CHECK ((identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text)),
    CONSTRAINT custom_oauth_providers_issuer_length CHECK (((issuer IS NULL) OR ((char_length(issuer) >= 1) AND (char_length(issuer) <= 2048)))),
    CONSTRAINT custom_oauth_providers_jwks_uri_https CHECK (((jwks_uri IS NULL) OR (jwks_uri ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_jwks_uri_length CHECK (((jwks_uri IS NULL) OR (char_length(jwks_uri) <= 2048))),
    CONSTRAINT custom_oauth_providers_name_length CHECK (((char_length(name) >= 1) AND (char_length(name) <= 100))),
    CONSTRAINT custom_oauth_providers_oauth2_requires_endpoints CHECK (((provider_type <> 'oauth2'::text) OR ((authorization_url IS NOT NULL) AND (token_url IS NOT NULL) AND (userinfo_url IS NOT NULL)))),
    CONSTRAINT custom_oauth_providers_oidc_discovery_url_https CHECK (((provider_type <> 'oidc'::text) OR (discovery_url IS NULL) OR (discovery_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_issuer_https CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NULL) OR (issuer ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_oidc_requires_issuer CHECK (((provider_type <> 'oidc'::text) OR (issuer IS NOT NULL))),
    CONSTRAINT custom_oauth_providers_provider_type_check CHECK ((provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text]))),
    CONSTRAINT custom_oauth_providers_token_url_https CHECK (((token_url IS NULL) OR (token_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_token_url_length CHECK (((token_url IS NULL) OR (char_length(token_url) <= 2048))),
    CONSTRAINT custom_oauth_providers_userinfo_url_https CHECK (((userinfo_url IS NULL) OR (userinfo_url ~~ 'https://%'::text))),
    CONSTRAINT custom_oauth_providers_userinfo_url_length CHECK (((userinfo_url IS NULL) OR (char_length(userinfo_url) <= 2048)))
);


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: mfa_recovery_code_sets; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_recovery_code_sets (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    mfa_factor_id uuid NOT NULL,
    failed_verification_count integer DEFAULT 0 NOT NULL,
    verification_locked_until timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT mfa_recovery_code_sets_failed_verification_count_check CHECK ((failed_verification_count >= 0))
);


--
-- Name: mfa_recovery_codes; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.mfa_recovery_codes (
    id uuid NOT NULL,
    mfa_recovery_code_set_id uuid NOT NULL,
    code_hash text NOT NULL,
    consumed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


--
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


--
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: -
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: -
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: scim_tokens; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.scim_tokens (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    token_hash text NOT NULL,
    prefix text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone,
    revoked_at timestamp with time zone,
    last_used_at timestamp with time zone,
    CONSTRAINT scim_tokens_expires_at_future CHECK (((expires_at IS NULL) OR (expires_at > created_at))),
    CONSTRAINT scim_tokens_revoked_after_created CHECK (((revoked_at IS NULL) OR (revoked_at >= created_at))),
    CONSTRAINT scim_tokens_token_hash_check CHECK ((token_hash ~ '^[0-9a-f]{64}$'::text))
);


--
-- Name: scim_users; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.scim_users (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    user_id uuid,
    resource jsonb NOT NULL,
    user_name text GENERATED ALWAYS AS (lower((resource ->> 'userName'::text))) STORED NOT NULL,
    external_id text GENERATED ALWAYS AS ((resource ->> 'externalId'::text)) STORED,
    active boolean GENERATED ALWAYS AS (COALESCE(((resource ->> 'active'::text))::boolean, true)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: webauthn_challenges; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.webauthn_challenges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    challenge_type text NOT NULL,
    session_data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    CONSTRAINT webauthn_challenges_challenge_type_check CHECK ((challenge_type = ANY (ARRAY['signup'::text, 'registration'::text, 'authentication'::text])))
);


--
-- Name: webauthn_credentials; Type: TABLE; Schema: auth; Owner: -
--

CREATE TABLE auth.webauthn_credentials (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    credential_id bytea NOT NULL,
    public_key bytea NOT NULL,
    attestation_type text DEFAULT ''::text NOT NULL,
    aaguid uuid,
    sign_count bigint DEFAULT 0 NOT NULL,
    transports jsonb DEFAULT '[]'::jsonb NOT NULL,
    backup_eligible boolean DEFAULT false NOT NULL,
    backed_up boolean DEFAULT false NOT NULL,
    friendly_name text DEFAULT ''::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used_at timestamp with time zone
);


--
-- Name: __drizzle_migrations; Type: TABLE; Schema: drizzle; Owner: -
--

CREATE TABLE drizzle.__drizzle_migrations (
    id integer NOT NULL,
    hash text NOT NULL,
    created_at bigint
);


--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE; Schema: drizzle; Owner: -
--

CREATE SEQUENCE drizzle.__drizzle_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: drizzle; Owner: -
--

ALTER SEQUENCE drizzle.__drizzle_migrations_id_seq OWNED BY drizzle.__drizzle_migrations.id;


--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audit_logs (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    actor_user_id uuid,
    action text NOT NULL,
    entity_type text NOT NULL,
    entity_id text,
    before_snapshot jsonb,
    after_snapshot jsonb,
    metadata jsonb,
    ip_address text,
    user_agent text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: businesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.businesses (
    id uuid NOT NULL,
    name text NOT NULL,
    legal_name text,
    logo_url text,
    address text,
    phone text,
    currency text DEFAULT 'IDR'::text NOT NULL,
    timezone text DEFAULT 'Asia/Jakarta'::text NOT NULL,
    tax_config text,
    receipt_footer text,
    order_number_prefix text DEFAULT 'ORD'::text NOT NULL,
    default_printer_id uuid,
    service_charge_percent text,
    allow_negative_stock boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expenses (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    location_id uuid,
    category text NOT NULL,
    amount integer NOT NULL,
    expense_date date NOT NULL,
    payee text,
    reference_number text,
    notes text,
    attachment_url text,
    recurring boolean DEFAULT false NOT NULL,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ingredients (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    name text NOT NULL,
    sku text,
    category text,
    base_unit public.base_unit NOT NULL,
    current_quantity_base_units numeric(16,4) DEFAULT '0'::numeric NOT NULL,
    reorder_level_base_units numeric(16,4),
    target_stock_base_units numeric(16,4),
    average_cost_per_base_unit numeric(16,6) DEFAULT '0'::numeric NOT NULL,
    preferred_supplier_id uuid,
    active boolean DEFAULT true NOT NULL,
    notes text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    display_unit public.ingredient_display_unit
);


--
-- Name: inventory_movements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_movements (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    location_id uuid,
    ingredient_id uuid,
    movement_type public.movement_type NOT NULL,
    quantity_base_units numeric(16,4) NOT NULL,
    unit_cost numeric(16,6),
    total_cost integer,
    source_type text NOT NULL,
    source_id uuid,
    related_movement_id uuid,
    reason text,
    notes text,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    ingredient_name_snapshot text,
    ingredient_base_unit_snapshot public.base_unit
);


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locations (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    name text NOT NULL,
    address text,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: login_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.login_attempts (
    key_hash text NOT NULL,
    count integer DEFAULT 0 NOT NULL,
    window_start timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: menu_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menu_categories (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    name text NOT NULL,
    display_order integer DEFAULT 0 NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: menu_item_modifier_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menu_item_modifier_groups (
    id uuid NOT NULL,
    menu_item_id uuid NOT NULL,
    modifier_group_id uuid NOT NULL,
    display_order integer DEFAULT 0 NOT NULL
);


--
-- Name: menu_item_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menu_item_variants (
    id uuid NOT NULL,
    menu_item_id uuid NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    active boolean DEFAULT true NOT NULL,
    display_order integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menu_items (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    category_id uuid,
    name text NOT NULL,
    description text,
    image_url text,
    base_price integer NOT NULL,
    tax_behavior text DEFAULT 'exclusive'::text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    archived_at timestamp with time zone,
    tracks_inventory boolean DEFAULT true NOT NULL,
    display_order integer DEFAULT 0 NOT NULL,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: modifier_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modifier_groups (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    name text NOT NULL,
    required boolean DEFAULT false NOT NULL,
    min_selections integer DEFAULT 0 NOT NULL,
    max_selections integer DEFAULT 1 NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: modifier_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modifier_options (
    id uuid NOT NULL,
    modifier_group_id uuid NOT NULL,
    name text NOT NULL,
    price_adjustment integer DEFAULT 0 NOT NULL,
    active boolean DEFAULT true NOT NULL,
    display_order integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: modifier_recipe_lines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modifier_recipe_lines (
    id uuid NOT NULL,
    modifier_option_id uuid NOT NULL,
    ingredient_id uuid NOT NULL,
    quantity_base_units numeric(16,4) NOT NULL,
    waste_percentage numeric(5,2) DEFAULT '0'::numeric
);


--
-- Name: order_ingredient_consumption; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_ingredient_consumption (
    id uuid NOT NULL,
    order_id uuid NOT NULL,
    order_line_id uuid NOT NULL,
    ingredient_id uuid,
    quantity_base_units numeric(16,4) NOT NULL,
    unit_cost_snapshot numeric(16,6) NOT NULL,
    total_cost integer NOT NULL,
    inventory_movement_id uuid,
    ingredient_name_snapshot text,
    ingredient_base_unit_snapshot public.base_unit
);


--
-- Name: order_line_modifiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_line_modifiers (
    id uuid NOT NULL,
    order_line_id uuid NOT NULL,
    modifier_option_id uuid,
    modifier_name_snapshot text NOT NULL,
    price_adjustment_snapshot integer DEFAULT 0 NOT NULL,
    cogs_adjustment_snapshot integer DEFAULT 0 NOT NULL
);


--
-- Name: order_lines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_lines (
    id uuid NOT NULL,
    order_id uuid NOT NULL,
    menu_item_id uuid,
    menu_item_variant_id uuid,
    item_name_snapshot text NOT NULL,
    variant_name_snapshot text,
    quantity integer NOT NULL,
    unit_price_snapshot integer NOT NULL,
    line_total integer NOT NULL,
    cogs_snapshot integer DEFAULT 0 NOT NULL,
    gross_profit_snapshot integer DEFAULT 0 NOT NULL,
    notes text,
    category_name_snapshot text
);


--
-- Name: order_number_counters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_number_counters (
    business_id uuid NOT NULL,
    last_number integer NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    location_id uuid,
    order_number text NOT NULL,
    status public.order_status DEFAULT 'DRAFT'::public.order_status NOT NULL,
    order_type public.order_type DEFAULT 'dine_in'::public.order_type NOT NULL,
    table_label text,
    subtotal integer DEFAULT 0 NOT NULL,
    discount_total integer DEFAULT 0 NOT NULL,
    tax_total integer DEFAULT 0 NOT NULL,
    service_charge_total integer DEFAULT 0 NOT NULL,
    total integer DEFAULT 0 NOT NULL,
    cogs_total integer DEFAULT 0 NOT NULL,
    gross_profit integer DEFAULT 0 NOT NULL,
    gross_margin_percentage numeric(6,2),
    payment_method_label text,
    notes text,
    idempotency_key text NOT NULL,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    cancelled_at timestamp with time zone,
    cancelled_by uuid,
    cancellation_reason text,
    refunded_at timestamp with time zone,
    refunded_by uuid,
    refund_reason text,
    cash_received integer,
    change_due integer
);


--
-- Name: print_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.print_jobs (
    id uuid NOT NULL,
    order_id uuid NOT NULL,
    destination public.print_destination NOT NULL,
    provider public.print_provider NOT NULL,
    status public.print_status DEFAULT 'QUEUED'::public.print_status NOT NULL,
    attempt_count integer DEFAULT 0 NOT NULL,
    payload_snapshot jsonb NOT NULL,
    last_error text,
    requested_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    processed_at timestamp with time zone,
    printed_at timestamp with time zone,
    request_key text,
    claim_token uuid,
    lease_expires_at timestamp with time zone
);


--
-- Name: purchase_lines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_lines (
    id uuid NOT NULL,
    purchase_id uuid NOT NULL,
    ingredient_id uuid,
    quantity_purchased numeric(16,4) NOT NULL,
    purchase_unit text NOT NULL,
    conversion_to_base_units numeric(16,6) NOT NULL,
    quantity_base_units numeric(16,4) NOT NULL,
    total_line_cost integer NOT NULL,
    cost_per_base_unit numeric(16,6) NOT NULL,
    ingredient_name_snapshot text,
    ingredient_base_unit_snapshot public.base_unit
);


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchases (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    location_id uuid,
    supplier_id uuid,
    invoice_number text,
    purchase_date date NOT NULL,
    status public.purchase_status DEFAULT 'DRAFT'::public.purchase_status NOT NULL,
    total_cost integer DEFAULT 0 NOT NULL,
    created_by uuid,
    finalized_at timestamp with time zone,
    reversed_by_purchase_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: recipe_lines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recipe_lines (
    id uuid NOT NULL,
    recipe_id uuid NOT NULL,
    ingredient_id uuid NOT NULL,
    quantity_base_units numeric(16,4) NOT NULL,
    waste_percentage numeric(5,2) DEFAULT '0'::numeric,
    notes text
);


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recipes (
    id uuid NOT NULL,
    menu_item_variant_id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by uuid
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id uuid NOT NULL,
    name public.role_name NOT NULL
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_hash text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    user_agent text,
    ip_address text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: stock_count_lines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_count_lines (
    id uuid NOT NULL,
    stock_count_id uuid NOT NULL,
    ingredient_id uuid,
    system_quantity numeric(16,4) NOT NULL,
    counted_quantity numeric(16,4) NOT NULL,
    difference_quantity numeric(16,4) NOT NULL,
    ingredient_name_snapshot text,
    ingredient_base_unit_snapshot public.base_unit
);


--
-- Name: stock_counts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_counts (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    location_id uuid,
    status public.stock_count_status DEFAULT 'OPEN'::public.stock_count_status NOT NULL,
    counted_by uuid,
    submitted_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.suppliers (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    name text NOT NULL,
    contact_name text,
    phone text,
    email text,
    address text,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_roles (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password_hash text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: waste_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.waste_records (
    id uuid NOT NULL,
    business_id uuid NOT NULL,
    location_id uuid,
    ingredient_id uuid,
    quantity_base_units numeric(16,4) NOT NULL,
    reason public.waste_reason NOT NULL,
    estimated_cost integer NOT NULL,
    notes text,
    photo_url text,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    ingredient_name_snapshot text,
    ingredient_base_unit_snapshot public.base_unit
);


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    binary_payload bytea,
    skip_broadcast boolean DEFAULT false NOT NULL
)
PARTITION BY RANGE (inserted_at);


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone DEFAULT now()
);


--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: -
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    action_filter text DEFAULT '*'::text,
    selected_columns text[],
    CONSTRAINT subscription_action_filter_check CHECK ((action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text])))
);


--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: -
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL,
    versioning_status text DEFAULT 'DISABLED'::text NOT NULL,
    CONSTRAINT buckets_versioning_dark_check CHECK ((versioning_status = 'DISABLED'::text)),
    CONSTRAINT buckets_versioning_standard_only_check CHECK (((type = 'STANDARD'::storage.buckettype) OR (versioning_status = 'DISABLED'::text))),
    CONSTRAINT buckets_versioning_status_check CHECK ((versioning_status = ANY (ARRAY['DISABLED'::text, 'ENABLED'::text, 'SUSPENDED'::text])))
);


--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: objects; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    archived_at timestamp with time zone,
    is_delete_marker boolean DEFAULT false NOT NULL,
    is_versioned boolean DEFAULT false NOT NULL
);


--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: -
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb,
    metadata jsonb
);


--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: __drizzle_migrations id; Type: DEFAULT; Schema: drizzle; Owner: -
--

ALTER TABLE ONLY drizzle.__drizzle_migrations ALTER COLUMN id SET DEFAULT nextval('drizzle.__drizzle_migrations_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.custom_oauth_providers (id, provider_type, identifier, name, client_id, client_secret, acceptable_client_ids, scopes, pkce_enabled, attribute_mapping, authorization_params, enabled, email_optional, issuer, discovery_url, skip_nonce_check, cached_discovery, discovery_cached_at, authorization_url, token_url, userinfo_url, jwks_uri, created_at, updated_at, custom_claims_allowlist) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at, invite_token, referrer, oauth_client_state_id, linking_target_id, email_optional) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: mfa_recovery_code_sets; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_recovery_code_sets (id, user_id, mfa_factor_id, failed_verification_count, verification_locked_until, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_recovery_codes; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_recovery_codes (id, mfa_recovery_code_set_id, code_hash, consumed_at, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at, expires_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
20251104100000
20251111201300
20251201000000
20260115000000
20260121000000
20260219120000
20260302000000
20260625000000
20260821000000
20260821010000
20260824000000
20260824000001
20260831180000
\.


--
-- Data for Name: scim_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.scim_tokens (id, sso_provider_id, token_hash, prefix, created_at, expires_at, revoked_at, last_used_at) FROM stdin;
\.


--
-- Data for Name: scim_users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.scim_users (id, sso_provider_id, user_id, resource, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- Data for Name: __drizzle_migrations; Type: TABLE DATA; Schema: drizzle; Owner: -
--

COPY drizzle.__drizzle_migrations (id, hash, created_at) FROM stdin;
1	cc475f864fb0194ca04ce225615df0f004a4b000572d64de5a539bc1a5be7e59	1789104265198
2	916423f13dcb0d26b412a535cbb748566d46219368fb9463244bc8bb0bdac31c	1789196298283
3	0ba87391ab91a63efa50c919ac4730f3f73cc2aacc0951b2253b566285a9bf98	1789301661342
4	a52e2ec4074646be80e8721d8c7bd1290965f50e4d9e22917f49f1bbbdc0b672	1789302323299
5	b4d5f80f84c1041c2565acbbc776ac5fadd27a709ec49ffb784e7cf20ec8a071	1789454413699
6	d0e948c786ca76f0d8cb56eb2c9c2e44d04c1c513dc98ed9e2194318d934426c	1789468788562
7	a445680d859e6bea83a4cff588f00c345986d1aa1b17004a38ae29e93706a8be	1789475720083
8	a7fa421b49bf2bae87559ac3f8c2f397a4b66d166ea0116f8d8226627a9da39f	1789564132367
9	cc9d49722553ff2fed12945128871a27e68176da76cce12b5e8e58bbb3ba8e8b	1789565017489
10	8c67e26af72c5ae4f2ab780ec5d4d1e039eb6689ebceec717e952d8bee7955bd	1789562076568
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.audit_logs (id, business_id, actor_user_id, action, entity_type, entity_id, before_snapshot, after_snapshot, metadata, ip_address, user_agent, created_at) FROM stdin;
2d75ccb9-edb8-4bfc-8311-2f51ef512fd6	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	\N	2026-09-13 06:24:20.933612+00
508b72c4-f4f9-49a0-ae71-9a87ead361a9	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	\N	2026-09-13 06:24:21.457675+00
cfa79aa1-c504-44fc-a80a-d916775b6c49	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	114.10.44.92	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 06:26:27.990656+00
1ceb7a75-bbcd-41a9-ae7b-9bc58752ced4	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	user.deactivated	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	\N	2026-09-13 06:27:04.878628+00
4fabcff1-4a4b-44a6-af41-1d1c9c13a6f0	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	user.reactivated	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	\N	2026-09-13 06:27:06.206772+00
abd94897-eae8-48ba-9a84-7571e04ceda8	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	114.10.44.92	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 07:05:44.459211+00
bcca2293-6020-4e29-b200-d6768cf9d923	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	\N	2026-09-13 07:08:20.00464+00
d7f06c1b-5bb8-402e-be59-ae78e87e89fa	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	\N	2026-09-13 07:08:20.486401+00
b5cf8b25-f970-4161-8120-fe8c2615fce4	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	login	user	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	\N	\N	\N	\N	\N	2026-09-13 07:08:20.962423+00
ea15fab2-bc67-4eb8-a344-f134f4374906	99a43f10-309d-40d0-b266-57f43b9b070a	ce3921aa-0dde-4b16-ba1d-8b5b44edba54	login	user	ce3921aa-0dde-4b16-ba1d-8b5b44edba54	\N	\N	\N	\N	\N	2026-09-13 07:08:21.417462+00
4cf13cc4-8795-4faa-9424-40f8ffc529b1	99a43f10-309d-40d0-b266-57f43b9b070a	9a46b839-07de-4358-bbf0-b4c0b3e1906c	login	user	9a46b839-07de-4358-bbf0-b4c0b3e1906c	\N	\N	\N	\N	\N	2026-09-13 07:08:21.875141+00
254977de-bdae-44bd-b725-d02bd0e2a4a4	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	114.10.44.92	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 07:09:31.740673+00
3251f20b-c74c-470d-a141-3ca4be6535f6	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	114.10.44.92	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 07:10:54.355224+00
b7c6c44c-62b6-4802-b358-a5a419c30435	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	\N	2026-09-13 07:12:17.086239+00
56856d13-ab1b-43b7-8801-0d6e9687ee17	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	\N	2026-09-13 07:12:17.343946+00
d72f08dc-d300-41cd-81d9-082f718d5c5f	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	login	user	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	\N	\N	\N	\N	\N	2026-09-13 07:12:17.608961+00
ad4a854a-b8a9-4455-bb66-fb09cf5346e0	99a43f10-309d-40d0-b266-57f43b9b070a	ce3921aa-0dde-4b16-ba1d-8b5b44edba54	login	user	ce3921aa-0dde-4b16-ba1d-8b5b44edba54	\N	\N	\N	\N	\N	2026-09-13 07:12:17.87028+00
b81464f3-9ce0-4f43-91fd-28fef34cdcca	99a43f10-309d-40d0-b266-57f43b9b070a	9a46b839-07de-4358-bbf0-b4c0b3e1906c	login	user	9a46b839-07de-4358-bbf0-b4c0b3e1906c	\N	\N	\N	\N	\N	2026-09-13 07:12:18.1366+00
92830324-fff9-4118-bfe7-ce10092e3a1c	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	login	user	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	\N	\N	\N	114.10.44.92	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 07:12:45.980128+00
9454bec1-2502-4e78-bde3-33371bb7872a	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-13 07:36:35.433581+00
fdbba5e7-3158-4e35-920e-22659d2d86e5	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-13 08:10:51.322207+00
af4a1e4a-5777-4012-8b95-b17d935c5f2b	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 08:55:11.921853+00
173168fe-e0be-4ead-891c-abadf68b6ffd	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.created	menu_item	55843206-d1c1-4d49-b385-7edb575573e6	\N	{"id": "55843206-d1c1-4d49-b385-7edb575573e6", "name": "Es Batu", "active": true, "imageUrl": null, "basePrice": 3000, "createdAt": "2026-09-13T08:58:14.483Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "updatedAt": "2026-09-13T08:58:14.483Z", "updatedBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "archivedAt": null, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "categoryId": null, "description": null, "taxBehavior": "exclusive", "displayOrder": 0, "tracksInventory": true}	\N	\N	\N	2026-09-13 08:58:14.483012+00
27f98618-d0da-4e79-87ca-1783df35447c	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.created	menu_item_variant	6ea3f072-91ea-4606-80fc-983dd0c7a05e	\N	{"id": "6ea3f072-91ea-4606-80fc-983dd0c7a05e", "name": "Regular", "price": 3000, "active": true, "createdAt": "2026-09-13T08:58:14.483Z", "updatedAt": "2026-09-13T08:58:14.483Z", "menuItemId": "55843206-d1c1-4d49-b385-7edb575573e6", "displayOrder": 0}	{"menuItemId": "55843206-d1c1-4d49-b385-7edb575573e6", "autoCreated": true}	\N	\N	2026-09-13 08:58:14.483012+00
3ad1c8e5-9d68-4284-a40e-0093ffa257ca	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.updated	menu_item	55843206-d1c1-4d49-b385-7edb575573e6	\N	{"id": "55843206-d1c1-4d49-b385-7edb575573e6", "name": "Es Batu", "active": true, "imageUrl": null, "basePrice": 3000, "createdAt": "2026-09-13T08:58:14.483Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "updatedAt": "2026-09-13T08:58:21.283Z", "updatedBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "archivedAt": null, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "categoryId": null, "description": null, "taxBehavior": "exclusive", "displayOrder": 0, "tracksInventory": true}	\N	\N	\N	2026-09-13 08:58:21.245094+00
41c9078f-856c-431c-9fe0-cb5d3bd158b1	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	8fdfca84-46a9-4154-864c-c8ba736acd14	\N	{"id": "8fdfca84-46a9-4154-864c-c8ba736acd14", "notes": null, "total": 27000, "status": "SUBMITTED", "subtotal": 32000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-13T08:59:52.555Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": "o", "cancelledAt": null, "cancelledBy": null, "grossProfit": 27000, "orderNumber": "MTS-00001", "refundReason": null, "discountTotal": 5000, "idempotencyKey": "6e477a81-f176-4f66-91b1-fcce16f57e7e", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-13 08:59:52.555565+00
26d2dd6b-9511-41b9-a631-c116c911c23f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e	\N	{"id": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "sku": null, "name": "Es batu", "notes": null, "active": true, "baseUnit": "gram", "category": "Drink", "createdAt": "2026-09-13T09:02:31.156Z", "updatedAt": "2026-09-13T09:02:31.156Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "1000.000000", "currentQuantityBaseUnits": "0.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:02:31.161265+00
379baa51-3b39-403f-8da8-ae63b075031f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	27854ede-85a4-4f10-b334-f518fc671799	\N	\N	{"version": 1, "menuItemVariantId": "33724e05-3d2e-431f-bc47-2f549d1f8210"}	\N	\N	2026-09-14 07:23:06.703564+00
b5d3e8dc-1e0d-491c-ac38-98f9afdd739b	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	2927ecfc-c15a-434c-b0ba-ce053207851b	\N	{"id": "2927ecfc-c15a-434c-b0ba-ce053207851b", "notes": null, "total": 3000, "status": "SUBMITTED", "subtotal": 3000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-13T09:03:12.821Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 3000, "orderNumber": "MTS-00002", "refundReason": null, "discountTotal": 0, "idempotencyKey": "4c14bf9c-b802-40d6-a82c-9a5fd172abf3", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-13 09:03:12.821395+00
da94d868-7b52-4ba0-8c57-7d7d951d7e7a	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	inventory.manual_adjustment	inventory_movement	87a91ed2-8a32-4efc-85bc-d5787657f39c	\N	\N	{"notes": "", "reason": "Beli di VIVI", "direction": "in", "ingredientId": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "quantityBaseUnits": 1000}	\N	\N	2026-09-13 09:04:14.934053+00
544e52a7-52fe-46c6-87f4-f12c5a2b2b28	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:06:28.071698+00
8eea1d64-b2cc-492b-9682-26b1b9cf4e2f	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	login	user	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:07:27.144116+00
ec62ed55-e02c-4384-9dcd-70abd7c25731	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	order.submitted	order	5695a532-1c04-496f-8498-0b27e3d82d20	\N	{"id": "5695a532-1c04-496f-8498-0b27e3d82d20", "notes": null, "total": 27000, "status": "SUBMITTED", "subtotal": 27000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-13T09:07:36.048Z", "createdBy": "7ed187bd-6f44-47ca-9ab7-d787ea6fd35e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 27000, "orderNumber": "MTS-00003", "refundReason": null, "discountTotal": 0, "idempotencyKey": "2fa91565-53ae-4030-9724-bd701df268ca", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-13 09:07:36.048653+00
b0ed0bd0-b69b-49ea-95cf-8fc9a670ac6b	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	purchase.finalized	purchase	885233d4-3b92-469b-b261-d2345496ac74	\N	{"id": "885233d4-3b92-469b-b261-d2345496ac74", "status": "FINALIZED", "createdAt": "2026-09-13T09:15:51.392Z", "createdBy": "7ed187bd-6f44-47ca-9ab7-d787ea6fd35e", "totalCost": 90000, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "supplierId": null, "finalizedAt": "2026-09-13T09:15:51.457Z", "purchaseDate": "2026-09-13", "invoiceNumber": null, "reversedByPurchaseId": null}	\N	\N	\N	2026-09-13 09:15:51.424397+00
c52e9459-90f2-4075-85cb-23f8dfe912a5	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	ingredient.archived	ingredient	3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e	{"id": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "sku": null, "name": "Es batu", "notes": null, "active": true, "baseUnit": "gram", "category": "Drink", "createdAt": "2026-09-13T09:02:31.156Z", "updatedAt": "2026-09-13T09:15:51.454Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "68.125000", "currentQuantityBaseUnits": "16000.0000"}	{"id": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "sku": null, "name": "Es batu", "notes": null, "active": false, "baseUnit": "gram", "category": "Drink", "createdAt": "2026-09-13T09:02:31.156Z", "updatedAt": "2026-09-13T09:17:11.135Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "68.125000", "currentQuantityBaseUnits": "16000.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:17:11.102056+00
79a7b6df-7053-4b55-9110-dd7eb5aabb4f	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	ingredient.restored	ingredient	3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e	{"id": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "sku": null, "name": "Es batu", "notes": null, "active": false, "baseUnit": "gram", "category": "Drink", "createdAt": "2026-09-13T09:02:31.156Z", "updatedAt": "2026-09-13T09:17:11.135Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "68.125000", "currentQuantityBaseUnits": "16000.0000"}	{"id": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "sku": null, "name": "Es batu", "notes": null, "active": true, "baseUnit": "gram", "category": "Drink", "createdAt": "2026-09-13T09:02:31.156Z", "updatedAt": "2026-09-13T09:17:13.859Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "68.125000", "currentQuantityBaseUnits": "16000.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:17:13.823588+00
55484609-dd25-4342-ba87-1e55c65013a7	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	logout	user	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:17:24.066995+00
33dfb060-95a9-4e9b-9b6e-7b6816641410	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:17:33.397877+00
8c3e1042-af4d-4fa2-baef-56f511f84606	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	851a2a4b-8bbd-410a-8ef5-7ce2bd067566	\N	{"id": "851a2a4b-8bbd-410a-8ef5-7ce2bd067566", "notes": null, "total": 3000, "status": "SUBMITTED", "subtotal": 3000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-13T09:26:02.788Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 3000, "orderNumber": "MTS-00004", "refundReason": null, "discountTotal": 0, "idempotencyKey": "35d67d29-6069-446b-8228-ef779c23d46d", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-13 09:26:02.788894+00
4d15c2ee-1023-43df-aee1-7e57b68e8232	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.updated	menu_item	55843206-d1c1-4d49-b385-7edb575573e6	\N	{"id": "55843206-d1c1-4d49-b385-7edb575573e6", "name": "Es Batu", "active": false, "imageUrl": null, "basePrice": 3000, "createdAt": "2026-09-13T08:58:14.483Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "updatedAt": "2026-09-13T09:26:15.439Z", "updatedBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "archivedAt": null, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "categoryId": null, "description": null, "taxBehavior": "exclusive", "displayOrder": 0, "tracksInventory": true}	\N	\N	\N	2026-09-13 09:26:15.405575+00
bd019bf8-6634-4c0d-8299-8285610aaddd	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 11:49:32.803293+00
da73afae-40c3-461a-9d34-fee9064a6c70	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.updated	menu_item	55843206-d1c1-4d49-b385-7edb575573e6	\N	{"id": "55843206-d1c1-4d49-b385-7edb575573e6", "name": "Es Batu", "active": true, "imageUrl": null, "basePrice": 3000, "createdAt": "2026-09-13T08:58:14.483Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "updatedAt": "2026-09-13T09:26:29.868Z", "updatedBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "archivedAt": null, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "categoryId": null, "description": null, "taxBehavior": "exclusive", "displayOrder": 0, "tracksInventory": true}	\N	\N	\N	2026-09-13 09:26:29.840038+00
3f2a7eec-fbe9-4c89-ad1a-40135b807644	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.archived	ingredient	3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e	{"id": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "sku": null, "name": "Es batu", "notes": null, "active": true, "baseUnit": "gram", "category": "Drink", "createdAt": "2026-09-13T09:02:31.156Z", "updatedAt": "2026-09-13T09:17:13.859Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "68.125000", "currentQuantityBaseUnits": "16000.0000"}	{"id": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "sku": null, "name": "Es batu", "notes": null, "active": false, "baseUnit": "gram", "category": "Drink", "createdAt": "2026-09-13T09:02:31.156Z", "updatedAt": "2026-09-13T09:26:35.536Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "68.125000", "currentQuantityBaseUnits": "16000.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:26:35.500068+00
d62661a6-7df4-4083-871c-80914d06c571	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.archived	menu_item_variant	6ea3f072-91ea-4606-80fc-983dd0c7a05e	\N	{"id": "6ea3f072-91ea-4606-80fc-983dd0c7a05e", "name": "Regular", "price": 3000, "active": false, "createdAt": "2026-09-13T08:58:14.483Z", "updatedAt": "2026-09-13T09:27:26.674Z", "menuItemId": "55843206-d1c1-4d49-b385-7edb575573e6", "displayOrder": 0}	{"menuItemId": "55843206-d1c1-4d49-b385-7edb575573e6"}	\N	\N	2026-09-13 09:27:26.637796+00
2fbb1e34-ffec-44a6-aa7e-e6202c0b86ae	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.restored	ingredient	3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e	{"id": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "sku": null, "name": "Es batu", "notes": null, "active": false, "baseUnit": "gram", "category": "Drink", "createdAt": "2026-09-13T09:02:31.156Z", "updatedAt": "2026-09-13T09:26:35.536Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "68.125000", "currentQuantityBaseUnits": "16000.0000"}	{"id": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "sku": null, "name": "Es batu", "notes": null, "active": true, "baseUnit": "gram", "category": "Drink", "createdAt": "2026-09-13T09:02:31.156Z", "updatedAt": "2026-09-13T09:27:37.246Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "68.125000", "currentQuantityBaseUnits": "16000.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:27:37.210443+00
3006e88a-02d3-41ae-85f8-24372ba8c9a3	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.restored	menu_item_variant	6ea3f072-91ea-4606-80fc-983dd0c7a05e	\N	{"id": "6ea3f072-91ea-4606-80fc-983dd0c7a05e", "name": "Regular", "price": 3000, "active": true, "createdAt": "2026-09-13T08:58:14.483Z", "updatedAt": "2026-09-13T09:27:27.404Z", "menuItemId": "55843206-d1c1-4d49-b385-7edb575573e6", "displayOrder": 0}	{"menuItemId": "55843206-d1c1-4d49-b385-7edb575573e6"}	\N	\N	2026-09-13 09:27:27.37733+00
a738c424-b446-4323-9c60-f220e167e56f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.restored	menu_item_variant	6ea3f072-91ea-4606-80fc-983dd0c7a05e	\N	{"id": "6ea3f072-91ea-4606-80fc-983dd0c7a05e", "name": "Regular", "price": 3000, "active": true, "createdAt": "2026-09-13T08:58:14.483Z", "updatedAt": "2026-09-13T09:27:29.389Z", "menuItemId": "55843206-d1c1-4d49-b385-7edb575573e6", "displayOrder": 0}	{"menuItemId": "55843206-d1c1-4d49-b385-7edb575573e6"}	\N	\N	2026-09-13 09:27:29.353943+00
3a5f2c94-663f-4222-b019-fd6eb7593100	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	c599b162-7f54-49b0-98db-a4672b3d1d9a	\N	{"id": "c599b162-7f54-49b0-98db-a4672b3d1d9a", "sku": null, "name": "Mie goreng", "notes": null, "active": true, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:31:52.547Z", "updatedAt": "2026-09-13T09:31:52.547Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "40.0000", "reorderLevelBaseUnits": "20.0000", "averageCostPerBaseUnit": "1.000000", "currentQuantityBaseUnits": "0.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:31:52.551496+00
586ba0ec-805b-4c61-bac1-8e9e2ff7bafd	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.archived	ingredient	c599b162-7f54-49b0-98db-a4672b3d1d9a	{"id": "c599b162-7f54-49b0-98db-a4672b3d1d9a", "sku": null, "name": "Mie goreng", "notes": null, "active": true, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:31:52.547Z", "updatedAt": "2026-09-13T09:31:52.547Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "40.0000", "reorderLevelBaseUnits": "20.0000", "averageCostPerBaseUnit": "1.000000", "currentQuantityBaseUnits": "0.0000"}	{"id": "c599b162-7f54-49b0-98db-a4672b3d1d9a", "sku": null, "name": "Mie goreng", "notes": null, "active": false, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:31:52.547Z", "updatedAt": "2026-09-13T09:32:20.649Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "40.0000", "reorderLevelBaseUnits": "20.0000", "averageCostPerBaseUnit": "1.000000", "currentQuantityBaseUnits": "0.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:32:20.612318+00
d093f02d-196e-43c5-872e-5fbd9095ef00	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.restored	ingredient	c599b162-7f54-49b0-98db-a4672b3d1d9a	{"id": "c599b162-7f54-49b0-98db-a4672b3d1d9a", "sku": null, "name": "Mie goreng", "notes": null, "active": false, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:31:52.547Z", "updatedAt": "2026-09-13T09:32:20.649Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "40.0000", "reorderLevelBaseUnits": "20.0000", "averageCostPerBaseUnit": "1.000000", "currentQuantityBaseUnits": "0.0000"}	{"id": "c599b162-7f54-49b0-98db-a4672b3d1d9a", "sku": null, "name": "Mie goreng", "notes": null, "active": true, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:31:52.547Z", "updatedAt": "2026-09-13T09:32:21.772Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "40.0000", "reorderLevelBaseUnits": "20.0000", "averageCostPerBaseUnit": "1.000000", "currentQuantityBaseUnits": "0.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:32:21.735089+00
bef0ba9d-bb6f-47f9-9e54-024c92f51b62	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.archived	ingredient	c599b162-7f54-49b0-98db-a4672b3d1d9a	{"id": "c599b162-7f54-49b0-98db-a4672b3d1d9a", "sku": null, "name": "Mie goreng", "notes": null, "active": true, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:31:52.547Z", "updatedAt": "2026-09-13T09:32:21.772Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "40.0000", "reorderLevelBaseUnits": "20.0000", "averageCostPerBaseUnit": "1.000000", "currentQuantityBaseUnits": "0.0000"}	{"id": "c599b162-7f54-49b0-98db-a4672b3d1d9a", "sku": null, "name": "Mie goreng", "notes": null, "active": false, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:31:52.547Z", "updatedAt": "2026-09-13T09:32:25.136Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "40.0000", "reorderLevelBaseUnits": "20.0000", "averageCostPerBaseUnit": "1.000000", "currentQuantityBaseUnits": "0.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:32:25.101668+00
2b2a2f34-1aa2-4233-a2ac-3df52c587de8	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.restored	ingredient	c599b162-7f54-49b0-98db-a4672b3d1d9a	{"id": "c599b162-7f54-49b0-98db-a4672b3d1d9a", "sku": null, "name": "Mie goreng", "notes": null, "active": false, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:31:52.547Z", "updatedAt": "2026-09-13T09:32:25.136Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "40.0000", "reorderLevelBaseUnits": "20.0000", "averageCostPerBaseUnit": "1.000000", "currentQuantityBaseUnits": "0.0000"}	{"id": "c599b162-7f54-49b0-98db-a4672b3d1d9a", "sku": null, "name": "Mie goreng", "notes": null, "active": true, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:31:52.547Z", "updatedAt": "2026-09-13T09:32:25.801Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "40.0000", "reorderLevelBaseUnits": "20.0000", "averageCostPerBaseUnit": "1.000000", "currentQuantityBaseUnits": "0.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:32:25.76482+00
149371ec-5536-438c-bdb1-fb0b065b867e	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.archived	menu_item_variant	6ea3f072-91ea-4606-80fc-983dd0c7a05e	\N	{"id": "6ea3f072-91ea-4606-80fc-983dd0c7a05e", "name": "Regular", "price": 3000, "active": false, "createdAt": "2026-09-13T08:58:14.483Z", "updatedAt": "2026-09-13T09:27:28.204Z", "menuItemId": "55843206-d1c1-4d49-b385-7edb575573e6", "displayOrder": 0}	{"menuItemId": "55843206-d1c1-4d49-b385-7edb575573e6"}	\N	\N	2026-09-13 09:27:28.179478+00
4c48f0ad-0350-4125-868d-3031cc50e10a	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	\N	{"id": "3c6c1770-6c98-4e0f-9c5b-dc215e4896ae", "sku": null, "name": "Mie goreng original", "notes": null, "active": true, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:34:40.365Z", "updatedAt": "2026-09-13T09:34:40.365Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "40.0000", "reorderLevelBaseUnits": "20.0000", "averageCostPerBaseUnit": "3000.000000", "currentQuantityBaseUnits": "0.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:34:40.372502+00
f0b3094d-4c11-41fa-ad99-61d1f1fc92f2	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	91f12ef6-dab9-4370-843f-71024607e1e2	\N	{"id": "91f12ef6-dab9-4370-843f-71024607e1e2", "sku": null, "name": "cabe", "notes": null, "active": true, "baseUnit": "gram", "category": "food", "createdAt": "2026-09-13T09:38:44.825Z", "updatedAt": "2026-09-13T09:38:44.825Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "9.0000", "reorderLevelBaseUnits": "1.0000", "averageCostPerBaseUnit": "44.400000", "currentQuantityBaseUnits": "0.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:38:44.832542+00
38b6a62d-5761-44e0-bce9-b523cd011dd6	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	de449976-7785-4384-b858-834d42348ef4	\N	{"id": "de449976-7785-4384-b858-834d42348ef4", "sku": null, "name": "telur", "notes": null, "active": true, "baseUnit": "piece", "category": "food", "createdAt": "2026-09-13T09:40:05.348Z", "updatedAt": "2026-09-13T09:40:05.348Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "60.0000", "reorderLevelBaseUnits": "30.0000", "averageCostPerBaseUnit": "1733.000000", "currentQuantityBaseUnits": "0.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 09:40:05.355167+00
d5ff503b-f1d4-4c40-a146-aa12e61d0f22	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	purchase.finalized	purchase	b80378ae-eb70-4a2a-a9e3-8ef2b7391129	\N	{"id": "b80378ae-eb70-4a2a-a9e3-8ef2b7391129", "status": "FINALIZED", "createdAt": "2026-09-13T09:50:28.541Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "totalCost": 177200, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "supplierId": null, "finalizedAt": "2026-09-13T09:50:28.637Z", "purchaseDate": "2026-09-13", "invoiceNumber": null, "reversedByPurchaseId": null}	\N	\N	\N	2026-09-13 09:50:28.61029+00
f2b403e8-ba3c-429e-a2a7-7cb2acc7ca4d	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	b151749a-fc69-4a9f-8187-b920502c0c1e	\N	\N	{"version": 1, "menuItemVariantId": "ada4b6c8-9ef2-477a-bb0e-4a020517fd0b"}	\N	\N	2026-09-13 09:51:52.16364+00
4fa3037b-0db6-4cf9-87e2-f3e478cc2f7d	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	12617950-f860-4154-948d-f25485cde92c	\N	{"id": "12617950-f860-4154-948d-f25485cde92c", "notes": null, "total": 15000, "status": "SUBMITTED", "subtotal": 15000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-13T09:52:19.558Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 15000, "orderNumber": "MTS-00005", "refundReason": null, "discountTotal": 0, "idempotencyKey": "cdc5d672-60fa-4876-8612-6484db8b6c39", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-13 09:52:19.558061+00
646fbacb-4fe4-4100-af90-cebd97c54e52	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.updated	menu_item	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	\N	{"id": "a4ae43af-e8f7-4625-a7a4-ae7b14a14227", "name": "Mie Goreng", "active": true, "imageUrl": "/images/menu/matsudon/mie-goreng.webp", "basePrice": 15000, "createdAt": "2026-09-13T06:33:35.654Z", "createdBy": null, "updatedAt": "2026-09-13T09:53:18.466Z", "updatedBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "archivedAt": null, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "categoryId": "a61e7ac7-6fcb-4b5b-aa10-76b5f966c24d", "description": null, "taxBehavior": "exclusive", "displayOrder": 0, "tracksInventory": true}	\N	\N	\N	2026-09-13 09:53:18.436347+00
f33109e3-1953-4902-9b60-a8f1d9174a82	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	465119aa-5519-4f45-9903-d0b4d72ffe28	\N	\N	{"version": 2, "menuItemVariantId": "ada4b6c8-9ef2-477a-bb0e-4a020517fd0b"}	\N	\N	2026-09-13 09:53:23.663652+00
727e0fe4-6d2b-4435-b70a-6bda392aae9c	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	2e78449e-6865-4e98-b1b6-e076fd161fc0	\N	{"id": "2e78449e-6865-4e98-b1b6-e076fd161fc0", "notes": null, "total": 15000, "status": "SUBMITTED", "subtotal": 15000, "taxTotal": 0, "cogsTotal": 4909, "createdAt": "2026-09-13T09:53:35.216Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 10091, "orderNumber": "MTS-00006", "refundReason": null, "discountTotal": 0, "idempotencyKey": "76d4b803-d4e8-452c-9bb8-5a99b7a0c898", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "67.27"}	\N	\N	\N	2026-09-13 09:53:35.216743+00
f9f30c50-bbd6-40db-b870-6f8c683d82ac	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	637f5df3-697a-4644-b827-e3fa8f43fc30	\N	{"id": "637f5df3-697a-4644-b827-e3fa8f43fc30", "notes": null, "total": 150000, "status": "SUBMITTED", "subtotal": 150000, "taxTotal": 0, "cogsTotal": 49090, "createdAt": "2026-09-13T09:54:25.617Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 100910, "orderNumber": "MTS-00007", "refundReason": null, "discountTotal": 0, "idempotencyKey": "674683ff-a298-40cd-8f80-5a6aa2f766cc", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "67.27"}	\N	\N	\N	2026-09-13 09:54:25.617942+00
99363746-41fd-418c-8a5a-70c8b233fa8a	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	expense.created	expense	1987b168-a7c6-4fe4-a346-1272b6c0a6a3	\N	{"id": "1987b168-a7c6-4fe4-a346-1272b6c0a6a3", "notes": null, "payee": "pln", "amount": 1000000, "category": "electricity", "createdAt": "2026-09-13T09:58:55.654Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "recurring": true, "updatedAt": "2026-09-13T09:58:55.654Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "expenseDate": "2026-09-13", "attachmentUrl": null, "referenceNumber": "Monthly"}	\N	\N	\N	2026-09-13 09:58:55.662727+00
8c8d2dc2-99ca-430e-91ad-0f496335013d	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 11:57:59.670654+00
971d23ae-6d46-4a4b-9a8a-6f898939910e	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	7c124622-584b-4778-8693-4a29a0f913f6	\N	{"id": "7c124622-584b-4778-8693-4a29a0f913f6", "notes": null, "total": 225000, "status": "SUBMITTED", "subtotal": 225000, "taxTotal": 0, "cogsTotal": 73635, "createdAt": "2026-09-13T09:55:43.121Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 151365, "orderNumber": "MTS-00008", "refundReason": null, "discountTotal": 0, "idempotencyKey": "1d4917cf-d219-4276-adab-d07a7f839e7d", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "67.27"}	\N	\N	\N	2026-09-13 09:55:43.121495+00
fd6efa97-ef44-4675-b5c7-e03dbb1185e8	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	expense.updated	expense	1987b168-a7c6-4fe4-a346-1272b6c0a6a3	\N	{"id": "1987b168-a7c6-4fe4-a346-1272b6c0a6a3", "notes": null, "payee": "pln", "amount": 1000000, "category": "electricity", "createdAt": "2026-09-13T09:58:55.654Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "recurring": false, "updatedAt": "2026-09-13T10:00:46.791Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "expenseDate": "2026-09-13", "attachmentUrl": null, "referenceNumber": "Monthly"}	\N	\N	\N	2026-09-13 10:00:46.76093+00
2a1e4371-dc95-42a0-a689-8e420da7a8db	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	expense.updated	expense	1987b168-a7c6-4fe4-a346-1272b6c0a6a3	\N	{"id": "1987b168-a7c6-4fe4-a346-1272b6c0a6a3", "notes": null, "payee": "pln", "amount": 1000000, "category": "electricity", "createdAt": "2026-09-13T09:58:55.654Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "recurring": true, "updatedAt": "2026-09-13T09:59:08.685Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "expenseDate": "2026-09-13", "attachmentUrl": null, "referenceNumber": "Monthly"}	\N	\N	\N	2026-09-13 09:59:08.653511+00
57b924e0-5d15-4040-9934-b6338ec96da2	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	expense.updated	expense	1987b168-a7c6-4fe4-a346-1272b6c0a6a3	\N	{"id": "1987b168-a7c6-4fe4-a346-1272b6c0a6a3", "notes": null, "payee": "pln", "amount": 1000000, "category": "electricity", "createdAt": "2026-09-13T09:58:55.654Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "recurring": true, "updatedAt": "2026-09-13T09:59:29.562Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "expenseDate": "2026-09-13", "attachmentUrl": null, "referenceNumber": "Monthly"}	\N	\N	\N	2026-09-13 09:59:29.532378+00
6c613be1-5ac3-4b63-a1cd-45cc7bad0c63	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	waste.recorded	waste_record	1e11941b-5949-48dc-91ca-478e435e1000	\N	{"id": "1e11941b-5949-48dc-91ca-478e435e1000", "notes": null, "reason": "damaged", "photoUrl": null, "createdAt": "2026-09-13T10:26:04.082Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "ingredientId": "3c6c1770-6c98-4e0f-9c5b-dc215e4896ae", "estimatedCost": 2950, "quantityBaseUnits": "1.0000"}	\N	\N	\N	2026-09-13 10:26:04.119194+00
4efec989-4202-4ca8-b1fd-76615c2ad204	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:27:37.703358+00
48c8493a-e083-4e83-bc51-e649968b8e15	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:28:11.492411+00
47f85349-701f-4da8-b034-d0eb363d308f	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	order.submitted	order	259ec4b9-759f-4434-b036-f92b3032d15e	\N	{"id": "259ec4b9-759f-4434-b036-f92b3032d15e", "notes": null, "total": 73000, "status": "SUBMITTED", "subtotal": 73000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-13T10:28:31.402Z", "createdBy": "03243253-f0de-4700-ad92-3c70bd16de8d", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 73000, "orderNumber": "MTS-00009", "refundReason": null, "discountTotal": 0, "idempotencyKey": "fa16e015-173e-4e3f-ae34-d3646cc9cc22", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-13 10:28:31.402734+00
432a2834-6c7c-444b-9a16-0476f6153318	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	logout	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:35:58.558496+00
bc545b11-c003-4fb3-8d4e-234757fda894	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:36:09.063992+00
cf801520-ec5c-4350-b228-32aed42b8000	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:40:29.645398+00
4341c6dc-f4c0-4c42-8f93-34c9c74fadb4	99a43f10-309d-40d0-b266-57f43b9b070a	ce3921aa-0dde-4b16-ba1d-8b5b44edba54	login	user	ce3921aa-0dde-4b16-ba1d-8b5b44edba54	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:40:36.052959+00
aee4b42d-fe8f-4707-bc2d-3e70b520e5ab	99a43f10-309d-40d0-b266-57f43b9b070a	ce3921aa-0dde-4b16-ba1d-8b5b44edba54	logout	user	ce3921aa-0dde-4b16-ba1d-8b5b44edba54	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:42:16.164455+00
61e82d70-c34b-4216-8cae-3be1eb06c982	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:42:42.314372+00
2a8640d1-3237-4945-afe5-51e725683fb4	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	logout	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:42:46.617747+00
6c838a10-d2dd-413d-9cd6-f1efb7e106cb	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:43:07.561515+00
2f9e849e-e45d-4f15-ba6a-a7bc2c5e4406	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	logout	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:49:16.201627+00
20cf7be5-0d90-4f83-8b61-5d4fdd7a49da	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:49:51.233834+00
bc2e8777-f3ca-4356-87c5-1daa1a82ad97	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	modifier_group.created	modifier_group	a2273563-1fe0-45c1-a955-6e16cae41b93	\N	{"id": "a2273563-1fe0-45c1-a955-6e16cae41b93", "name": "Large", "active": true, "required": true, "createdAt": "2026-09-13T10:50:38.319Z", "updatedAt": "2026-09-13T10:50:38.319Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "maxSelections": 1, "minSelections": 0}	\N	\N	\N	2026-09-13 10:50:38.339399+00
88d0574e-0a38-4a03-a060-deb3bcd142d3	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	modifier_option.created	modifier_option	9ed147bb-ec5e-4b83-b698-c2fc01deffce	\N	{"id": "9ed147bb-ec5e-4b83-b698-c2fc01deffce", "name": "Large", "active": true, "createdAt": "2026-09-13T10:50:51.649Z", "updatedAt": "2026-09-13T10:50:51.649Z", "displayOrder": 0, "modifierGroupId": "a2273563-1fe0-45c1-a955-6e16cae41b93", "priceAdjustment": 7000}	{"groupId": "a2273563-1fe0-45c1-a955-6e16cae41b93"}	\N	\N	2026-09-13 10:50:51.655426+00
87aaef19-fb8c-418b-87e8-4735a810b86e	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	cc1289d4-d3bc-47f1-a111-5b2764f40142	\N	{"id": "cc1289d4-d3bc-47f1-a111-5b2764f40142", "sku": null, "name": "java a", "notes": null, "active": true, "baseUnit": "piece", "category": "Drink", "createdAt": "2026-09-13T10:51:21.508Z", "updatedAt": "2026-09-13T10:51:21.508Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1.0000", "reorderLevelBaseUnits": "1.0000", "averageCostPerBaseUnit": "1.000000", "currentQuantityBaseUnits": "0.0000"}	\N	180.241.8.236	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 10:51:21.513273+00
09edd86b-5ff2-4e2f-9dbd-96a284d5cade	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.created	menu_item_variant	33724e05-3d2e-431f-bc47-2f549d1f8210	\N	{"id": "33724e05-3d2e-431f-bc47-2f549d1f8210", "name": "Large", "price": 7000, "active": true, "createdAt": "2026-09-14T07:23:06.703Z", "updatedAt": "2026-09-14T07:23:06.703Z", "menuItemId": "1055f9a1-e494-46a6-81ec-66e94f90993c", "displayOrder": 0}	{"menuItemId": "1055f9a1-e494-46a6-81ec-66e94f90993c"}	\N	\N	2026-09-14 07:23:06.703564+00
c4d0f160-ca61-44b4-a84a-ff67742e7fcf	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.created	menu_item	37139bea-ffb9-4e0e-87d8-4229804c6bae	\N	{"id": "37139bea-ffb9-4e0e-87d8-4229804c6bae", "name": "java a", "active": true, "imageUrl": null, "basePrice": 1000, "createdAt": "2026-09-13T10:51:52.375Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "updatedAt": "2026-09-13T10:51:52.375Z", "updatedBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "archivedAt": null, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "categoryId": null, "description": null, "taxBehavior": "exclusive", "displayOrder": 0, "tracksInventory": true}	\N	\N	\N	2026-09-13 10:51:52.375082+00
252eb821-b9ba-4d90-8f03-d82c7010080f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.created	menu_item_variant	916d4164-43c5-44a2-8a9e-ab3a4092404f	\N	{"id": "916d4164-43c5-44a2-8a9e-ab3a4092404f", "name": "Regular", "price": 1000, "active": true, "createdAt": "2026-09-13T10:51:52.375Z", "updatedAt": "2026-09-13T10:51:52.375Z", "menuItemId": "37139bea-ffb9-4e0e-87d8-4229804c6bae", "displayOrder": 0}	{"menuItemId": "37139bea-ffb9-4e0e-87d8-4229804c6bae", "autoCreated": true}	\N	\N	2026-09-13 10:51:52.375082+00
97e41cbb-701e-4692-8aab-915712d220cc	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.updated	menu_item	37139bea-ffb9-4e0e-87d8-4229804c6bae	\N	{"id": "37139bea-ffb9-4e0e-87d8-4229804c6bae", "name": "java a", "active": true, "imageUrl": null, "basePrice": 1000, "createdAt": "2026-09-13T10:51:52.375Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "updatedAt": "2026-09-13T10:51:55.338Z", "updatedBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "archivedAt": null, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "categoryId": null, "description": null, "taxBehavior": "exclusive", "displayOrder": 0, "tracksInventory": true}	\N	\N	\N	2026-09-13 10:51:55.33679+00
f3ade5cc-2717-4b57-860a-3315f7351223	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.modifier_groups_updated	menu_item	37139bea-ffb9-4e0e-87d8-4229804c6bae	\N	\N	{"modifierGroupIds": ["a2273563-1fe0-45c1-a955-6e16cae41b93"]}	\N	\N	2026-09-13 10:52:07.04542+00
da96f74d-b3b7-46d9-9f50-aee9d5bbbccd	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	43386ce2-95f2-4038-bd12-48c92c478980	\N	{"id": "43386ce2-95f2-4038-bd12-48c92c478980", "notes": null, "total": 35000, "status": "SUBMITTED", "subtotal": 35000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-13T10:52:19.183Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 35000, "orderNumber": "MTS-00010", "refundReason": null, "discountTotal": 0, "idempotencyKey": "ffe8f28e-f5c6-46b2-a517-4d2c8ca36190", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-13 10:52:19.183774+00
cfff1bbb-65fd-43f9-9419-a96425aa0d5b	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	logout	user	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	\N	\N	\N	114.10.44.92	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-13 13:09:54.551832+00
f3fcbcda-7993-47a9-a89f-fe83406a9003	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-14 06:25:30.466307+00
9d5c098b-7c10-40f1-98b5-bcf5f4175778	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	f231724a-06a2-4499-a4c2-96bee6927b36	\N	{"id": "f231724a-06a2-4499-a4c2-96bee6927b36", "sku": null, "name": "Cup", "notes": null, "active": true, "baseUnit": "piece", "category": "drink", "createdAt": "2026-09-14T06:50:39.573Z", "updatedAt": "2026-09-14T06:50:39.573Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "2000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "1360.000000", "currentQuantityBaseUnits": "0.0000"}	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-14 06:50:39.593577+00
b791f550-73da-4cdc-8570-7372c9931e8d	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	\N	{"id": "b073e0d3-9ab2-4455-8dcb-6b9ef47f6352", "sku": null, "name": "Simple syrup", "notes": null, "active": true, "baseUnit": "gram", "category": "drink", "createdAt": "2026-09-14T07:02:22.355Z", "updatedAt": "2026-09-14T07:02:22.355Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "9870.0000", "reorderLevelBaseUnits": "4935.0000", "averageCostPerBaseUnit": "18.400000", "currentQuantityBaseUnits": "0.0000"}	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-14 07:02:22.367232+00
dae0e444-9fbc-407b-8da4-d1d5993d702e	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	977c2dd1-1691-4f49-8599-64ea9e3846f1	\N	{"id": "977c2dd1-1691-4f49-8599-64ea9e3846f1", "sku": null, "name": "Creamer", "notes": null, "active": true, "baseUnit": "gram", "category": "drink", "createdAt": "2026-09-14T07:03:31.870Z", "updatedAt": "2026-09-14T07:03:31.870Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "20000.0000", "reorderLevelBaseUnits": "10000.0000", "averageCostPerBaseUnit": "80.000000", "currentQuantityBaseUnits": "0.0000"}	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-14 07:03:31.885899+00
ef6b95aa-28e9-4519-91cb-00281f05bb64	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	6d14fad6-3ee7-4265-9a56-180d4c58c148	\N	{"id": "6d14fad6-3ee7-4265-9a56-180d4c58c148", "sku": null, "name": "Fresh Milk", "notes": null, "active": true, "baseUnit": "millilitre", "category": "drink", "createdAt": "2026-09-14T07:04:44.213Z", "updatedAt": "2026-09-14T07:04:44.213Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "24000.0000", "reorderLevelBaseUnits": "12000.0000", "averageCostPerBaseUnit": "20.000000", "currentQuantityBaseUnits": "0.0000"}	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-14 07:04:44.218922+00
ae53048f-41e7-48df-9b81-3d3319aba87c	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	\N	{"id": "6fe11bee-8b53-4103-9bd0-e2fa53a6408a", "sku": null, "name": "Matcha", "notes": null, "active": true, "baseUnit": "gram", "category": "drink", "createdAt": "2026-09-14T07:06:12.597Z", "updatedAt": "2026-09-14T07:06:12.597Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "3000.0000", "reorderLevelBaseUnits": "1000.0000", "averageCostPerBaseUnit": "214.000000", "currentQuantityBaseUnits": "0.0000"}	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-14 07:06:12.606147+00
18a1474d-74da-4639-a358-e3f8eaad51f8	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	purchase.finalized	purchase	0a41e275-7b29-4b03-8036-f71c1f960e4a	\N	{"id": "0a41e275-7b29-4b03-8036-f71c1f960e4a", "status": "FINALIZED", "createdAt": "2026-09-14T07:15:10.644Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "totalCost": 4744000, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "supplierId": null, "finalizedAt": "2026-09-14T07:15:10.749Z", "purchaseDate": "2026-09-14", "invoiceNumber": null, "reversedByPurchaseId": null}	\N	\N	\N	2026-09-14 07:15:10.762701+00
eddb241f-910e-47dd-8a3f-8b176531a463	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_category.created	menu_category	12642b11-cb3e-4a65-a13f-e54503f804ef	\N	{"id": "12642b11-cb3e-4a65-a13f-e54503f804ef", "name": "Drink", "active": true, "createdAt": "2026-09-14T07:15:56.178Z", "updatedAt": "2026-09-14T07:15:56.178Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "displayOrder": 0}	\N	\N	\N	2026-09-14 07:15:56.18585+00
d37a2279-e2ed-4dd4-a20c-501595971d22	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	d8a13950-dee9-4fdd-a339-1e21e366f496	\N	{"id": "d8a13950-dee9-4fdd-a339-1e21e366f496", "sku": null, "name": "Cup L", "notes": null, "active": true, "baseUnit": "piece", "category": "drink", "createdAt": "2026-09-14T07:19:08.840Z", "updatedAt": "2026-09-14T07:19:08.840Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "1400.000000", "currentQuantityBaseUnits": "0.0000"}	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-14 07:19:08.845686+00
cd855e18-07a5-41f5-a3e4-662cdfa84b89	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.updated	ingredient	f231724a-06a2-4499-a4c2-96bee6927b36	{"id": "f231724a-06a2-4499-a4c2-96bee6927b36", "sku": null, "name": "Cup", "notes": null, "active": true, "baseUnit": "piece", "category": "drink", "createdAt": "2026-09-14T06:50:39.573Z", "updatedAt": "2026-09-14T07:15:10.680Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "2000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "1360.000000", "currentQuantityBaseUnits": "1000.0000"}	{"id": "f231724a-06a2-4499-a4c2-96bee6927b36", "sku": null, "name": "Cup R", "notes": null, "active": true, "baseUnit": "piece", "category": "drink", "createdAt": "2026-09-14T06:50:39.573Z", "updatedAt": "2026-09-14T07:17:04.136Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "2000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "1360.000000", "currentQuantityBaseUnits": "1000.0000"}	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-14 07:17:04.152076+00
fd16ab43-fd08-4895-9052-0b7cff1701d5	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	purchase.finalized	purchase	8e934f80-c18a-4e13-8fab-3f5acc28d8fd	\N	{"id": "8e934f80-c18a-4e13-8fab-3f5acc28d8fd", "status": "FINALIZED", "createdAt": "2026-09-14T07:19:44.136Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "totalCost": 1400000, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "supplierId": null, "finalizedAt": "2026-09-14T07:19:44.164Z", "purchaseDate": "2026-09-14", "invoiceNumber": null, "reversedByPurchaseId": null}	\N	\N	\N	2026-09-14 07:19:44.177821+00
7ade11da-e140-481f-8ec6-3b8ccabd7c8d	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.deleted	ingredient	3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e	{"id": "3f80a4c6-b8fe-498a-9f9d-1af3e2c1388e", "sku": null, "name": "Es batu", "notes": null, "active": true, "baseUnit": "gram", "category": "Drink", "createdAt": "2026-09-13T09:02:31.156Z", "updatedAt": "2026-09-13T09:27:37.246Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "1000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "68.125000", "currentQuantityBaseUnits": "16000.0000"}	\N	{"removedFromRecipeLines": 0, "removedFromModifierLines": 0}	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-14 07:21:16.118647+00
b006b509-cc00-49bb-b1a5-026ef95e8a70	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	d906603a-b681-49de-883d-4c8e445d7110	\N	{"id": "d906603a-b681-49de-883d-4c8e445d7110", "sku": null, "name": "Ice cube", "notes": null, "active": true, "baseUnit": "gram", "category": "drink", "createdAt": "2026-09-14T07:21:48.453Z", "updatedAt": "2026-09-14T07:21:48.453Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "15000.0000", "reorderLevelBaseUnits": "1000.0000", "averageCostPerBaseUnit": "6.000000", "currentQuantityBaseUnits": "0.0000"}	\N	182.10.33.103	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-14 07:21:48.459922+00
b7b9a6b4-a592-4ce0-84f8-540d8f1e043a	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.created	menu_item	1055f9a1-e494-46a6-81ec-66e94f90993c	\N	{"id": "1055f9a1-e494-46a6-81ec-66e94f90993c", "name": "Osaka Matcha", "active": true, "imageUrl": null, "basePrice": 26000, "createdAt": "2026-09-14T07:22:18.257Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "updatedAt": "2026-09-14T07:22:18.257Z", "updatedBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "archivedAt": null, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "categoryId": "12642b11-cb3e-4a65-a13f-e54503f804ef", "description": null, "taxBehavior": "exclusive", "displayOrder": 0, "tracksInventory": true}	\N	\N	\N	2026-09-14 07:22:18.257103+00
5d44ec3d-74ea-46a9-a60b-f5e729b4656a	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.created	menu_item_variant	58381b94-8e8d-4f50-a2ad-4b34be9f266f	\N	{"id": "58381b94-8e8d-4f50-a2ad-4b34be9f266f", "name": "Regular", "price": 26000, "active": true, "createdAt": "2026-09-14T07:22:18.257Z", "updatedAt": "2026-09-14T07:22:18.257Z", "menuItemId": "1055f9a1-e494-46a6-81ec-66e94f90993c", "displayOrder": 0}	{"menuItemId": "1055f9a1-e494-46a6-81ec-66e94f90993c", "autoCreated": true}	\N	\N	2026-09-14 07:22:18.257103+00
ad7f28ec-5d38-4861-bd83-23d855345348	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.updated	menu_item	1055f9a1-e494-46a6-81ec-66e94f90993c	\N	{"id": "1055f9a1-e494-46a6-81ec-66e94f90993c", "name": "Osaka Matcha", "active": true, "imageUrl": null, "basePrice": 26000, "createdAt": "2026-09-14T07:22:18.257Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "updatedAt": "2026-09-14T07:23:42.397Z", "updatedBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "archivedAt": null, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "categoryId": "12642b11-cb3e-4a65-a13f-e54503f804ef", "description": null, "taxBehavior": "exclusive", "displayOrder": 0, "tracksInventory": true}	\N	\N	\N	2026-09-14 07:23:42.408624+00
3dca65fc-3a45-46af-9647-18279e71f09d	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	acce575b-465e-4f47-936d-41fd8ca74911	\N	\N	{"version": 1, "menuItemVariantId": "58381b94-8e8d-4f50-a2ad-4b34be9f266f"}	\N	\N	2026-09-14 07:25:57.407259+00
5ae166ea-d356-4c35-98cc-73c10a778a72	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	60fd6dda-609e-41a8-a628-fa41e6b10948	\N	\N	{"version": 2, "menuItemVariantId": "58381b94-8e8d-4f50-a2ad-4b34be9f266f"}	\N	\N	2026-09-14 07:26:05.436946+00
d935e076-5960-478b-89f6-5078ff988c3e	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	a796ca0a-68b8-4365-ae0f-1662b982da37	\N	\N	{"version": 3, "menuItemVariantId": "58381b94-8e8d-4f50-a2ad-4b34be9f266f"}	\N	\N	2026-09-14 07:27:14.338763+00
2f0b4e77-8757-4e16-87ed-04ea2a81ff93	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	d2aa0cfb-b40f-4175-bcc0-f7795233af93	\N	\N	{"version": 4, "menuItemVariantId": "58381b94-8e8d-4f50-a2ad-4b34be9f266f"}	\N	\N	2026-09-14 07:28:26.768621+00
2dbee821-be0c-4339-abfb-42c1a1f5f10b	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	ec15eafe-e2f9-462b-9415-5e7a6220a293	\N	\N	{"version": 5, "menuItemVariantId": "58381b94-8e8d-4f50-a2ad-4b34be9f266f"}	\N	\N	2026-09-14 07:29:56.645951+00
97dceb17-3b3e-44a2-bc29-b47242482bd0	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	c0e71042-6b0f-48b3-86ca-e5f92dd4be37	\N	\N	{"version": 2, "menuItemVariantId": "33724e05-3d2e-431f-bc47-2f549d1f8210"}	\N	\N	2026-09-14 07:31:13.338217+00
a6625099-3909-497e-93c8-764bfa789fb3	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.updated	menu_item_variant	33724e05-3d2e-431f-bc47-2f549d1f8210	\N	{"id": "33724e05-3d2e-431f-bc47-2f549d1f8210", "name": "Large", "price": 33000, "active": true, "createdAt": "2026-09-14T07:23:06.703Z", "updatedAt": "2026-09-14T07:31:32.703Z", "menuItemId": "1055f9a1-e494-46a6-81ec-66e94f90993c", "displayOrder": 0}	{"menuItemId": "1055f9a1-e494-46a6-81ec-66e94f90993c"}	\N	\N	2026-09-14 07:31:32.713023+00
b9f36469-5a9b-4e5f-9302-e435e3beac74	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	818c51ff-8b2d-42ba-8825-bbbadcc7cb0f	\N	\N	{"version": 3, "menuItemVariantId": "33724e05-3d2e-431f-bc47-2f549d1f8210"}	\N	\N	2026-09-14 07:32:47.336056+00
f8df9d1d-cd48-4f8c-ba9b-03595495232f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	purchase.finalized	purchase	735514c5-5e34-4c3a-b4b6-b997888e9ee0	\N	{"id": "735514c5-5e34-4c3a-b4b6-b997888e9ee0", "status": "FINALIZED", "createdAt": "2026-09-14T07:37:05.018Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "totalCost": 90000, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "supplierId": null, "finalizedAt": "2026-09-14T07:37:05.052Z", "purchaseDate": "2026-09-14", "invoiceNumber": null, "reversedByPurchaseId": null}	\N	\N	\N	2026-09-14 07:37:05.061652+00
92fd6070-048c-4fa3-addf-2e7d89763a2f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	114.10.44.92	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 08:37:13.392281+00
770e010e-d9c7-4a15-8db9-9add24860190	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 10:05:19.921358+00
df19a58f-a5f7-40b0-a909-f0598b43b595	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	logout	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 10:05:32.966104+00
3e211531-062e-43d8-b23a-38835b77598c	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 10:05:58.705927+00
70ca9d0d-bc4f-4e02-946c-fdb7ecb448a4	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	a3693ec4-937a-4299-84bf-0d6f5145e557	\N	{"id": "a3693ec4-937a-4299-84bf-0d6f5145e557", "notes": null, "total": 3000, "status": "SUBMITTED", "subtotal": 3000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T10:30:31.504Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 3000, "orderNumber": "MTS-00011", "refundReason": null, "discountTotal": 0, "idempotencyKey": "486e6079-23bf-4f73-90b7-e34c895b5db5", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 10:30:31.504099+00
19e1cc04-1f82-4c61-87aa-9691c2f20583	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	a065bff2-7977-4498-97c3-ee7304332a5c	\N	{"id": "a065bff2-7977-4498-97c3-ee7304332a5c", "notes": null, "total": 26000, "status": "SUBMITTED", "subtotal": 26000, "taxTotal": 0, "cogsTotal": 13362, "createdAt": "2026-09-15T10:31:06.019Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 12638, "orderNumber": "MTS-00012", "refundReason": null, "discountTotal": 0, "idempotencyKey": "7437dc34-62bd-48ec-9ac7-bd17ef5e8515", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "48.61"}	\N	\N	\N	2026-09-15 10:31:06.019554+00
d851c016-6b43-406a-ad0e-b6de262204d4	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	c7cfff97-909b-4107-aecd-ae4c284430f3	\N	{"id": "c7cfff97-909b-4107-aecd-ae4c284430f3", "notes": null, "total": 3000, "status": "SUBMITTED", "subtotal": 3000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T10:31:58.232Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 3000, "orderNumber": "MTS-00013", "refundReason": null, "discountTotal": 0, "idempotencyKey": "f9c616b0-98e5-475f-9964-df36210e78c7", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 10:31:58.232743+00
888d251d-d26b-4dfa-9eb4-d8f43f01eb7c	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	\N	{"id": "ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd", "notes": null, "total": 62000, "status": "SUBMITTED", "subtotal": 62000, "taxTotal": 0, "cogsTotal": 9818, "createdAt": "2026-09-15T11:06:49.438Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 52182, "orderNumber": "MTS-00014", "refundReason": null, "discountTotal": 0, "idempotencyKey": "bdfdcbd0-17c2-4f86-a275-c9e098895830", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "84.16"}	\N	\N	\N	2026-09-15 11:06:49.438107+00
05fe239f-e07e-40a0-900f-43dcceaba836	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	485fb670-ee95-451c-a338-5a6231e2baca	\N	{"id": "485fb670-ee95-451c-a338-5a6231e2baca", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T11:36:15.117Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00015", "refundReason": null, "discountTotal": 0, "idempotencyKey": "398125c8-c50d-4d04-a2b1-46e3c5286634", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 11:36:15.117752+00
d721788b-c086-4386-9229-c55dbea0b400	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	97f79f7b-6d8d-4d72-98ab-06e8e0b2f050	\N	{"id": "97f79f7b-6d8d-4d72-98ab-06e8e0b2f050", "notes": null, "total": 27000, "status": "SUBMITTED", "subtotal": 27000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T11:36:42.533Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 27000, "orderNumber": "MTS-00016", "refundReason": null, "discountTotal": 0, "idempotencyKey": "a4c0dbfe-fb38-4ea1-a451-91e276915c4d", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 11:36:42.533254+00
8f429dbc-197c-459a-9a54-f8c36a64cda7	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	343b57e0-bb33-44d9-bc5b-cde9af9adc39	\N	{"id": "343b57e0-bb33-44d9-bc5b-cde9af9adc39", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T11:37:05.700Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00017", "refundReason": null, "discountTotal": 0, "idempotencyKey": "aaeafca4-9907-4aee-b76c-3d7212989d53", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 11:37:05.700029+00
920def24-3a84-45af-901b-6cfdd7e7ee5a	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	79233c23-242a-47d5-bc7c-d769bdc214b0	\N	{"id": "79233c23-242a-47d5-bc7c-d769bdc214b0", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T11:37:24.376Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00018", "refundReason": null, "discountTotal": 0, "idempotencyKey": "06127fe7-fcf0-42c3-89d6-5cf991fe7e02", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 11:37:24.376591+00
327060ef-4c1a-4442-a6c9-6f0cef142c08	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 13:15:21.323691+00
e64ecee3-8b31-4d64-b83f-8de9e9eab030	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	inventory.manual_adjustment	inventory_movement	c67174f3-18ea-40a3-a904-90f26a5bd173	\N	\N	{"notes": "", "reason": "QA Sep16 opening stock", "direction": "in", "ingredientId": "c9584b98-d4c4-447e-8788-ec94605e4fbb", "quantityBaseUnits": 20}	\N	\N	2026-09-16 08:01:19.356769+00
715b0d2a-290a-4133-8dda-19237de84a25	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	ee5686ee-0f25-43c3-a03d-9d57b0e68ac7	\N	{"id": "ee5686ee-0f25-43c3-a03d-9d57b0e68ac7", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T11:37:55.640Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00019", "refundReason": null, "discountTotal": 0, "idempotencyKey": "e36980e3-3587-4626-9047-3467d9b6d8ae", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 11:37:55.640974+00
0c2a51ef-52b9-47e2-be23-b8a375c2e179	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 11:38:05.229079+00
ac9b3bda-3c72-440f-af9a-35137621d20f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 11:38:43.827635+00
424e875e-6b51-43c3-babe-5d311e01a547	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	217d1d44-e5f8-4bd0-96cd-9f67b7b6d990	\N	{"id": "217d1d44-e5f8-4bd0-96cd-9f67b7b6d990", "notes": null, "total": 8000, "status": "SUBMITTED", "subtotal": 8000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T11:38:57.759Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 8000, "orderNumber": "MTS-00020", "refundReason": null, "discountTotal": 0, "idempotencyKey": "69a47fb2-6b7f-44d4-bf16-35fa4e883bbc", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 11:38:57.759869+00
accd3eab-9448-49cc-bdf1-28f980983686	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	7d49481b-fc34-4fcf-a36d-6bb9332324c6	\N	{"id": "7d49481b-fc34-4fcf-a36d-6bb9332324c6", "notes": null, "total": 15000, "status": "SUBMITTED", "subtotal": 15000, "taxTotal": 0, "cogsTotal": 4909, "createdAt": "2026-09-15T11:39:24.431Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 10091, "orderNumber": "MTS-00021", "refundReason": null, "discountTotal": 0, "idempotencyKey": "6032938e-b8c6-4b4e-953e-28f5a8cbbfd2", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "67.27"}	\N	\N	\N	2026-09-15 11:39:24.431038+00
d80d9605-67a8-4415-b449-43527226ec34	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	746de8b3-e688-489e-a15e-c042994d9bbd	\N	{"id": "746de8b3-e688-489e-a15e-c042994d9bbd", "notes": null, "total": 26000, "status": "SUBMITTED", "subtotal": 26000, "taxTotal": 0, "cogsTotal": 13362, "createdAt": "2026-09-15T11:39:37.502Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 12638, "orderNumber": "MTS-00022", "refundReason": null, "discountTotal": 0, "idempotencyKey": "7b025bc8-173e-4559-85fd-1a03a357cbea", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "48.61"}	\N	\N	\N	2026-09-15 11:39:37.502369+00
2b593f67-60dd-4b6f-9b0a-8bd0141008ca	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	48d1cd40-4775-4ebc-b342-1a122bfd4862	\N	{"id": "48d1cd40-4775-4ebc-b342-1a122bfd4862", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T11:41:12.062Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00023", "refundReason": null, "discountTotal": 0, "idempotencyKey": "c70050f7-40b8-4f35-9bd7-8aaa811d58c3", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 11:41:12.062425+00
ad4a6af7-53dd-4560-a052-41847058e241	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	9f10ad6e-ad4e-48ea-9a32-fdf812c21d19	\N	{"id": "9f10ad6e-ad4e-48ea-9a32-fdf812c21d19", "notes": null, "total": 37000, "status": "SUBMITTED", "subtotal": 37000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T11:45:00.244Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 37000, "orderNumber": "MTS-00024", "refundReason": null, "discountTotal": 0, "idempotencyKey": "16880bd1-08e8-40c0-a1b2-2db96a1df225", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 11:45:00.244635+00
7ce8e0af-8a82-4cd8-b46d-647c79c6f5ad	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	f996398e-f339-40d6-8ef1-ad213751a667	\N	{"id": "f996398e-f339-40d6-8ef1-ad213751a667", "notes": null, "total": 3000, "status": "SUBMITTED", "subtotal": 3000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T11:46:38.099Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 3000, "orderNumber": "MTS-00025", "refundReason": null, "discountTotal": 0, "idempotencyKey": "37f02e53-521e-404b-9142-26ef3525bd4b", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 11:46:38.099379+00
5930568f-d971-445c-8bb0-4cbbb4788496	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	d4d3b654-b55c-48fe-9c39-24840dafdfa4	\N	{"id": "d4d3b654-b55c-48fe-9c39-24840dafdfa4", "notes": null, "total": 26000, "status": "SUBMITTED", "subtotal": 26000, "taxTotal": 0, "cogsTotal": 13362, "createdAt": "2026-09-15T11:46:54.066Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 12638, "orderNumber": "MTS-00026", "refundReason": null, "discountTotal": 0, "idempotencyKey": "daf187e4-f1a9-4231-89fb-0596219da5b0", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "48.61"}	\N	\N	\N	2026-09-15 11:46:54.066326+00
ef39d183-a0bc-4096-88e3-e35e81bf66f4	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.reprinted	print_job	362fb13b-6a18-4b24-977e-326e573eccb6	\N	\N	{"orderId": "a065bff2-7977-4498-97c3-ee7304332a5c"}	\N	\N	2026-09-15 11:49:10.990476+00
fdffafc8-bd1d-4842-82be-52be1156eeed	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	aa718ebc-b0d9-464b-a2fe-ead42925acd5	\N	{"id": "aa718ebc-b0d9-464b-a2fe-ead42925acd5", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T12:09:08.099Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00027", "refundReason": null, "discountTotal": 0, "idempotencyKey": "072389c5-8474-4e8a-832a-2989f76b53a8", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 12:09:08.099762+00
ce0d0ccf-19a6-46b5-a0ae-7689da71e6e2	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	ea097c26-d8c5-44c9-aa16-ffda556fa813	\N	{"id": "ea097c26-d8c5-44c9-aa16-ffda556fa813", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T12:09:51.934Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00028", "refundReason": null, "discountTotal": 0, "idempotencyKey": "3c769809-6ef1-48ad-8bd7-4f8039ab5378", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 12:09:51.934024+00
b0728ba7-752c-4b42-a2b7-291a31086a41	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	e5916d2a-9b5b-4564-916b-c73dcc67afbe	\N	{"id": "e5916d2a-9b5b-4564-916b-c73dcc67afbe", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T12:13:41.525Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00029", "refundReason": null, "discountTotal": 0, "idempotencyKey": "f70b0ff6-94cf-45a2-8ae6-53ff8235170d", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 12:13:41.525808+00
96650372-0889-4fa1-a4f0-6b6b8d8ad93f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	f406ffea-b4a8-487e-8efd-a5e910376819	\N	{"id": "f406ffea-b4a8-487e-8efd-a5e910376819", "notes": null, "total": 26000, "status": "SUBMITTED", "subtotal": 26000, "taxTotal": 0, "cogsTotal": 13362, "createdAt": "2026-09-15T12:14:54.065Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 12638, "orderNumber": "MTS-00030", "refundReason": null, "discountTotal": 0, "idempotencyKey": "c37dcdfa-1b5d-48ed-8e61-75a69ff45ee2", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "48.61"}	\N	\N	\N	2026-09-15 12:14:54.06537+00
e79bf6f3-0610-4285-97b1-24c780725f35	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 12:14:56.954954+00
0cd8c58d-4223-4986-b74a-b1fd22b784b5	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 12:15:10.886301+00
0e4ff033-6670-4d84-805a-3a1c192dffee	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	order.submitted	order	5d5db5a3-c625-4407-a52b-9e5182d997c6	\N	{"id": "5d5db5a3-c625-4407-a52b-9e5182d997c6", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "cogsTotal": 0, "createdAt": "2026-09-15T12:15:28.035Z", "createdBy": "03243253-f0de-4700-ad92-3c70bd16de8d", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00031", "refundReason": null, "discountTotal": 0, "idempotencyKey": "d727895e-fa34-482a-ae98-7a8afb70eb1f", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 12:15:28.035372+00
f66a9bb9-e869-4115-8499-4060541db8c6	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	cf08c9ab-789d-4277-a4f8-305d4a18f54f	\N	{"id": "cf08c9ab-789d-4277-a4f8-305d4a18f54f", "notes": null, "total": 85000, "status": "SUBMITTED", "subtotal": 85000, "taxTotal": 0, "changeDue": 15000, "cogsTotal": 0, "createdAt": "2026-09-15T12:50:47.107Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 85000, "orderNumber": "MTS-00032", "cashReceived": 100000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "2a3e3f19-3090-4fb5-a907-3f59628d51f7", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 12:50:47.107563+00
67ffc4ea-93df-469b-b66a-077ee1ec5957	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	bbbed552-0d79-4f04-8211-ad82ea464274	\N	{"id": "bbbed552-0d79-4f04-8211-ad82ea464274", "notes": null, "total": 96000, "status": "SUBMITTED", "subtotal": 96000, "taxTotal": 0, "changeDue": 4000, "cogsTotal": 0, "createdAt": "2026-09-15T12:52:11.727Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 96000, "orderNumber": "MTS-00033", "cashReceived": 100000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "df84e3b6-f1ad-40fb-b091-78afa81d2671", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 12:52:11.727132+00
a156b833-9942-4651-9928-48b5d1ed8a47	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	logout	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 12:57:09.230867+00
f447382d-07b3-4436-854b-a700c710c814	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 12:58:43.593139+00
b509f761-628f-4903-975a-01da431e394b	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 13:28:44.265283+00
e049face-878d-49f5-b4c4-dee276cb986f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 13:30:03.736996+00
7d0d8b40-0dc2-4600-8de8-0ff7f664a6ce	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	f9a11b6f-d722-4c01-8e7a-67164869ff43	\N	{"id": "f9a11b6f-d722-4c01-8e7a-67164869ff43", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "changeDue": null, "cogsTotal": 0, "createdAt": "2026-09-15T12:59:18.069Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00034", "cashReceived": null, "refundReason": null, "discountTotal": 0, "idempotencyKey": "cf0e5c94-e130-4749-8b75-4cf9f6fe3c8d", "cancellationReason": null, "paymentMethodLabel": "card (Mandiri)", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 12:59:18.069848+00
1ff0e65e-454c-4366-9761-1c23c6bc4e18	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	edf257a3-9a8b-476e-b4fc-a34e00b63deb	\N	{"id": "edf257a3-9a8b-476e-b4fc-a34e00b63deb", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "changeDue": null, "cogsTotal": 0, "createdAt": "2026-09-15T13:00:41.354Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00035", "cashReceived": null, "refundReason": null, "discountTotal": 0, "idempotencyKey": "9bd662bb-eef1-4eb5-a92f-d8aa87604880", "cancellationReason": null, "paymentMethodLabel": "card (Mandiri)", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:00:41.354505+00
c79b7f35-35b1-4972-bb12-7a0a61d68d75	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	6e5b54f9-2a86-486b-87a4-00395b3d15d0	\N	{"id": "6e5b54f9-2a86-486b-87a4-00395b3d15d0", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "changeDue": 78000, "cogsTotal": 0, "createdAt": "2026-09-15T13:01:31.335Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00036", "cashReceived": 100000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "cb931dff-34c2-4470-bf9d-c8c51972cbff", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:01:31.335815+00
cf1c677c-9600-4545-89c5-a9e1a0c54593	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	03be3215-8f21-4754-90ee-12e2e84d3922	\N	{"id": "03be3215-8f21-4754-90ee-12e2e84d3922", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "changeDue": 28000, "cogsTotal": 0, "createdAt": "2026-09-15T13:02:55.738Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00037", "cashReceived": 50000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "7b1d9997-00f6-48a2-9d24-8433a266b906", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:02:55.738128+00
9fc39194-9ac8-44bb-bb65-888740694b78	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	49652282-3bd7-40a9-9d78-c98e8da146bf	\N	{"id": "49652282-3bd7-40a9-9d78-c98e8da146bf", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "changeDue": 28000, "cogsTotal": 0, "createdAt": "2026-09-15T13:03:41.178Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00038", "cashReceived": 50000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "5235dca5-3343-4dd8-9d8e-97f8e1dd1ecb", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:03:41.178312+00
c1a3d61b-2d42-4dfe-8eb8-9d91c1c6c34e	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	0ecb73c6-9111-4580-8bc0-82ac64b41d4b	\N	{"id": "0ecb73c6-9111-4580-8bc0-82ac64b41d4b", "notes": null, "total": 27000, "status": "SUBMITTED", "subtotal": 27000, "taxTotal": 0, "changeDue": null, "cogsTotal": 0, "createdAt": "2026-09-15T13:04:00.665Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 27000, "orderNumber": "MTS-00039", "cashReceived": null, "refundReason": null, "discountTotal": 0, "idempotencyKey": "277738bd-3f47-4975-ae27-ed0cc11ae5e0", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:04:00.66508+00
1d27b737-837a-45a4-9af8-f1c24ae7bf89	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	9728cc46-902a-4e17-b6a7-542ec2061c97	\N	{"id": "9728cc46-902a-4e17-b6a7-542ec2061c97", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "changeDue": 98000, "cogsTotal": 0, "createdAt": "2026-09-15T13:06:41.517Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00040", "cashReceived": 120000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "9fbf7323-4e0b-45ec-9d62-e2442cb0cc33", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:06:41.517061+00
176e87cc-50f6-46b0-80a6-e2bdb12fab84	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	ba1b48ef-a23f-4f3b-a4f8-0a185bdd45db	\N	{"id": "ba1b48ef-a23f-4f3b-a4f8-0a185bdd45db", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "changeDue": 78000, "cogsTotal": 0, "createdAt": "2026-09-15T13:12:40.246Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00041", "cashReceived": 100000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "b784edba-e367-4260-91c8-ed6d21788f3b", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:12:40.246484+00
d3e53b97-6d7d-4c13-85ad-c6d8414d3247	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-15 13:15:19.51734+00
3fd1816b-ba6c-45a8-8bee-f43daabdea78	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	bccfb472-d0a4-4ba8-908e-e3ce7de94f9b	\N	{"id": "bccfb472-d0a4-4ba8-908e-e3ce7de94f9b", "notes": null, "total": 76000, "status": "SUBMITTED", "subtotal": 76000, "taxTotal": 0, "changeDue": null, "cogsTotal": 0, "createdAt": "2026-09-15T13:31:40.252Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 76000, "orderNumber": "MTS-00042", "cashReceived": null, "refundReason": null, "discountTotal": 0, "idempotencyKey": "a2996e7b-9562-4d19-b2f2-64657f0a71e4", "cancellationReason": null, "paymentMethodLabel": "card (BRI)", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:31:40.252256+00
70b6bac2-4307-4860-9db3-114e389012de	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	3faec035-4966-45b7-bb44-2583f1f3672e	\N	{"id": "3faec035-4966-45b7-bb44-2583f1f3672e", "notes": null, "total": 27000, "status": "SUBMITTED", "subtotal": 27000, "taxTotal": 0, "changeDue": null, "cogsTotal": 0, "createdAt": "2026-09-15T13:32:18.356Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 27000, "orderNumber": "MTS-00043", "cashReceived": null, "refundReason": null, "discountTotal": 0, "idempotencyKey": "9e740e2e-7718-48be-b806-0fef6c6f3d33", "cancellationReason": null, "paymentMethodLabel": "card (BRI)", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:32:18.356971+00
5faa3022-b4e0-4376-93fb-4e816f09bb57	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	7cd3570b-7cda-4d11-bb8e-99cd5b0542e3	\N	{"id": "7cd3570b-7cda-4d11-bb8e-99cd5b0542e3", "notes": null, "total": 3000, "status": "SUBMITTED", "subtotal": 3000, "taxTotal": 0, "changeDue": null, "cogsTotal": 0, "createdAt": "2026-09-15T13:33:50.311Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 3000, "orderNumber": "MTS-00044", "cashReceived": null, "refundReason": null, "discountTotal": 0, "idempotencyKey": "5b9c8125-9c11-492c-a5fe-d0a913823725", "cancellationReason": null, "paymentMethodLabel": "card (BRI)", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:33:50.311754+00
cf61343e-ae8a-45b8-8015-f2fc8dce6473	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	559fa6ab-1764-4ff5-a375-9e0c20faef86	\N	{"id": "559fa6ab-1764-4ff5-a375-9e0c20faef86", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "changeDue": null, "cogsTotal": 0, "createdAt": "2026-09-15T13:37:20.749Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00045", "cashReceived": null, "refundReason": null, "discountTotal": 0, "idempotencyKey": "88e73128-9f40-4901-b4a2-3d37ba387a19", "cancellationReason": null, "paymentMethodLabel": "card (BRI)", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:37:20.74997+00
03158d32-9aea-49bb-bae6-3ed7b177ea6c	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	bab55c7a-45c4-4625-ad05-0101b0b14ce1	\N	{"id": "bab55c7a-45c4-4625-ad05-0101b0b14ce1", "notes": null, "total": 22000, "status": "SUBMITTED", "subtotal": 22000, "taxTotal": 0, "changeDue": null, "cogsTotal": 0, "createdAt": "2026-09-15T13:43:49.038Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 22000, "orderNumber": "MTS-00046", "cashReceived": null, "refundReason": null, "discountTotal": 0, "idempotencyKey": "d440210e-8709-4d22-916a-ea46d57c0b05", "cancellationReason": null, "paymentMethodLabel": "qris", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-15 13:43:49.038542+00
1535b8b9-f46d-473d-8563-bc0a926e88fa	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-09-16 07:55:26.096919+00
08a3cd07-29f8-454e-9f75-1a992556a84e	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	4d1064fd-7f62-4ea1-b50a-3c692d6e3211	\N	{"id": "4d1064fd-7f62-4ea1-b50a-3c692d6e3211", "sku": null, "name": "QA Sep16 Beans", "notes": "Staging verification only", "active": true, "baseUnit": "gram", "category": "QA TEST", "createdAt": "2026-09-16T07:59:47.523Z", "updatedAt": "2026-09-16T07:59:47.523Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": null, "reorderLevelBaseUnits": null, "averageCostPerBaseUnit": "100.000000", "currentQuantityBaseUnits": "0.0000"}	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-09-16 07:59:47.541817+00
69cb09ea-4baf-411a-ba97-66268fa587d1	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	0d8e3498-e1d8-4788-8a6a-ce73419e3957	\N	{"id": "0d8e3498-e1d8-4788-8a6a-ce73419e3957", "sku": null, "name": "QA Sep16 Milk", "notes": null, "active": true, "baseUnit": "millilitre", "category": "QA TEST", "createdAt": "2026-09-16T08:00:10.307Z", "updatedAt": "2026-09-16T08:00:10.307Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": null, "reorderLevelBaseUnits": null, "averageCostPerBaseUnit": "20.000000", "currentQuantityBaseUnits": "0.0000"}	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-09-16 08:00:10.31352+00
6350ffc3-b826-40df-b07f-4d92c5510353	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	c9584b98-d4c4-447e-8788-ec94605e4fbb	\N	{"id": "c9584b98-d4c4-447e-8788-ec94605e4fbb", "sku": null, "name": "QA Sep16 Cup", "notes": null, "active": true, "baseUnit": "piece", "category": "QA TEST", "createdAt": "2026-09-16T08:00:21.221Z", "updatedAt": "2026-09-16T08:00:21.221Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": null, "reorderLevelBaseUnits": null, "averageCostPerBaseUnit": "500.000000", "currentQuantityBaseUnits": "0.0000"}	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-09-16 08:00:21.225946+00
8d80d3eb-6e95-4822-ab06-9fae2024036d	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	inventory.manual_adjustment	inventory_movement	792baf60-728c-4cfb-9ac6-1118702b9693	\N	\N	{"notes": "", "reason": "QA Sep16 opening stock", "direction": "in", "ingredientId": "4d1064fd-7f62-4ea1-b50a-3c692d6e3211", "quantityBaseUnits": 1000}	\N	\N	2026-09-16 08:00:54.769734+00
0a10f0d3-0b3e-430a-aa10-659d95dd96e9	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	inventory.manual_adjustment	inventory_movement	15eaefd8-444e-4022-86f1-f5b25ce03b22	\N	\N	{"notes": "", "reason": "QA Sep16 opening stock", "direction": "in", "ingredientId": "0d8e3498-e1d8-4788-8a6a-ce73419e3957", "quantityBaseUnits": 2000}	\N	\N	2026-09-16 08:01:08.770914+00
78d45ad2-2959-43f1-8342-3f3e3979ed0b	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item.created	menu_item	eba7ed0e-5990-4679-9eb9-27fb620f873d	\N	{"id": "eba7ed0e-5990-4679-9eb9-27fb620f873d", "name": "QA Sep16 Latte", "active": true, "imageUrl": null, "basePrice": 30000, "createdAt": "2026-09-16T08:01:47.219Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "updatedAt": "2026-09-16T08:01:47.219Z", "updatedBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "archivedAt": null, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "categoryId": null, "description": null, "taxBehavior": "exclusive", "displayOrder": 0, "tracksInventory": true}	\N	\N	\N	2026-09-16 08:01:47.219803+00
8dd5d056-53e2-48da-b6fa-2f30e8352740	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.created	menu_item_variant	6f5aff82-4fab-4e61-a1dd-b526223b611e	\N	{"id": "6f5aff82-4fab-4e61-a1dd-b526223b611e", "name": "Regular", "price": 30000, "active": true, "createdAt": "2026-09-16T08:01:47.219Z", "updatedAt": "2026-09-16T08:01:47.219Z", "menuItemId": "eba7ed0e-5990-4679-9eb9-27fb620f873d", "displayOrder": 0}	{"menuItemId": "eba7ed0e-5990-4679-9eb9-27fb620f873d", "autoCreated": true}	\N	\N	2026-09-16 08:01:47.219803+00
1cc5583b-a04a-4ed1-81f5-47386318dbad	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	bdfb14dc-319f-4f36-985a-28ccc97d49a4	\N	\N	{"version": 1, "menuItemVariantId": "6f5aff82-4fab-4e61-a1dd-b526223b611e"}	\N	\N	2026-09-16 08:02:52.909633+00
819676e5-0778-43f7-b959-ba7d51309af4	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	ff7085f8-ae37-4aa3-8dce-f32d7444660e	\N	{"id": "ff7085f8-ae37-4aa3-8dce-f32d7444660e", "notes": null, "total": 90000, "status": "SUBMITTED", "subtotal": 90000, "taxTotal": 0, "changeDue": 10000, "cogsTotal": 16605, "createdAt": "2026-09-16T08:03:44.464Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": "QA Sep16 stock verification", "cancelledAt": null, "cancelledBy": null, "grossProfit": 73395, "orderNumber": "MTS-00047", "cashReceived": 100000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "7191877c-da80-492f-be3d-a9d4e6b3fd14", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "81.55"}	\N	\N	\N	2026-09-16 08:03:44.464032+00
84845692-a74c-4571-9d1c-4f896258da9b	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	purchase.finalized	purchase	05343b66-8919-46c5-967e-23f695f5fbb5	\N	{"id": "05343b66-8919-46c5-967e-23f695f5fbb5", "status": "FINALIZED", "createdAt": "2026-09-16T11:34:24.844Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "totalCost": 5000, "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "supplierId": null, "finalizedAt": "2026-09-16T11:34:24.927Z", "purchaseDate": "2026-09-16", "invoiceNumber": null, "reversedByPurchaseId": null}	\N	\N	\N	2026-09-16 11:34:24.919681+00
1f787bc2-74a5-42cc-a342-bc6972f49e0f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	73f9fddb-97ea-462f-95f8-2f23ecebee30	\N	{"id": "73f9fddb-97ea-462f-95f8-2f23ecebee30", "notes": null, "total": 64000, "status": "SUBMITTED", "subtotal": 64000, "taxTotal": 0, "changeDue": 36000, "cogsTotal": 4799, "createdAt": "2026-09-16T11:34:58.138Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 59201, "orderNumber": "MTS-00048", "cashReceived": 100000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "81ee7702-0e91-4fc0-8ba4-f56d05bb8899", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "92.50"}	\N	\N	\N	2026-09-16 11:34:58.138822+00
c1c7672e-d3eb-4a14-8a1f-0f0109d1abdb	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-16 11:35:02.176439+00
495e7291-687e-41c5-9d9d-25bc008f7e75	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-16 11:35:03.704543+00
4c8d41b9-bac4-4a99-95c4-3ef5147b651b	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	900cfeab-c221-456e-96f8-5a014f51926a	\N	\N	{"version": 2, "menuItemVariantId": "6f5aff82-4fab-4e61-a1dd-b526223b611e"}	\N	\N	2026-09-16 11:54:49.435316+00
49688259-9ddf-4f50-b00f-893a97f07a7e	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.cancelled	order	ff7085f8-ae37-4aa3-8dce-f32d7444660e	{"id": "ff7085f8-ae37-4aa3-8dce-f32d7444660e", "notes": null, "total": 90000, "status": "SUBMITTED", "subtotal": 90000, "taxTotal": 0, "changeDue": 10000, "cogsTotal": 16605, "createdAt": "2026-09-16T08:03:44.464Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": "QA Sep16 stock verification", "cancelledAt": null, "cancelledBy": null, "grossProfit": 73395, "orderNumber": "MTS-00047", "cashReceived": 100000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "7191877c-da80-492f-be3d-a9d4e6b3fd14", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "81.55"}	{"id": "ff7085f8-ae37-4aa3-8dce-f32d7444660e", "notes": null, "total": 90000, "status": "CANCELLED", "subtotal": 90000, "taxTotal": 0, "changeDue": 10000, "cogsTotal": 16605, "createdAt": "2026-09-16T08:03:44.464Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "takeaway", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": "QA Sep16 stock verification", "cancelledAt": "2026-09-16T11:55:29.820Z", "cancelledBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "grossProfit": 73395, "orderNumber": "MTS-00047", "cashReceived": 100000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "7191877c-da80-492f-be3d-a9d4e6b3fd14", "cancellationReason": "QA Sep16 verify original stock reversal after recipe change", "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "81.55"}	{"reason": "QA Sep16 verify original stock reversal after recipe change"}	\N	\N	2026-09-16 11:55:29.797823+00
2e80f836-d85d-4560-9848-800554961901	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	order.submitted	order	05ca4c83-0e32-4190-af14-a1f044e9f78b	\N	{"id": "05ca4c83-0e32-4190-af14-a1f044e9f78b", "notes": null, "total": 55000, "status": "SUBMITTED", "subtotal": 60000, "taxTotal": 0, "changeDue": 45000, "cogsTotal": 11400, "createdAt": "2026-09-16T11:59:18.512Z", "createdBy": "b087e36c-b8af-40dc-a541-b9a90de7db6e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": "QA Sep16 revised recipe and discount", "cancelledAt": null, "cancelledBy": null, "grossProfit": 43600, "orderNumber": "MTS-00049", "cashReceived": 100000, "refundReason": null, "discountTotal": 5000, "idempotencyKey": "f89e509b-d7ca-42e5-84f4-6f7afde6021e", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "79.27"}	\N	\N	\N	2026-09-16 11:59:18.512855+00
4fef959b-cfd3-4103-b6ae-5b3288134a3c	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	menu_item_variant.created	menu_item_variant	9344cf78-4f10-4bee-8f41-5f5b3b211116	\N	{"id": "9344cf78-4f10-4bee-8f41-5f5b3b211116", "name": "QA Large", "price": 40000, "active": true, "createdAt": "2026-09-16T12:02:33.550Z", "updatedAt": "2026-09-16T12:02:33.550Z", "menuItemId": "eba7ed0e-5990-4679-9eb9-27fb620f873d", "displayOrder": 0}	{"menuItemId": "eba7ed0e-5990-4679-9eb9-27fb620f873d"}	\N	\N	2026-09-16 12:02:33.550055+00
4cad1021-8709-4acb-98f3-b83af7eaa576	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	recipe.saved	recipe	5c186d6d-1469-4369-a66d-217c9ad55663	\N	\N	{"version": 1, "menuItemVariantId": "9344cf78-4f10-4bee-8f41-5f5b3b211116"}	\N	\N	2026-09-16 12:02:33.550055+00
bac25100-96bb-4552-87a7-c36c81deb8ed	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-16 12:19:12.020803+00
a08c3dd8-c002-4f08-b160-65863106e3da	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-16 12:19:13.633432+00
f89ca888-3b8b-4053-a763-6652ccf0aab3	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	ingredient.created	ingredient	48972053-ddea-4013-ba8b-dead6db49581	\N	{"id": "48972053-ddea-4013-ba8b-dead6db49581", "sku": null, "name": "Chicken Meat", "notes": null, "active": true, "baseUnit": "gram", "category": null, "createdAt": "2026-09-16T12:22:00.032Z", "updatedAt": "2026-09-16T12:22:00.032Z", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "preferredSupplierId": null, "targetStockBaseUnits": "5000.0000", "reorderLevelBaseUnits": "500.0000", "averageCostPerBaseUnit": "1000.000000", "currentQuantityBaseUnits": "0.0000"}	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-16 12:22:00.046524+00
1a24c088-b7c9-4bae-85ce-abff6b716565	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	stock_count.submitted	stock_count	b895ae63-dd26-47b3-80b3-6dfde8b01dc2	\N	\N	{"lines": [{"ingredientId": "48972053-ddea-4013-ba8b-dead6db49581", "countedQuantity": 1000}]}	\N	\N	2026-09-16 12:23:39.133473+00
50318f32-1147-4b98-ab16-87628bb1c9a4	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	inventory.manual_adjustment	inventory_movement	cf76340b-e316-4057-a999-fa041386e8c5	\N	\N	{"notes": "", "reason": "correcting count error", "direction": "in", "ingredientId": "48972053-ddea-4013-ba8b-dead6db49581", "quantityBaseUnits": 2000}	\N	\N	2026-09-16 12:23:58.074362+00
95a61b11-ebd9-44f5-bdce-3fb4c0899b61	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 06:54:03.580604+00
ec44d278-8b3f-4f0a-b584-38e9352e96a7	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 06:54:37.467912+00
20946d1f-b757-4c08-bee6-9987d4f965ee	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	login	user	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	\N	\N	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.6.1 Mobile/15E148 Safari/604.1	2026-09-17 06:55:51.806867+00
7b7eabcf-4b9a-464c-84da-41037cb88b29	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	order.submitted	order	fd9345c4-510f-421a-b918-479661d443f1	\N	{"id": "fd9345c4-510f-421a-b918-479661d443f1", "notes": null, "total": 82000, "status": "SUBMITTED", "subtotal": 82000, "taxTotal": 0, "changeDue": null, "cogsTotal": 31074, "createdAt": "2026-09-17T06:55:58.021Z", "createdBy": "03243253-f0de-4700-ad92-3c70bd16de8d", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 50926, "orderNumber": "MTS-00050", "cashReceived": null, "refundReason": null, "discountTotal": 0, "idempotencyKey": "a7d4b672-5ea3-45d6-a9fe-6cb247cb32ee", "cancellationReason": null, "paymentMethodLabel": "card (BCA)", "serviceChargeTotal": 0, "grossMarginPercentage": "62.10"}	\N	\N	\N	2026-09-17 06:55:58.021342+00
2612879f-53ae-4959-a819-fc12efcba47a	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	logout	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 06:58:55.991325+00
46a7e45f-1978-48ac-bdee-4b799ce77925	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 06:59:17.113336+00
cdf9edfe-8702-4387-9522-9de2a5cbe173	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 07:00:35.401098+00
0eb174a1-b7fa-47d4-95c9-f3d59b0e755f	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 07:00:45.777614+00
a2360244-f7fe-44e0-b780-d1db7684c951	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	logout	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 07:02:34.433082+00
6799d1bc-67e1-4b2d-931a-29901c3aaa14	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 07:02:42.998364+00
a96d8432-1aee-4729-abb9-08d4635e437a	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 07:09:37.246783+00
c2647528-636c-43f4-9b9f-b51d70c8c738	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	login	user	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 07:09:51.003848+00
a40b490b-4e8f-43eb-afdc-5282b292d242	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	order.submitted	order	62f3b819-4b89-4cb3-ac49-75a258e92bf5	\N	{"id": "62f3b819-4b89-4cb3-ac49-75a258e92bf5", "notes": null, "total": 8000, "status": "SUBMITTED", "subtotal": 8000, "taxTotal": 0, "changeDue": 0, "cogsTotal": 0, "createdAt": "2026-09-17T08:37:08.908Z", "createdBy": "7ed187bd-6f44-47ca-9ab7-d787ea6fd35e", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 8000, "orderNumber": "MTS-00051", "cashReceived": 8000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "96256a77-3e77-4afd-8a1d-1b1a3f804637", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-17 08:37:08.908192+00
4471c8dd-b6cc-4dcf-a076-69c996b536bd	99a43f10-309d-40d0-b266-57f43b9b070a	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	logout	user	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 13:51:22.173748+00
d6a79755-fcc4-4e3b-8271-3a5688d6e4c9	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 13:51:30.123898+00
c278da79-0012-42d2-aede-ccd27848f29d	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	logout	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 13:51:57.149086+00
0d2a1311-728a-4633-a3fe-bff9b3900eae	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	login	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	2026-09-17 13:52:18.005208+00
cac11e85-d521-41df-8de8-0908acb4415f	99a43f10-309d-40d0-b266-57f43b9b070a	b087e36c-b8af-40dc-a541-b9a90de7db6e	logout	user	b087e36c-b8af-40dc-a541-b9a90de7db6e	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-17 13:57:32.308702+00
0dd4bb06-ad3b-466a-9a41-0672305ad8a1	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	login	user	03243253-f0de-4700-ad92-3c70bd16de8d	\N	\N	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	2026-09-18 02:57:18.656648+00
4c707baa-ba51-4dce-a521-0d9f60cd7c59	99a43f10-309d-40d0-b266-57f43b9b070a	03243253-f0de-4700-ad92-3c70bd16de8d	order.submitted	order	05435bdc-b661-42c4-bd90-ce83b9d5e6d7	\N	{"id": "05435bdc-b661-42c4-bd90-ce83b9d5e6d7", "notes": null, "total": 3000, "status": "SUBMITTED", "subtotal": 3000, "taxTotal": 0, "changeDue": 0, "cogsTotal": 0, "createdAt": "2026-09-18T02:59:40.628Z", "createdBy": "03243253-f0de-4700-ad92-3c70bd16de8d", "orderType": "dine_in", "businessId": "99a43f10-309d-40d0-b266-57f43b9b070a", "locationId": null, "refundedAt": null, "refundedBy": null, "tableLabel": null, "cancelledAt": null, "cancelledBy": null, "grossProfit": 3000, "orderNumber": "MTS-00052", "cashReceived": 3000, "refundReason": null, "discountTotal": 0, "idempotencyKey": "066de35d-bbe7-43a3-898c-453b6eb7bdfa", "cancellationReason": null, "paymentMethodLabel": "cash", "serviceChargeTotal": 0, "grossMarginPercentage": "100.00"}	\N	\N	\N	2026-09-18 02:59:40.628304+00
\.


--
-- Data for Name: businesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.businesses (id, name, legal_name, logo_url, address, phone, currency, timezone, tax_config, receipt_footer, order_number_prefix, default_printer_id, service_charge_percent, allow_negative_stock, created_at, updated_at) FROM stdin;
99a43f10-309d-40d0-b266-57f43b9b070a	Matsudon	\N	\N	\N	\N	IDR	Asia/Jakarta	\N	\N	MTS	\N	\N	f	2026-09-13 06:24:09.822629+00	2026-09-13 06:24:09.822629+00
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expenses (id, business_id, location_id, category, amount, expense_date, payee, reference_number, notes, attachment_url, recurring, created_by, created_at, updated_at) FROM stdin;
1987b168-a7c6-4fe4-a346-1272b6c0a6a3	99a43f10-309d-40d0-b266-57f43b9b070a	\N	electricity	1000000	2026-09-13	pln	Monthly	\N	\N	f	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:58:55.654907+00	2026-09-13 10:00:46.791+00
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ingredients (id, business_id, name, sku, category, base_unit, current_quantity_base_units, reorder_level_base_units, target_stock_base_units, average_cost_per_base_unit, preferred_supplier_id, active, notes, created_at, updated_at, display_unit) FROM stdin;
c599b162-7f54-49b0-98db-a4672b3d1d9a	99a43f10-309d-40d0-b266-57f43b9b070a	Mie goreng	\N	food	piece	0.0000	20.0000	40.0000	1.000000	\N	t	\N	2026-09-13 09:31:52.547361+00	2026-09-13 09:32:25.801+00	\N
cc1289d4-d3bc-47f1-a111-5b2764f40142	99a43f10-309d-40d0-b266-57f43b9b070a	java a	\N	Drink	piece	0.0000	1.0000	1.0000	1.000000	\N	t	\N	2026-09-13 10:51:21.508116+00	2026-09-13 10:51:21.508116+00	\N
91f12ef6-dab9-4370-843f-71024607e1e2	99a43f10-309d-40d0-b266-57f43b9b070a	cabe	\N	food	gram	1010.0000	1.0000	9.0000	5.474827	\N	t	\N	2026-09-13 09:38:44.82567+00	2026-09-16 11:34:58.138822+00	\N
de449976-7785-4384-b858-834d42348ef4	99a43f10-309d-40d0-b266-57f43b9b070a	telur	\N	food	piece	0.0000	30.0000	60.0000	1833.333333	\N	t	\N	2026-09-13 09:40:05.348021+00	2026-09-16 11:34:58.138822+00	\N
3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	99a43f10-309d-40d0-b266-57f43b9b070a	Mie goreng original	\N	food	piece	9.0000	20.0000	40.0000	2950.000000	\N	t	\N	2026-09-13 09:34:40.365083+00	2026-09-16 11:34:58.138822+00	\N
4d1064fd-7f62-4ea1-b50a-3c692d6e3211	99a43f10-309d-40d0-b266-57f43b9b070a	QA Sep16 Beans	\N	QA TEST	gram	956.0000	\N	\N	100.000000	\N	t	Staging verification only	2026-09-16 07:59:47.523864+00	2026-09-16 11:59:18.512855+00	\N
0d8e3498-e1d8-4788-8a6a-ce73419e3957	99a43f10-309d-40d0-b266-57f43b9b070a	QA Sep16 Milk	\N	QA TEST	millilitre	1700.0000	\N	\N	20.000000	\N	t	\N	2026-09-16 08:00:10.307495+00	2026-09-16 11:59:18.512855+00	\N
c9584b98-d4c4-447e-8788-ec94605e4fbb	99a43f10-309d-40d0-b266-57f43b9b070a	QA Sep16 Cup	\N	QA TEST	piece	18.0000	\N	\N	500.000000	\N	t	\N	2026-09-16 08:00:21.22147+00	2026-09-16 11:59:18.512855+00	\N
48972053-ddea-4013-ba8b-dead6db49581	99a43f10-309d-40d0-b266-57f43b9b070a	Chicken Meat	\N	\N	gram	3000.0000	500.0000	5000.0000	1000.000000	\N	t	\N	2026-09-16 12:22:00.032258+00	2026-09-16 12:23:58.099+00	\N
f231724a-06a2-4499-a4c2-96bee6927b36	99a43f10-309d-40d0-b266-57f43b9b070a	Cup R	\N	drink	piece	993.5000	500.0000	2000.0000	1360.000000	\N	t	\N	2026-09-14 06:50:39.573295+00	2026-09-17 06:55:58.021342+00	\N
b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	99a43f10-309d-40d0-b266-57f43b9b070a	Simple syrup	\N	drink	gram	9805.0000	4935.0000	9870.0000	18.439716	\N	t	\N	2026-09-14 07:02:22.355108+00	2026-09-17 06:55:58.021342+00	\N
977c2dd1-1691-4f49-8599-64ea9e3846f1	99a43f10-309d-40d0-b266-57f43b9b070a	Creamer	\N	drink	gram	19740.0000	10000.0000	20000.0000	80.000000	\N	t	\N	2026-09-14 07:03:31.870929+00	2026-09-17 06:55:58.021342+00	\N
6d14fad6-3ee7-4265-9a56-180d4c58c148	99a43f10-309d-40d0-b266-57f43b9b070a	Fresh Milk	\N	drink	millilitre	47350.0000	12000.0000	24000.0000	20.000000	\N	t	\N	2026-09-14 07:04:44.213423+00	2026-09-17 06:55:58.021342+00	\N
d906603a-b681-49de-883d-4c8e445d7110	99a43f10-309d-40d0-b266-57f43b9b070a	Ice cube	\N	drink	gram	12000.0000	1000.0000	15000.0000	6.000000	\N	t	\N	2026-09-14 07:21:48.453542+00	2026-09-17 06:55:58.021342+00	\N
6fe11bee-8b53-4103-9bd0-e2fa53a6408a	99a43f10-309d-40d0-b266-57f43b9b070a	Matcha	\N	drink	gram	2902.5000	1000.0000	3000.0000	214.000000	\N	t	\N	2026-09-14 07:06:12.597068+00	2026-09-17 06:55:58.021342+00	\N
d8a13950-dee9-4fdd-a339-1e21e366f496	99a43f10-309d-40d0-b266-57f43b9b070a	Cup L	\N	drink	piece	998.7000	500.0000	1000.0000	1400.000000	\N	t	\N	2026-09-14 07:19:08.840693+00	2026-09-17 06:55:58.021342+00	\N
\.


--
-- Data for Name: inventory_movements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inventory_movements (id, business_id, location_id, ingredient_id, movement_type, quantity_base_units, unit_cost, total_cost, source_type, source_id, related_movement_id, reason, notes, created_by, created_at, ingredient_name_snapshot, ingredient_base_unit_snapshot) FROM stdin;
0116e653-3e06-4a6d-a8cf-696f406570f2	99a43f10-309d-40d0-b266-57f43b9b070a	\N	91f12ef6-dab9-4370-843f-71024607e1e2	SALE_CONSUMPTION	-6.0000	42.000000	252	order	ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:06:49.438107+00	cabe	gram
27ad0fdc-983c-4282-ad5d-3bd6c18cdf8f	99a43f10-309d-40d0-b266-57f43b9b070a	\N	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	SALE_CONSUMPTION	-2.0000	2950.000000	5900	order	ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:06:49.438107+00	Mie goreng original	piece
40be20c4-ed21-4d73-a588-c686c41a98e7	99a43f10-309d-40d0-b266-57f43b9b070a	\N	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	PURCHASE_RECEIPT	40.0000	2950.000000	118000	purchase	b80378ae-eb70-4a2a-a9e3-8ef2b7391129	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:50:28.54154+00	Mie goreng original	piece
f1a1dfd1-8927-4d3e-8055-d6218d013e5a	99a43f10-309d-40d0-b266-57f43b9b070a	\N	de449976-7785-4384-b858-834d42348ef4	PURCHASE_RECEIPT	30.0000	1833.333333	55000	purchase	b80378ae-eb70-4a2a-a9e3-8ef2b7391129	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:50:28.54154+00	telur	piece
fc0c7031-9386-4b5e-bbb5-2bc3e23e5a11	99a43f10-309d-40d0-b266-57f43b9b070a	\N	91f12ef6-dab9-4370-843f-71024607e1e2	PURCHASE_RECEIPT	100.0000	42.000000	4200	purchase	b80378ae-eb70-4a2a-a9e3-8ef2b7391129	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:50:28.54154+00	cabe	gram
50549eea-6df0-49ec-b478-b55017707226	99a43f10-309d-40d0-b266-57f43b9b070a	\N	91f12ef6-dab9-4370-843f-71024607e1e2	SALE_CONSUMPTION	-3.0000	42.000000	126	order	2e78449e-6865-4e98-b1b6-e076fd161fc0	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:53:35.216743+00	cabe	gram
41103bde-5ff9-4f73-b1d0-f2b3c740c5e5	99a43f10-309d-40d0-b266-57f43b9b070a	\N	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	SALE_CONSUMPTION	-1.0000	2950.000000	2950	order	2e78449e-6865-4e98-b1b6-e076fd161fc0	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:53:35.216743+00	Mie goreng original	piece
a964e460-da66-40e4-a969-88faf2e19761	99a43f10-309d-40d0-b266-57f43b9b070a	\N	de449976-7785-4384-b858-834d42348ef4	SALE_CONSUMPTION	-1.0000	1833.333333	1833	order	2e78449e-6865-4e98-b1b6-e076fd161fc0	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:53:35.216743+00	telur	piece
de02b378-857a-4a5e-a392-6d6033c15169	99a43f10-309d-40d0-b266-57f43b9b070a	\N	91f12ef6-dab9-4370-843f-71024607e1e2	SALE_CONSUMPTION	-30.0000	42.000000	1260	order	637f5df3-697a-4644-b827-e3fa8f43fc30	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:54:25.617942+00	cabe	gram
9b4b4de9-9516-4d1f-8ff3-2130a0da0711	99a43f10-309d-40d0-b266-57f43b9b070a	\N	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	SALE_CONSUMPTION	-10.0000	2950.000000	29500	order	637f5df3-697a-4644-b827-e3fa8f43fc30	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:54:25.617942+00	Mie goreng original	piece
9eedc931-5426-4e7d-8bf7-1e6241103244	99a43f10-309d-40d0-b266-57f43b9b070a	\N	de449976-7785-4384-b858-834d42348ef4	SALE_CONSUMPTION	-10.0000	1833.333333	18333	order	637f5df3-697a-4644-b827-e3fa8f43fc30	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:54:25.617942+00	telur	piece
9a260fe8-2ad0-409a-9051-dbb7f20230c8	99a43f10-309d-40d0-b266-57f43b9b070a	\N	91f12ef6-dab9-4370-843f-71024607e1e2	SALE_CONSUMPTION	-45.0000	42.000000	1890	order	7c124622-584b-4778-8693-4a29a0f913f6	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:55:43.121495+00	cabe	gram
b861a8de-58a7-45a3-9072-a507f7f325d7	99a43f10-309d-40d0-b266-57f43b9b070a	\N	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	SALE_CONSUMPTION	-15.0000	2950.000000	44250	order	7c124622-584b-4778-8693-4a29a0f913f6	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:55:43.121495+00	Mie goreng original	piece
6625c083-601b-4e79-905b-25f1448e712d	99a43f10-309d-40d0-b266-57f43b9b070a	\N	de449976-7785-4384-b858-834d42348ef4	SALE_CONSUMPTION	-15.0000	1833.333333	27500	order	7c124622-584b-4778-8693-4a29a0f913f6	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:55:43.121495+00	telur	piece
39c71370-676c-40f1-a521-ba8064f06312	99a43f10-309d-40d0-b266-57f43b9b070a	\N	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	WASTE	-1.0000	2950.000000	2950	waste_record	\N	\N	damaged		b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 10:26:04.082964+00	Mie goreng original	piece
a8e8dac9-0d45-495f-8c4a-6c5599249f08	99a43f10-309d-40d0-b266-57f43b9b070a	\N	f231724a-06a2-4499-a4c2-96bee6927b36	PURCHASE_RECEIPT	1000.0000	1360.000000	1360000	purchase	0a41e275-7b29-4b03-8036-f71c1f960e4a	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:15:10.64484+00	Cup	piece
5f5d9f53-a735-4baa-8fe9-bffc6f8d4c9b	99a43f10-309d-40d0-b266-57f43b9b070a	\N	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	PURCHASE_RECEIPT	9870.0000	18.439716	182000	purchase	0a41e275-7b29-4b03-8036-f71c1f960e4a	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:15:10.64484+00	Simple syrup	gram
f534a675-f614-4e07-b8f9-77d5478eff90	99a43f10-309d-40d0-b266-57f43b9b070a	\N	977c2dd1-1691-4f49-8599-64ea9e3846f1	PURCHASE_RECEIPT	20000.0000	80.000000	1600000	purchase	0a41e275-7b29-4b03-8036-f71c1f960e4a	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:15:10.64484+00	Creamer	gram
9b36789d-0b9a-4632-86eb-98593a0268d4	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6d14fad6-3ee7-4265-9a56-180d4c58c148	PURCHASE_RECEIPT	48000.0000	20.000000	960000	purchase	0a41e275-7b29-4b03-8036-f71c1f960e4a	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:15:10.64484+00	Fresh Milk	millilitre
6888e1ff-dc6b-4388-ad90-921613dc623b	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	PURCHASE_RECEIPT	3000.0000	214.000000	642000	purchase	0a41e275-7b29-4b03-8036-f71c1f960e4a	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:15:10.64484+00	Matcha	gram
aa85b566-dd94-4a8c-9052-d492dbcc0cfe	99a43f10-309d-40d0-b266-57f43b9b070a	\N	d8a13950-dee9-4fdd-a339-1e21e366f496	PURCHASE_RECEIPT	1000.0000	1400.000000	1400000	purchase	8e934f80-c18a-4e13-8fab-3f5acc28d8fd	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:19:44.13676+00	Cup L	piece
87a91ed2-8a32-4efc-85bc-d5787657f39c	99a43f10-309d-40d0-b266-57f43b9b070a	\N	\N	MANUAL_ADJUSTMENT_IN	1000.0000	\N	\N	manual_adjustment	\N	\N	Beli di VIVI		b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:04:14.901252+00	Es batu	gram
8bf6d1d0-f7ed-4935-ba84-b9c50e40c1f6	99a43f10-309d-40d0-b266-57f43b9b070a	\N	\N	PURCHASE_RECEIPT	15000.0000	6.000000	90000	purchase	885233d4-3b92-469b-b261-d2345496ac74	\N	\N	\N	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	2026-09-13 09:15:51.392296+00	Es batu	gram
f5743f01-5226-4c42-9024-c5d6ef4a2e36	99a43f10-309d-40d0-b266-57f43b9b070a	\N	d906603a-b681-49de-883d-4c8e445d7110	PURCHASE_RECEIPT	15000.0000	6.000000	90000	purchase	735514c5-5e34-4c3a-b4b6-b997888e9ee0	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:37:05.018951+00	Ice cube	gram
ac2b733b-7ea8-43cc-af14-323340152fad	99a43f10-309d-40d0-b266-57f43b9b070a	\N	f231724a-06a2-4499-a4c2-96bee6927b36	SALE_CONSUMPTION	-1.3000	1360.000000	1768	order	a065bff2-7977-4498-97c3-ee7304332a5c	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:31:06.019554+00	Cup R	piece
f486a23a-f941-4423-8fb6-203dfdbcc0df	99a43f10-309d-40d0-b266-57f43b9b070a	\N	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	SALE_CONSUMPTION	-10.0000	18.439716	184	order	a065bff2-7977-4498-97c3-ee7304332a5c	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:31:06.019554+00	Simple syrup	gram
9d103ce4-c8da-4444-9d28-58fcb28570ed	99a43f10-309d-40d0-b266-57f43b9b070a	\N	977c2dd1-1691-4f49-8599-64ea9e3846f1	SALE_CONSUMPTION	-40.0000	80.000000	3200	order	a065bff2-7977-4498-97c3-ee7304332a5c	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:31:06.019554+00	Creamer	gram
1cb46510-a0da-4c3b-8b15-a0c8939297e8	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6d14fad6-3ee7-4265-9a56-180d4c58c148	SALE_CONSUMPTION	-100.0000	20.000000	2000	order	a065bff2-7977-4498-97c3-ee7304332a5c	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:31:06.019554+00	Fresh Milk	millilitre
97bb7f1d-3c6e-4730-a991-d358b0a50ca3	99a43f10-309d-40d0-b266-57f43b9b070a	\N	d906603a-b681-49de-883d-4c8e445d7110	SALE_CONSUMPTION	-500.0000	6.000000	3000	order	a065bff2-7977-4498-97c3-ee7304332a5c	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:31:06.019554+00	Ice cube	gram
971cc785-cdc6-4b96-85d1-54a0bec7c5ae	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	SALE_CONSUMPTION	-15.0000	214.000000	3210	order	a065bff2-7977-4498-97c3-ee7304332a5c	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:31:06.019554+00	Matcha	gram
81d542f2-58ab-4c4d-8934-ac196fc306ea	99a43f10-309d-40d0-b266-57f43b9b070a	\N	de449976-7785-4384-b858-834d42348ef4	SALE_CONSUMPTION	-2.0000	1833.333333	3667	order	ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:06:49.438107+00	telur	piece
4fc7ef9c-dc31-4563-a17f-2c6798b9d5b5	99a43f10-309d-40d0-b266-57f43b9b070a	\N	91f12ef6-dab9-4370-843f-71024607e1e2	SALE_CONSUMPTION	-3.0000	42.000000	126	order	7d49481b-fc34-4fcf-a36d-6bb9332324c6	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:24.431038+00	cabe	gram
595baf0d-fa2d-4cc2-97a0-32bb251dce20	99a43f10-309d-40d0-b266-57f43b9b070a	\N	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	SALE_CONSUMPTION	-1.0000	2950.000000	2950	order	7d49481b-fc34-4fcf-a36d-6bb9332324c6	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:24.431038+00	Mie goreng original	piece
e3ee89c0-01a9-46d0-93e4-a7d230ee042e	99a43f10-309d-40d0-b266-57f43b9b070a	\N	de449976-7785-4384-b858-834d42348ef4	SALE_CONSUMPTION	-1.0000	1833.333333	1833	order	7d49481b-fc34-4fcf-a36d-6bb9332324c6	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:24.431038+00	telur	piece
d7a5e825-7d20-4ebd-a006-3944aebd2353	99a43f10-309d-40d0-b266-57f43b9b070a	\N	f231724a-06a2-4499-a4c2-96bee6927b36	SALE_CONSUMPTION	-1.3000	1360.000000	1768	order	746de8b3-e688-489e-a15e-c042994d9bbd	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:37.502369+00	Cup R	piece
ef70c425-9dec-4c42-85fb-185223357050	99a43f10-309d-40d0-b266-57f43b9b070a	\N	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	SALE_CONSUMPTION	-10.0000	18.439716	184	order	746de8b3-e688-489e-a15e-c042994d9bbd	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:37.502369+00	Simple syrup	gram
5103f573-137d-44f4-9c49-3a5bfd7423b2	99a43f10-309d-40d0-b266-57f43b9b070a	\N	977c2dd1-1691-4f49-8599-64ea9e3846f1	SALE_CONSUMPTION	-40.0000	80.000000	3200	order	746de8b3-e688-489e-a15e-c042994d9bbd	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:37.502369+00	Creamer	gram
8109862d-240f-4f54-96c3-2d8130c55d61	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6d14fad6-3ee7-4265-9a56-180d4c58c148	SALE_CONSUMPTION	-100.0000	20.000000	2000	order	746de8b3-e688-489e-a15e-c042994d9bbd	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:37.502369+00	Fresh Milk	millilitre
c0577ced-a9ef-4600-8d3a-1a425c0045cb	99a43f10-309d-40d0-b266-57f43b9b070a	\N	d906603a-b681-49de-883d-4c8e445d7110	SALE_CONSUMPTION	-500.0000	6.000000	3000	order	746de8b3-e688-489e-a15e-c042994d9bbd	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:37.502369+00	Ice cube	gram
04be44b8-8418-4452-8cf5-ebebfca07346	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	SALE_CONSUMPTION	-15.0000	214.000000	3210	order	746de8b3-e688-489e-a15e-c042994d9bbd	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:37.502369+00	Matcha	gram
067f0358-5f99-4bb0-adb5-f30e53199f60	99a43f10-309d-40d0-b266-57f43b9b070a	\N	f231724a-06a2-4499-a4c2-96bee6927b36	SALE_CONSUMPTION	-1.3000	1360.000000	1768	order	d4d3b654-b55c-48fe-9c39-24840dafdfa4	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:46:54.066326+00	Cup R	piece
881a8c35-b296-4ac2-85de-0df5b5748491	99a43f10-309d-40d0-b266-57f43b9b070a	\N	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	SALE_CONSUMPTION	-10.0000	18.439716	184	order	d4d3b654-b55c-48fe-9c39-24840dafdfa4	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:46:54.066326+00	Simple syrup	gram
166050d4-3002-4ba0-918a-dd5ffbfb2def	99a43f10-309d-40d0-b266-57f43b9b070a	\N	977c2dd1-1691-4f49-8599-64ea9e3846f1	SALE_CONSUMPTION	-40.0000	80.000000	3200	order	d4d3b654-b55c-48fe-9c39-24840dafdfa4	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:46:54.066326+00	Creamer	gram
5b42d617-b280-4307-a092-dfebe15c71c0	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6d14fad6-3ee7-4265-9a56-180d4c58c148	SALE_CONSUMPTION	-100.0000	20.000000	2000	order	d4d3b654-b55c-48fe-9c39-24840dafdfa4	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:46:54.066326+00	Fresh Milk	millilitre
944e40c9-8ec7-47f3-91c3-1da7544d3fbf	99a43f10-309d-40d0-b266-57f43b9b070a	\N	d906603a-b681-49de-883d-4c8e445d7110	SALE_CONSUMPTION	-500.0000	6.000000	3000	order	d4d3b654-b55c-48fe-9c39-24840dafdfa4	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:46:54.066326+00	Ice cube	gram
af066601-493a-461b-aa5e-5039089c780a	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	SALE_CONSUMPTION	-15.0000	214.000000	3210	order	d4d3b654-b55c-48fe-9c39-24840dafdfa4	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:46:54.066326+00	Matcha	gram
a302fb46-7025-4904-9377-43e7b624a14e	99a43f10-309d-40d0-b266-57f43b9b070a	\N	f231724a-06a2-4499-a4c2-96bee6927b36	SALE_CONSUMPTION	-1.3000	1360.000000	1768	order	f406ffea-b4a8-487e-8efd-a5e910376819	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:14:54.06537+00	Cup R	piece
35096916-2b77-40d2-b936-e41a7a95968e	99a43f10-309d-40d0-b266-57f43b9b070a	\N	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	SALE_CONSUMPTION	-10.0000	18.439716	184	order	f406ffea-b4a8-487e-8efd-a5e910376819	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:14:54.06537+00	Simple syrup	gram
121eabda-aeeb-4811-b09d-b031fb6b8394	99a43f10-309d-40d0-b266-57f43b9b070a	\N	977c2dd1-1691-4f49-8599-64ea9e3846f1	SALE_CONSUMPTION	-40.0000	80.000000	3200	order	f406ffea-b4a8-487e-8efd-a5e910376819	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:14:54.06537+00	Creamer	gram
c66d6735-5cfe-4e26-bb8e-ae3cffd826fa	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6d14fad6-3ee7-4265-9a56-180d4c58c148	SALE_CONSUMPTION	-100.0000	20.000000	2000	order	f406ffea-b4a8-487e-8efd-a5e910376819	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:14:54.06537+00	Fresh Milk	millilitre
748c0ef8-c15c-4178-a28b-a457f65c7d74	99a43f10-309d-40d0-b266-57f43b9b070a	\N	d906603a-b681-49de-883d-4c8e445d7110	SALE_CONSUMPTION	-500.0000	6.000000	3000	order	f406ffea-b4a8-487e-8efd-a5e910376819	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:14:54.06537+00	Ice cube	gram
aa5b0d48-7167-410c-9a85-aed236a8b7ec	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	SALE_CONSUMPTION	-15.0000	214.000000	3210	order	f406ffea-b4a8-487e-8efd-a5e910376819	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:14:54.06537+00	Matcha	gram
792baf60-728c-4cfb-9ac6-1118702b9693	99a43f10-309d-40d0-b266-57f43b9b070a	\N	4d1064fd-7f62-4ea1-b50a-3c692d6e3211	MANUAL_ADJUSTMENT_IN	1000.0000	\N	\N	manual_adjustment	\N	\N	QA Sep16 opening stock		b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 08:00:54.749288+00	QA Sep16 Beans	gram
15eaefd8-444e-4022-86f1-f5b25ce03b22	99a43f10-309d-40d0-b266-57f43b9b070a	\N	0d8e3498-e1d8-4788-8a6a-ce73419e3957	MANUAL_ADJUSTMENT_IN	2000.0000	\N	\N	manual_adjustment	\N	\N	QA Sep16 opening stock		b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 08:01:08.751194+00	QA Sep16 Milk	millilitre
c67174f3-18ea-40a3-a904-90f26a5bd173	99a43f10-309d-40d0-b266-57f43b9b070a	\N	c9584b98-d4c4-447e-8788-ec94605e4fbb	MANUAL_ADJUSTMENT_IN	20.0000	\N	\N	manual_adjustment	\N	\N	QA Sep16 opening stock		b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 08:01:19.327718+00	QA Sep16 Cup	piece
5ca06be4-7c8c-441c-b827-82278a70a07c	99a43f10-309d-40d0-b266-57f43b9b070a	\N	4d1064fd-7f62-4ea1-b50a-3c692d6e3211	SALE_CONSUMPTION	-61.0500	100.000000	6105	order	ff7085f8-ae37-4aa3-8dce-f32d7444660e	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 08:03:44.464032+00	QA Sep16 Beans	gram
9b596bee-b78e-4b5c-88cb-cbe7f94d6a09	99a43f10-309d-40d0-b266-57f43b9b070a	\N	0d8e3498-e1d8-4788-8a6a-ce73419e3957	SALE_CONSUMPTION	-450.0000	20.000000	9000	order	ff7085f8-ae37-4aa3-8dce-f32d7444660e	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 08:03:44.464032+00	QA Sep16 Milk	millilitre
d4ce0d7b-88f9-430e-953d-723edfd96945	99a43f10-309d-40d0-b266-57f43b9b070a	\N	c9584b98-d4c4-447e-8788-ec94605e4fbb	SALE_CONSUMPTION	-3.0000	500.000000	1500	order	ff7085f8-ae37-4aa3-8dce-f32d7444660e	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 08:03:44.464032+00	QA Sep16 Cup	piece
13ec7a95-e3f7-4ae8-884a-7a22d5efaab7	99a43f10-309d-40d0-b266-57f43b9b070a	\N	91f12ef6-dab9-4370-843f-71024607e1e2	PURCHASE_RECEIPT	1000.0000	5.000000	5000	purchase	05343b66-8919-46c5-967e-23f695f5fbb5	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:34:24.844728+00	cabe	gram
f70bab5e-bc32-4ea3-9884-ebd15b60953e	99a43f10-309d-40d0-b266-57f43b9b070a	\N	91f12ef6-dab9-4370-843f-71024607e1e2	SALE_CONSUMPTION	-3.0000	5.474827	16	order	73f9fddb-97ea-462f-95f8-2f23ecebee30	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:34:58.138822+00	cabe	gram
d93f8db5-7551-4193-bdb6-aa695b977bf0	99a43f10-309d-40d0-b266-57f43b9b070a	\N	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	SALE_CONSUMPTION	-1.0000	2950.000000	2950	order	73f9fddb-97ea-462f-95f8-2f23ecebee30	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:34:58.138822+00	Mie goreng original	piece
86032b22-4d3b-4edc-b2db-56560aa20974	99a43f10-309d-40d0-b266-57f43b9b070a	\N	de449976-7785-4384-b858-834d42348ef4	SALE_CONSUMPTION	-1.0000	1833.333333	1833	order	73f9fddb-97ea-462f-95f8-2f23ecebee30	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:34:58.138822+00	telur	piece
1a09b289-992e-4a66-9aef-12923516bd40	99a43f10-309d-40d0-b266-57f43b9b070a	\N	4d1064fd-7f62-4ea1-b50a-3c692d6e3211	ORDER_CANCELLATION_REVERSAL	61.0500	100.000000	6105	order	ff7085f8-ae37-4aa3-8dce-f32d7444660e	5ca06be4-7c8c-441c-b827-82278a70a07c	Order cancellation reversal	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:55:29.797823+00	QA Sep16 Beans	gram
63e8aead-694f-448b-bde3-b5b85d43fd02	99a43f10-309d-40d0-b266-57f43b9b070a	\N	0d8e3498-e1d8-4788-8a6a-ce73419e3957	ORDER_CANCELLATION_REVERSAL	450.0000	20.000000	9000	order	ff7085f8-ae37-4aa3-8dce-f32d7444660e	9b596bee-b78e-4b5c-88cb-cbe7f94d6a09	Order cancellation reversal	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:55:29.797823+00	QA Sep16 Milk	millilitre
2af0b804-c1fd-49fc-a3fd-62dc9e287bb7	99a43f10-309d-40d0-b266-57f43b9b070a	\N	c9584b98-d4c4-447e-8788-ec94605e4fbb	ORDER_CANCELLATION_REVERSAL	3.0000	500.000000	1500	order	ff7085f8-ae37-4aa3-8dce-f32d7444660e	d4ce0d7b-88f9-430e-953d-723edfd96945	Order cancellation reversal	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:55:29.797823+00	QA Sep16 Cup	piece
67a8a29d-13a2-4187-bd33-1bd847ed4b02	99a43f10-309d-40d0-b266-57f43b9b070a	\N	4d1064fd-7f62-4ea1-b50a-3c692d6e3211	SALE_CONSUMPTION	-44.0000	100.000000	4400	order	05ca4c83-0e32-4190-af14-a1f044e9f78b	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:59:18.512855+00	QA Sep16 Beans	gram
b86d850c-df89-47b7-8a16-18890ebd9c67	99a43f10-309d-40d0-b266-57f43b9b070a	\N	0d8e3498-e1d8-4788-8a6a-ce73419e3957	SALE_CONSUMPTION	-300.0000	20.000000	6000	order	05ca4c83-0e32-4190-af14-a1f044e9f78b	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:59:18.512855+00	QA Sep16 Milk	millilitre
cc30b202-62a1-4763-ae72-1d4d4c8ca8bf	99a43f10-309d-40d0-b266-57f43b9b070a	\N	c9584b98-d4c4-447e-8788-ec94605e4fbb	SALE_CONSUMPTION	-2.0000	500.000000	1000	order	05ca4c83-0e32-4190-af14-a1f044e9f78b	\N	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:59:18.512855+00	QA Sep16 Cup	piece
bf205965-5844-4679-b91c-d555a01dddbc	99a43f10-309d-40d0-b266-57f43b9b070a	\N	48972053-ddea-4013-ba8b-dead6db49581	STOCK_COUNT_CORRECTION	1000.0000	\N	\N	stock_count	b895ae63-dd26-47b3-80b3-6dfde8b01dc2	\N	Stock count correction	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 12:23:39.087623+00	Chicken Meat	gram
cf76340b-e316-4057-a999-fa041386e8c5	99a43f10-309d-40d0-b266-57f43b9b070a	\N	48972053-ddea-4013-ba8b-dead6db49581	MANUAL_ADJUSTMENT_IN	2000.0000	\N	\N	manual_adjustment	\N	\N	correcting count error		b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 12:23:58.053272+00	Chicken Meat	gram
bb5b21c9-42d5-47d3-95ac-4bece994d9cb	99a43f10-309d-40d0-b266-57f43b9b070a	\N	f231724a-06a2-4499-a4c2-96bee6927b36	SALE_CONSUMPTION	-1.3000	1360.000000	1768	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Cup R	piece
e29e0fd8-b51d-4e09-a939-d6356804be93	99a43f10-309d-40d0-b266-57f43b9b070a	\N	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	SALE_CONSUMPTION	-10.0000	18.439716	184	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Simple syrup	gram
df555e0e-2cd4-4aea-ae84-88e182ade58a	99a43f10-309d-40d0-b266-57f43b9b070a	\N	977c2dd1-1691-4f49-8599-64ea9e3846f1	SALE_CONSUMPTION	-40.0000	80.000000	3200	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Creamer	gram
de9c9c97-f4b6-4d5e-8c80-0defd40c2264	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6d14fad6-3ee7-4265-9a56-180d4c58c148	SALE_CONSUMPTION	-100.0000	20.000000	2000	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Fresh Milk	millilitre
65ba3532-046e-4f63-a16a-68524859f8cf	99a43f10-309d-40d0-b266-57f43b9b070a	\N	d906603a-b681-49de-883d-4c8e445d7110	SALE_CONSUMPTION	-500.0000	6.000000	3000	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Ice cube	gram
c221f4df-f7f2-4219-b027-e6cd4a7a80f4	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	SALE_CONSUMPTION	-15.0000	214.000000	3210	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Matcha	gram
5eb71e54-52ba-46c4-a4ce-334b8c2b7357	99a43f10-309d-40d0-b266-57f43b9b070a	\N	d8a13950-dee9-4fdd-a339-1e21e366f496	SALE_CONSUMPTION	-1.3000	1400.000000	1820	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Cup L	piece
f20bec97-5655-4da7-9cab-a945dbf31503	99a43f10-309d-40d0-b266-57f43b9b070a	\N	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	SALE_CONSUMPTION	-15.0000	18.439716	277	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Simple syrup	gram
9c441772-8bde-4496-9a84-82c2c291b103	99a43f10-309d-40d0-b266-57f43b9b070a	\N	977c2dd1-1691-4f49-8599-64ea9e3846f1	SALE_CONSUMPTION	-60.0000	80.000000	4800	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Creamer	gram
8f0b83e7-2e3c-4a86-9cb2-e022976041a5	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6d14fad6-3ee7-4265-9a56-180d4c58c148	SALE_CONSUMPTION	-150.0000	20.000000	3000	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Fresh Milk	millilitre
22b6b367-a420-48da-84b6-b10210ac7a11	99a43f10-309d-40d0-b266-57f43b9b070a	\N	d906603a-b681-49de-883d-4c8e445d7110	SALE_CONSUMPTION	-500.0000	6.000000	3000	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Ice cube	gram
365edf52-c499-4e7a-91a6-b46cb5900b3d	99a43f10-309d-40d0-b266-57f43b9b070a	\N	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	SALE_CONSUMPTION	-22.5000	214.000000	4815	order	fd9345c4-510f-421a-b918-479661d443f1	\N	\N	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	Matcha	gram
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.locations (id, business_id, name, address, active, created_at, updated_at) FROM stdin;
6b1dd2b8-0703-4a4b-a0e2-0d5658a0c496	99a43f10-309d-40d0-b266-57f43b9b070a	Main Store	\N	t	2026-09-13 06:24:09.822629+00	2026-09-13 06:24:09.822629+00
\.


--
-- Data for Name: login_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.login_attempts (key_hash, count, window_start, expires_at) FROM stdin;
c6ef3ea0861a2a545a3bf68efeaee641dba30414e8d6d0426e605755de48023d	1	2026-09-18 02:59:40.620881+00	2026-09-18 03:00:40.620881+00
\.


--
-- Data for Name: menu_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.menu_categories (id, business_id, name, display_order, active, created_at, updated_at) FROM stdin;
a61e7ac7-6fcb-4b5b-aa10-76b5f966c24d	99a43f10-309d-40d0-b266-57f43b9b070a	Noodle	1	t	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
ad9616f4-a8ac-498c-aab0-be8810b3257c	99a43f10-309d-40d0-b266-57f43b9b070a	Rice	2	t	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
9a58dd2d-6675-4375-9012-0371919da599	99a43f10-309d-40d0-b266-57f43b9b070a	Snack	3	t	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
12642b11-cb3e-4a65-a13f-e54503f804ef	99a43f10-309d-40d0-b266-57f43b9b070a	Drink	0	t	2026-09-14 07:15:56.178504+00	2026-09-14 07:15:56.178504+00
\.


--
-- Data for Name: menu_item_modifier_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.menu_item_modifier_groups (id, menu_item_id, modifier_group_id, display_order) FROM stdin;
aebf4ff5-a41f-4253-977c-781c7461a7ba	6a17c6c4-1575-48a9-8069-0ff871735152	88fe2871-5223-422c-88d5-0f273345850e	0
ecda54eb-2295-4320-803e-df2035eb8686	37139bea-ffb9-4e0e-87d8-4229804c6bae	a2273563-1fe0-45c1-a955-6e16cae41b93	0
\.


--
-- Data for Name: menu_item_variants; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.menu_item_variants (id, menu_item_id, name, price, active, display_order, created_at, updated_at) FROM stdin;
522566a0-f3a0-479b-8637-b488829a7f29	6ab4d723-cdb2-4187-b50a-51edd640d5ae	Regular	27000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
ada4b6c8-9ef2-477a-bb0e-4a020517fd0b	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	Original	15000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
da3cfd7c-6331-4928-b9e0-c5c09173f807	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	Kriuk	15000	t	1	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
242c42ee-3e33-4ac2-801b-30a4debd77ec	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	Rendang	15000	t	2	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
fba5ed55-1a6a-4c1e-8519-b4c5d6910ee2	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	Bangladesh	15000	t	3	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
641ed5a9-3577-47a0-b690-8102b221898e	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	Ayam Geprek	15000	t	4	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
13f2d7f6-0fba-4496-8212-026993ca11e9	da337ad0-f1cb-49e9-a34f-c1e1f69bebf4	Kari Ayam	16000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
2ce8d8db-5dbf-4799-9ef2-c7fc07162423	da337ad0-f1cb-49e9-a34f-c1e1f69bebf4	Soto	16000	t	1	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
abde6dc9-62ca-4fb2-aad9-716fd44da4cb	461c2c97-e548-49d2-a693-acfc861ef86e	Regular	30000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
b2a53bae-ba9e-4da4-912c-37ea314880e5	0c16cffd-a080-4cb0-9aad-bf643ea4a712	Regular	32000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
626e3f5e-4979-4d13-96b2-eb3a0ac65942	d999f8dd-6e03-4a94-a307-1ed50696920d	Regular	28000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
d724d5cb-825b-46cc-a702-bb17acea2944	e04c7015-68eb-43cb-88ab-55bebe85d448	Regular	30000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
782b609d-e17d-45ac-a2bd-dc07f0ac8ecb	8abbdc51-6f8f-48fa-98c3-f710de7e00ee	Regular	30000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
ecd7c58f-4b27-42dd-8d11-8c5f5564d756	af854220-38a8-4f41-8f21-09fbd9cb4794	Regular	28000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
c738ad70-2575-4b84-bf3b-25e864d26aea	6a17c6c4-1575-48a9-8069-0ff871735152	Regular	22000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
e60218d3-44fc-4bdb-bb2e-613d5db002fe	145da08c-7c30-4ec0-8916-83412432e0ea	Regular	23000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
7a1863af-a0a4-4835-9006-5f5c856a66fe	4d622ad0-94a8-4819-bdc1-ef9c41ffbeb2	Regular	25000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
ae94b5da-1371-4bdb-9a3a-5b69aad9d696	3ea786b1-63a1-4eb6-8c1b-819916a27761	Regular	24000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
c9d84f55-5721-4e83-8e13-9dd3cd7b4c64	978f5e2d-157d-4b5c-8317-663a19620d46	BBQ	21000	t	0	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
62a867c1-e10f-4e2d-afbf-29d2807fa0c0	978f5e2d-157d-4b5c-8317-663a19620d46	Keju	21000	t	1	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
b4d90478-7095-477f-9613-75cea48577b0	978f5e2d-157d-4b5c-8317-663a19620d46	Original	21000	t	2	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
7323681f-5afd-41e7-ab44-5e8118495271	978f5e2d-157d-4b5c-8317-663a19620d46	Jagung Bakar	21000	t	3	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
6ea3f072-91ea-4606-80fc-983dd0c7a05e	55843206-d1c1-4d49-b385-7edb575573e6	Regular	3000	t	0	2026-09-13 08:58:14.483012+00	2026-09-13 09:27:29.389+00
916d4164-43c5-44a2-8a9e-ab3a4092404f	37139bea-ffb9-4e0e-87d8-4229804c6bae	Regular	1000	t	0	2026-09-13 10:51:52.375082+00	2026-09-13 10:51:52.375082+00
58381b94-8e8d-4f50-a2ad-4b34be9f266f	1055f9a1-e494-46a6-81ec-66e94f90993c	Regular	26000	t	0	2026-09-14 07:22:18.257103+00	2026-09-14 07:22:18.257103+00
33724e05-3d2e-431f-bc47-2f549d1f8210	1055f9a1-e494-46a6-81ec-66e94f90993c	Large	33000	t	0	2026-09-14 07:23:06.703564+00	2026-09-14 07:31:32.703+00
6f5aff82-4fab-4e61-a1dd-b526223b611e	eba7ed0e-5990-4679-9eb9-27fb620f873d	Regular	30000	t	0	2026-09-16 08:01:47.219803+00	2026-09-16 08:01:47.219803+00
9344cf78-4f10-4bee-8f41-5f5b3b211116	eba7ed0e-5990-4679-9eb9-27fb620f873d	QA Large	40000	t	0	2026-09-16 12:02:33.550055+00	2026-09-16 12:02:33.550055+00
\.


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.menu_items (id, business_id, category_id, name, description, image_url, base_price, tax_behavior, active, archived_at, tracks_inventory, display_order, created_by, updated_by, created_at, updated_at) FROM stdin;
6ab4d723-cdb2-4187-b50a-51edd640d5ae	99a43f10-309d-40d0-b266-57f43b9b070a	a61e7ac7-6fcb-4b5b-aa10-76b5f966c24d	Mie Goreng Ulang Tahun	\N	/images/menu/matsudon/mie-goreng-ulang-tahun.webp	27000	exclusive	t	\N	f	0	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
da337ad0-f1cb-49e9-a34f-c1e1f69bebf4	99a43f10-309d-40d0-b266-57f43b9b070a	a61e7ac7-6fcb-4b5b-aa10-76b5f966c24d	Mie Kuah	\N	/images/menu/matsudon/mie-kuah.webp	16000	exclusive	t	\N	f	2	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
461c2c97-e548-49d2-a693-acfc861ef86e	99a43f10-309d-40d0-b266-57f43b9b070a	ad9616f4-a8ac-498c-aab0-be8810b3257c	Spicy Tamago Curry Rice	New menu. Spicy.	/images/menu/matsudon/spicy-tamago-curry-rice.webp	30000	exclusive	t	\N	f	0	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
0c16cffd-a080-4cb0-9aad-bf643ea4a712	99a43f10-309d-40d0-b266-57f43b9b070a	ad9616f4-a8ac-498c-aab0-be8810b3257c	Spicy Tori Curry Rice	New menu. Spicy.	/images/menu/matsudon/spicy-tori-curry-rice.webp	32000	exclusive	t	\N	f	1	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
d999f8dd-6e03-4a94-a307-1ed50696920d	99a43f10-309d-40d0-b266-57f43b9b070a	ad9616f4-a8ac-498c-aab0-be8810b3257c	Tamago Curry Rice	\N	/images/menu/matsudon/tamago-curry-rice.webp	28000	exclusive	t	\N	f	2	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
e04c7015-68eb-43cb-88ab-55bebe85d448	99a43f10-309d-40d0-b266-57f43b9b070a	ad9616f4-a8ac-498c-aab0-be8810b3257c	Tori Curry Rice	\N	/images/menu/matsudon/tori-curry-rice.webp	30000	exclusive	t	\N	f	3	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
8abbdc51-6f8f-48fa-98c3-f710de7e00ee	99a43f10-309d-40d0-b266-57f43b9b070a	ad9616f4-a8ac-498c-aab0-be8810b3257c	Gepurekkuchiri Karage Don	\N	/images/menu/matsudon/gepurekkuchiri-karage-don.webp	30000	exclusive	t	\N	f	4	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
af854220-38a8-4f41-8f21-09fbd9cb4794	99a43f10-309d-40d0-b266-57f43b9b070a	ad9616f4-a8ac-498c-aab0-be8810b3257c	Teriyaki Karage Don	\N	/images/menu/matsudon/teriyaki-karage-don.webp	28000	exclusive	t	\N	f	5	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
6a17c6c4-1575-48a9-8069-0ff871735152	99a43f10-309d-40d0-b266-57f43b9b070a	9a58dd2d-6675-4375-9012-0371919da599	Crispy Enoki	Add Egg or Chicken Karage.	/images/menu/matsudon/crispy-enoki.webp	22000	exclusive	t	\N	t	0	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
145da08c-7c30-4ec0-8916-83412432e0ea	99a43f10-309d-40d0-b266-57f43b9b070a	9a58dd2d-6675-4375-9012-0371919da599	Taiyaki Coklat	\N	/images/menu/matsudon/taiyaki.webp	23000	exclusive	t	\N	f	1	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
4d622ad0-94a8-4819-bdc1-ef9c41ffbeb2	99a43f10-309d-40d0-b266-57f43b9b070a	9a58dd2d-6675-4375-9012-0371919da599	Taiyaki Biscoff	\N	/images/menu/matsudon/taiyaki.webp	25000	exclusive	t	\N	f	2	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
3ea786b1-63a1-4eb6-8c1b-819916a27761	99a43f10-309d-40d0-b266-57f43b9b070a	9a58dd2d-6675-4375-9012-0371919da599	Taiyaki Mix	\N	/images/menu/matsudon/taiyaki.webp	24000	exclusive	t	\N	f	3	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
978f5e2d-157d-4b5c-8317-663a19620d46	99a43f10-309d-40d0-b266-57f43b9b070a	9a58dd2d-6675-4375-9012-0371919da599	French Fries	\N	/images/menu/matsudon/french-fries.webp	21000	exclusive	t	\N	f	4	\N	\N	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
55843206-d1c1-4d49-b385-7edb575573e6	99a43f10-309d-40d0-b266-57f43b9b070a	\N	Es Batu	\N	\N	3000	exclusive	t	\N	t	0	b087e36c-b8af-40dc-a541-b9a90de7db6e	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 08:58:14.483012+00	2026-09-13 09:26:29.868+00
a4ae43af-e8f7-4625-a7a4-ae7b14a14227	99a43f10-309d-40d0-b266-57f43b9b070a	a61e7ac7-6fcb-4b5b-aa10-76b5f966c24d	Mie Goreng	\N	/images/menu/matsudon/mie-goreng.webp	15000	exclusive	t	\N	t	0	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 06:33:35.6547+00	2026-09-13 09:53:18.466+00
37139bea-ffb9-4e0e-87d8-4229804c6bae	99a43f10-309d-40d0-b266-57f43b9b070a	\N	java a	\N	\N	1000	exclusive	t	\N	t	0	b087e36c-b8af-40dc-a541-b9a90de7db6e	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 10:51:52.375082+00	2026-09-13 10:51:55.338+00
1055f9a1-e494-46a6-81ec-66e94f90993c	99a43f10-309d-40d0-b266-57f43b9b070a	12642b11-cb3e-4a65-a13f-e54503f804ef	Osaka Matcha	\N	\N	26000	exclusive	t	\N	t	0	b087e36c-b8af-40dc-a541-b9a90de7db6e	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:22:18.257103+00	2026-09-14 07:23:42.397+00
eba7ed0e-5990-4679-9eb9-27fb620f873d	99a43f10-309d-40d0-b266-57f43b9b070a	\N	QA Sep16 Latte	\N	\N	30000	exclusive	t	\N	t	0	b087e36c-b8af-40dc-a541-b9a90de7db6e	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 08:01:47.219803+00	2026-09-16 08:01:47.219803+00
\.


--
-- Data for Name: modifier_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.modifier_groups (id, business_id, name, required, min_selections, max_selections, active, created_at, updated_at) FROM stdin;
88fe2871-5223-422c-88d5-0f273345850e	99a43f10-309d-40d0-b266-57f43b9b070a	Enoki Add-on	f	0	2	t	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
a2273563-1fe0-45c1-a955-6e16cae41b93	99a43f10-309d-40d0-b266-57f43b9b070a	Large	t	0	1	t	2026-09-13 10:50:38.319887+00	2026-09-13 10:50:38.319887+00
\.


--
-- Data for Name: modifier_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.modifier_options (id, modifier_group_id, name, price_adjustment, active, display_order, created_at, updated_at) FROM stdin;
b0a6d4b5-0d09-4bd6-9b11-7e28922fcfdb	88fe2871-5223-422c-88d5-0f273345850e	Egg	7000	t	1	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
2865dc96-2f42-4eb8-b7f2-c547f4e75a50	88fe2871-5223-422c-88d5-0f273345850e	Chicken Karage	7000	t	2	2026-09-13 06:33:35.6547+00	2026-09-13 06:33:35.6547+00
9ed147bb-ec5e-4b83-b698-c2fc01deffce	a2273563-1fe0-45c1-a955-6e16cae41b93	Large	7000	t	0	2026-09-13 10:50:51.649849+00	2026-09-13 10:50:51.649849+00
\.


--
-- Data for Name: modifier_recipe_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.modifier_recipe_lines (id, modifier_option_id, ingredient_id, quantity_base_units, waste_percentage) FROM stdin;
\.


--
-- Data for Name: order_ingredient_consumption; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_ingredient_consumption (id, order_id, order_line_id, ingredient_id, quantity_base_units, unit_cost_snapshot, total_cost, inventory_movement_id, ingredient_name_snapshot, ingredient_base_unit_snapshot) FROM stdin;
2367cd2a-c18a-484d-869b-9b55546d6be8	2e78449e-6865-4e98-b1b6-e076fd161fc0	2db25503-025c-4327-9549-7cea06966dec	91f12ef6-dab9-4370-843f-71024607e1e2	3.0000	42.000000	126	50549eea-6df0-49ec-b478-b55017707226	cabe	gram
be5383fa-2e3c-4354-890d-a9997bd2c23b	2e78449e-6865-4e98-b1b6-e076fd161fc0	2db25503-025c-4327-9549-7cea06966dec	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	1.0000	2950.000000	2950	41103bde-5ff9-4f73-b1d0-f2b3c740c5e5	Mie goreng original	piece
2eeffe4d-c01f-4898-a806-4b3212e7aa00	2e78449e-6865-4e98-b1b6-e076fd161fc0	2db25503-025c-4327-9549-7cea06966dec	de449976-7785-4384-b858-834d42348ef4	1.0000	1833.333333	1833	a964e460-da66-40e4-a969-88faf2e19761	telur	piece
f96a42a6-cdb6-4ad7-a4f0-2c00812dd3ea	637f5df3-697a-4644-b827-e3fa8f43fc30	2f1a4806-b648-4558-8c8a-575c7322cbd6	91f12ef6-dab9-4370-843f-71024607e1e2	30.0000	42.000000	1260	de02b378-857a-4a5e-a392-6d6033c15169	cabe	gram
7e1bc153-2ad0-40b9-a865-f0aea5c2c8f3	637f5df3-697a-4644-b827-e3fa8f43fc30	2f1a4806-b648-4558-8c8a-575c7322cbd6	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	10.0000	2950.000000	29500	9b4b4de9-9516-4d1f-8ff3-2130a0da0711	Mie goreng original	piece
ab8606dd-5e2e-42f4-b33b-dbaa395f988b	637f5df3-697a-4644-b827-e3fa8f43fc30	2f1a4806-b648-4558-8c8a-575c7322cbd6	de449976-7785-4384-b858-834d42348ef4	10.0000	1833.333333	18333	9eedc931-5426-4e7d-8bf7-1e6241103244	telur	piece
536d0e4e-e9eb-45ea-ab8a-d3add522e26f	7c124622-584b-4778-8693-4a29a0f913f6	e4c1627b-19fd-4497-8490-e0edbc6fe870	91f12ef6-dab9-4370-843f-71024607e1e2	45.0000	42.000000	1890	9a260fe8-2ad0-409a-9051-dbb7f20230c8	cabe	gram
71cdd81d-6c9b-4bd3-8ccd-7c391bc5eb16	7c124622-584b-4778-8693-4a29a0f913f6	e4c1627b-19fd-4497-8490-e0edbc6fe870	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	15.0000	2950.000000	44250	b861a8de-58a7-45a3-9072-a507f7f325d7	Mie goreng original	piece
0d7043aa-2a4a-4328-9240-9ab3d00a5b33	7c124622-584b-4778-8693-4a29a0f913f6	e4c1627b-19fd-4497-8490-e0edbc6fe870	de449976-7785-4384-b858-834d42348ef4	15.0000	1833.333333	27500	6625c083-601b-4e79-905b-25f1448e712d	telur	piece
7a7ae47c-f9a7-4b5a-8d7f-d3eae08155a3	a065bff2-7977-4498-97c3-ee7304332a5c	5dc2d0e9-2fbf-48d7-922b-d826b8031b2c	f231724a-06a2-4499-a4c2-96bee6927b36	1.3000	1360.000000	1768	ac2b733b-7ea8-43cc-af14-323340152fad	Cup R	piece
b2cff396-8103-4311-9c79-41809ef33086	a065bff2-7977-4498-97c3-ee7304332a5c	5dc2d0e9-2fbf-48d7-922b-d826b8031b2c	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	10.0000	18.439716	184	f486a23a-f941-4423-8fb6-203dfdbcc0df	Simple syrup	gram
4104ae15-c0b8-462c-8298-de307df9d0c0	a065bff2-7977-4498-97c3-ee7304332a5c	5dc2d0e9-2fbf-48d7-922b-d826b8031b2c	977c2dd1-1691-4f49-8599-64ea9e3846f1	40.0000	80.000000	3200	9d103ce4-c8da-4444-9d28-58fcb28570ed	Creamer	gram
b83a2047-0921-468b-a358-beb01db82358	a065bff2-7977-4498-97c3-ee7304332a5c	5dc2d0e9-2fbf-48d7-922b-d826b8031b2c	6d14fad6-3ee7-4265-9a56-180d4c58c148	100.0000	20.000000	2000	1cb46510-a0da-4c3b-8b15-a0c8939297e8	Fresh Milk	millilitre
9dd0f10e-db7a-4173-81a3-5228d2802cf1	a065bff2-7977-4498-97c3-ee7304332a5c	5dc2d0e9-2fbf-48d7-922b-d826b8031b2c	d906603a-b681-49de-883d-4c8e445d7110	500.0000	6.000000	3000	97bb7f1d-3c6e-4730-a991-d358b0a50ca3	Ice cube	gram
5266b7aa-790c-4084-a2d7-73f601eaf169	a065bff2-7977-4498-97c3-ee7304332a5c	5dc2d0e9-2fbf-48d7-922b-d826b8031b2c	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	15.0000	214.000000	3210	971cc785-cdc6-4b96-85d1-54a0bec7c5ae	Matcha	gram
e7859432-ef10-4dcd-a897-bd19588dee8e	ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	8ad977de-120f-4e35-8a2d-77b0d146b96b	91f12ef6-dab9-4370-843f-71024607e1e2	6.0000	42.000000	252	0116e653-3e06-4a6d-a8cf-696f406570f2	cabe	gram
46124765-89d3-4f8b-8f53-19a540dd5a96	ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	8ad977de-120f-4e35-8a2d-77b0d146b96b	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	2.0000	2950.000000	5900	27ad0fdc-983c-4282-ad5d-3bd6c18cdf8f	Mie goreng original	piece
fb7923b2-c94a-4064-93e7-20eb86557d9d	ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	8ad977de-120f-4e35-8a2d-77b0d146b96b	de449976-7785-4384-b858-834d42348ef4	2.0000	1833.333333	3667	81d542f2-58ab-4c4d-8934-ac196fc306ea	telur	piece
51c516d8-3ecb-4d0d-a64c-5f0c49360684	7d49481b-fc34-4fcf-a36d-6bb9332324c6	072cad71-f417-47c8-bf64-0efdbc77686c	91f12ef6-dab9-4370-843f-71024607e1e2	3.0000	42.000000	126	4fc7ef9c-dc31-4563-a17f-2c6798b9d5b5	cabe	gram
4b4e20bd-c8bb-4936-aa8b-3e936b6c545d	7d49481b-fc34-4fcf-a36d-6bb9332324c6	072cad71-f417-47c8-bf64-0efdbc77686c	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	1.0000	2950.000000	2950	595baf0d-fa2d-4cc2-97a0-32bb251dce20	Mie goreng original	piece
5a5928d8-cfcd-4e93-83bc-96ac58f83d29	7d49481b-fc34-4fcf-a36d-6bb9332324c6	072cad71-f417-47c8-bf64-0efdbc77686c	de449976-7785-4384-b858-834d42348ef4	1.0000	1833.333333	1833	e3ee89c0-01a9-46d0-93e4-a7d230ee042e	telur	piece
17fb4b55-6a63-463c-aed2-c64ab5f3804e	746de8b3-e688-489e-a15e-c042994d9bbd	371ee340-7b32-4ac4-ba4b-d98d830ea9d0	f231724a-06a2-4499-a4c2-96bee6927b36	1.3000	1360.000000	1768	d7a5e825-7d20-4ebd-a006-3944aebd2353	Cup R	piece
fd2c20e3-42f0-4580-820a-b8fc95292ed5	746de8b3-e688-489e-a15e-c042994d9bbd	371ee340-7b32-4ac4-ba4b-d98d830ea9d0	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	10.0000	18.439716	184	ef70c425-9dec-4c42-85fb-185223357050	Simple syrup	gram
1b536cd3-7275-48f5-be53-20164f0208ce	746de8b3-e688-489e-a15e-c042994d9bbd	371ee340-7b32-4ac4-ba4b-d98d830ea9d0	977c2dd1-1691-4f49-8599-64ea9e3846f1	40.0000	80.000000	3200	5103f573-137d-44f4-9c49-3a5bfd7423b2	Creamer	gram
2acd54d9-254a-449a-82e5-4595831779db	746de8b3-e688-489e-a15e-c042994d9bbd	371ee340-7b32-4ac4-ba4b-d98d830ea9d0	6d14fad6-3ee7-4265-9a56-180d4c58c148	100.0000	20.000000	2000	8109862d-240f-4f54-96c3-2d8130c55d61	Fresh Milk	millilitre
7ce0227d-35c7-4cd2-a50c-69c2634f6b76	746de8b3-e688-489e-a15e-c042994d9bbd	371ee340-7b32-4ac4-ba4b-d98d830ea9d0	d906603a-b681-49de-883d-4c8e445d7110	500.0000	6.000000	3000	c0577ced-a9ef-4600-8d3a-1a425c0045cb	Ice cube	gram
9826e164-924c-48f5-94f9-1677bffd9b5b	746de8b3-e688-489e-a15e-c042994d9bbd	371ee340-7b32-4ac4-ba4b-d98d830ea9d0	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	15.0000	214.000000	3210	04be44b8-8418-4452-8cf5-ebebfca07346	Matcha	gram
1017d04d-eb76-49c2-8585-af57109e78c4	d4d3b654-b55c-48fe-9c39-24840dafdfa4	d3a14c87-22da-46ff-8fbb-2daebbacf078	f231724a-06a2-4499-a4c2-96bee6927b36	1.3000	1360.000000	1768	067f0358-5f99-4bb0-adb5-f30e53199f60	Cup R	piece
53bbf7af-f7ad-48a8-a044-de8828bd85ca	d4d3b654-b55c-48fe-9c39-24840dafdfa4	d3a14c87-22da-46ff-8fbb-2daebbacf078	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	10.0000	18.439716	184	881a8c35-b296-4ac2-85de-0df5b5748491	Simple syrup	gram
ac0631f0-f867-437c-be7a-de12ea46065e	d4d3b654-b55c-48fe-9c39-24840dafdfa4	d3a14c87-22da-46ff-8fbb-2daebbacf078	977c2dd1-1691-4f49-8599-64ea9e3846f1	40.0000	80.000000	3200	166050d4-3002-4ba0-918a-dd5ffbfb2def	Creamer	gram
3beb5218-95a9-4208-9907-ffe064fb5981	d4d3b654-b55c-48fe-9c39-24840dafdfa4	d3a14c87-22da-46ff-8fbb-2daebbacf078	6d14fad6-3ee7-4265-9a56-180d4c58c148	100.0000	20.000000	2000	5b42d617-b280-4307-a092-dfebe15c71c0	Fresh Milk	millilitre
00394dc0-5f81-43c5-b691-39f0c31f1866	d4d3b654-b55c-48fe-9c39-24840dafdfa4	d3a14c87-22da-46ff-8fbb-2daebbacf078	d906603a-b681-49de-883d-4c8e445d7110	500.0000	6.000000	3000	944e40c9-8ec7-47f3-91c3-1da7544d3fbf	Ice cube	gram
bcb19825-eaca-400a-825c-dc967993f385	d4d3b654-b55c-48fe-9c39-24840dafdfa4	d3a14c87-22da-46ff-8fbb-2daebbacf078	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	15.0000	214.000000	3210	af066601-493a-461b-aa5e-5039089c780a	Matcha	gram
f95cb206-2d81-4a29-97c3-97c8c83b5ebb	f406ffea-b4a8-487e-8efd-a5e910376819	43e442dd-c1cc-4461-b584-e81b35b3b72c	f231724a-06a2-4499-a4c2-96bee6927b36	1.3000	1360.000000	1768	a302fb46-7025-4904-9377-43e7b624a14e	Cup R	piece
a4431699-1a30-4f1e-8d29-75c54e5cea4c	f406ffea-b4a8-487e-8efd-a5e910376819	43e442dd-c1cc-4461-b584-e81b35b3b72c	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	10.0000	18.439716	184	35096916-2b77-40d2-b936-e41a7a95968e	Simple syrup	gram
15056921-b939-4bc4-9884-cfe66d27e8e2	f406ffea-b4a8-487e-8efd-a5e910376819	43e442dd-c1cc-4461-b584-e81b35b3b72c	977c2dd1-1691-4f49-8599-64ea9e3846f1	40.0000	80.000000	3200	121eabda-aeeb-4811-b09d-b031fb6b8394	Creamer	gram
c741e131-1d36-446e-a80c-6a2910f6af45	f406ffea-b4a8-487e-8efd-a5e910376819	43e442dd-c1cc-4461-b584-e81b35b3b72c	6d14fad6-3ee7-4265-9a56-180d4c58c148	100.0000	20.000000	2000	c66d6735-5cfe-4e26-bb8e-ae3cffd826fa	Fresh Milk	millilitre
aff25cde-095f-423e-b03d-184485b44c1e	f406ffea-b4a8-487e-8efd-a5e910376819	43e442dd-c1cc-4461-b584-e81b35b3b72c	d906603a-b681-49de-883d-4c8e445d7110	500.0000	6.000000	3000	748c0ef8-c15c-4178-a28b-a457f65c7d74	Ice cube	gram
23905a8b-0685-45d4-9a47-c583c2ea38ef	f406ffea-b4a8-487e-8efd-a5e910376819	43e442dd-c1cc-4461-b584-e81b35b3b72c	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	15.0000	214.000000	3210	aa5b0d48-7167-410c-9a85-aed236a8b7ec	Matcha	gram
9f1983c2-4621-48f4-b31a-c5c8a2698ab8	ff7085f8-ae37-4aa3-8dce-f32d7444660e	2f89fbc3-a1cb-4a03-8201-05e38c4a1c76	4d1064fd-7f62-4ea1-b50a-3c692d6e3211	61.0500	100.000000	6105	5ca06be4-7c8c-441c-b827-82278a70a07c	QA Sep16 Beans	gram
ffa0b76e-5b4d-43c7-b4f0-d7e1e9cea529	ff7085f8-ae37-4aa3-8dce-f32d7444660e	2f89fbc3-a1cb-4a03-8201-05e38c4a1c76	0d8e3498-e1d8-4788-8a6a-ce73419e3957	450.0000	20.000000	9000	9b596bee-b78e-4b5c-88cb-cbe7f94d6a09	QA Sep16 Milk	millilitre
12332f96-c4bd-4b3f-af7a-d45705d9b501	ff7085f8-ae37-4aa3-8dce-f32d7444660e	2f89fbc3-a1cb-4a03-8201-05e38c4a1c76	c9584b98-d4c4-447e-8788-ec94605e4fbb	3.0000	500.000000	1500	d4ce0d7b-88f9-430e-953d-723edfd96945	QA Sep16 Cup	piece
c37537c8-2c58-401e-acfe-80436582b129	73f9fddb-97ea-462f-95f8-2f23ecebee30	df670721-4b5c-469a-b79a-7caaea16ead1	91f12ef6-dab9-4370-843f-71024607e1e2	3.0000	5.474827	16	f70bab5e-bc32-4ea3-9884-ebd15b60953e	cabe	gram
a85d9bbd-c379-4482-b16e-b599884bdafe	73f9fddb-97ea-462f-95f8-2f23ecebee30	df670721-4b5c-469a-b79a-7caaea16ead1	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	1.0000	2950.000000	2950	d93f8db5-7551-4193-bdb6-aa695b977bf0	Mie goreng original	piece
c1b9ea14-d0af-477b-96ed-05cfb80a817b	73f9fddb-97ea-462f-95f8-2f23ecebee30	df670721-4b5c-469a-b79a-7caaea16ead1	de449976-7785-4384-b858-834d42348ef4	1.0000	1833.333333	1833	86032b22-4d3b-4edc-b2db-56560aa20974	telur	piece
203dba24-02c4-4745-a608-360f9adb8f61	05ca4c83-0e32-4190-af14-a1f044e9f78b	db2afba7-80fa-46f0-98c8-29ace2f78b3f	4d1064fd-7f62-4ea1-b50a-3c692d6e3211	44.0000	100.000000	4400	67a8a29d-13a2-4187-bd33-1bd847ed4b02	QA Sep16 Beans	gram
e286b0b9-0c3f-4ff1-931b-d65555f28686	05ca4c83-0e32-4190-af14-a1f044e9f78b	db2afba7-80fa-46f0-98c8-29ace2f78b3f	0d8e3498-e1d8-4788-8a6a-ce73419e3957	300.0000	20.000000	6000	b86d850c-df89-47b7-8a16-18890ebd9c67	QA Sep16 Milk	millilitre
b13e6238-1aeb-42b9-b644-e3f55e3f5d19	05ca4c83-0e32-4190-af14-a1f044e9f78b	db2afba7-80fa-46f0-98c8-29ace2f78b3f	c9584b98-d4c4-447e-8788-ec94605e4fbb	2.0000	500.000000	1000	cc30b202-62a1-4763-ae72-1d4d4c8ca8bf	QA Sep16 Cup	piece
2d486d78-a2be-4230-94fc-2de945c8b118	fd9345c4-510f-421a-b918-479661d443f1	e6cb4fce-b11c-443c-a5e0-73afe1bcb113	f231724a-06a2-4499-a4c2-96bee6927b36	1.3000	1360.000000	1768	bb5b21c9-42d5-47d3-95ac-4bece994d9cb	Cup R	piece
266e152c-c294-468e-880c-e8c0a5185475	fd9345c4-510f-421a-b918-479661d443f1	e6cb4fce-b11c-443c-a5e0-73afe1bcb113	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	10.0000	18.439716	184	e29e0fd8-b51d-4e09-a939-d6356804be93	Simple syrup	gram
37328d44-6cc7-4740-8f2f-1761ee8d6d90	fd9345c4-510f-421a-b918-479661d443f1	e6cb4fce-b11c-443c-a5e0-73afe1bcb113	977c2dd1-1691-4f49-8599-64ea9e3846f1	40.0000	80.000000	3200	df555e0e-2cd4-4aea-ae84-88e182ade58a	Creamer	gram
9fbf77c9-af41-4081-8f42-e1b1c1dc7b22	fd9345c4-510f-421a-b918-479661d443f1	e6cb4fce-b11c-443c-a5e0-73afe1bcb113	6d14fad6-3ee7-4265-9a56-180d4c58c148	100.0000	20.000000	2000	de9c9c97-f4b6-4d5e-8c80-0defd40c2264	Fresh Milk	millilitre
f52545ac-87ca-4e58-a20a-518fa8c4e18e	fd9345c4-510f-421a-b918-479661d443f1	e6cb4fce-b11c-443c-a5e0-73afe1bcb113	d906603a-b681-49de-883d-4c8e445d7110	500.0000	6.000000	3000	65ba3532-046e-4f63-a16a-68524859f8cf	Ice cube	gram
6beeca85-920e-4505-b4fe-9c86e964faa6	fd9345c4-510f-421a-b918-479661d443f1	e6cb4fce-b11c-443c-a5e0-73afe1bcb113	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	15.0000	214.000000	3210	c221f4df-f7f2-4219-b027-e6cd4a7a80f4	Matcha	gram
9a141fa8-3f24-46c8-9b25-223af3baa22b	fd9345c4-510f-421a-b918-479661d443f1	aaddbef0-f2ec-4b5a-8b77-e52b830364a0	d8a13950-dee9-4fdd-a339-1e21e366f496	1.3000	1400.000000	1820	5eb71e54-52ba-46c4-a4ce-334b8c2b7357	Cup L	piece
a24f143a-8bf1-45e8-b59f-abd158ed70e1	fd9345c4-510f-421a-b918-479661d443f1	aaddbef0-f2ec-4b5a-8b77-e52b830364a0	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	15.0000	18.439716	277	f20bec97-5655-4da7-9cab-a945dbf31503	Simple syrup	gram
033945e5-e63a-41c1-ae19-db030bbac871	fd9345c4-510f-421a-b918-479661d443f1	aaddbef0-f2ec-4b5a-8b77-e52b830364a0	977c2dd1-1691-4f49-8599-64ea9e3846f1	60.0000	80.000000	4800	9c441772-8bde-4496-9a84-82c2c291b103	Creamer	gram
919ac741-6203-491e-a260-2f6525f8ac5e	fd9345c4-510f-421a-b918-479661d443f1	aaddbef0-f2ec-4b5a-8b77-e52b830364a0	6d14fad6-3ee7-4265-9a56-180d4c58c148	150.0000	20.000000	3000	8f0b83e7-2e3c-4a86-9cb2-e022976041a5	Fresh Milk	millilitre
e03da084-4915-49ed-9c25-2547f823ac0c	fd9345c4-510f-421a-b918-479661d443f1	aaddbef0-f2ec-4b5a-8b77-e52b830364a0	d906603a-b681-49de-883d-4c8e445d7110	500.0000	6.000000	3000	22b6b367-a420-48da-84b6-b10210ac7a11	Ice cube	gram
99dc1edb-1e5a-4ff8-94ed-b44505b04428	fd9345c4-510f-421a-b918-479661d443f1	aaddbef0-f2ec-4b5a-8b77-e52b830364a0	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	22.5000	214.000000	4815	365edf52-c499-4e7a-91a6-b46cb5900b3d	Matcha	gram
\.


--
-- Data for Name: order_line_modifiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_line_modifiers (id, order_line_id, modifier_option_id, modifier_name_snapshot, price_adjustment_snapshot, cogs_adjustment_snapshot) FROM stdin;
ba77f175-8b01-4719-b07f-9dcc304d3a40	160d9f95-69c6-43b2-9199-6af848e1e2ed	b0a6d4b5-0d09-4bd6-9b11-7e28922fcfdb	Egg	7000	0
da4511c2-9ceb-4524-94f5-fda026ebec6f	b8498e37-7c34-4b95-84a0-e39304335012	9ed147bb-ec5e-4b83-b698-c2fc01deffce	Large	7000	0
e4657446-b74c-4879-b830-4bf97fe25caf	f617f9f9-fa93-48fa-b4a0-76c097573294	9ed147bb-ec5e-4b83-b698-c2fc01deffce	Large	7000	0
0d4fac78-9fed-439d-8ee8-12601bc7722b	a385ef02-e482-45d8-b275-e91205e07eea	9ed147bb-ec5e-4b83-b698-c2fc01deffce	Large	7000	0
bb4c29fd-9a5e-4dfd-8a1c-3640e2075078	1ed46e07-3399-40a4-97c7-392dcb9d712c	9ed147bb-ec5e-4b83-b698-c2fc01deffce	Large	7000	0
\.


--
-- Data for Name: order_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_lines (id, order_id, menu_item_id, menu_item_variant_id, item_name_snapshot, variant_name_snapshot, quantity, unit_price_snapshot, line_total, cogs_snapshot, gross_profit_snapshot, notes, category_name_snapshot) FROM stdin;
0f949505-f744-4577-9364-3a9fda11491b	8fdfca84-46a9-4154-864c-c8ba736acd14	55843206-d1c1-4d49-b385-7edb575573e6	6ea3f072-91ea-4606-80fc-983dd0c7a05e	Es Batu	Regular	1	3000	3000	0	3000	\N	\N
14d532c4-565d-4744-b50f-1661c5f0ecf2	2927ecfc-c15a-434c-b0ba-ce053207851b	55843206-d1c1-4d49-b385-7edb575573e6	6ea3f072-91ea-4606-80fc-983dd0c7a05e	Es Batu	Regular	1	3000	3000	0	3000	\N	\N
30db1bca-91be-40bd-bbf9-5db583cf693a	851a2a4b-8bbd-410a-8ef5-7ce2bd067566	55843206-d1c1-4d49-b385-7edb575573e6	6ea3f072-91ea-4606-80fc-983dd0c7a05e	Es Batu	Regular	1	3000	3000	0	3000	\N	\N
b8498e37-7c34-4b95-84a0-e39304335012	43386ce2-95f2-4038-bd12-48c92c478980	37139bea-ffb9-4e0e-87d8-4229804c6bae	916d4164-43c5-44a2-8a9e-ab3a4092404f	java a	Regular	1	8000	8000	0	8000	\N	\N
160d9f95-69c6-43b2-9199-6af848e1e2ed	8fdfca84-46a9-4154-864c-c8ba736acd14	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	29000	29000	0	29000	\N	Snack
5c8f79a7-9e99-4c66-9a8e-0f6b227e7b1a	5695a532-1c04-496f-8498-0b27e3d82d20	6ab4d723-cdb2-4187-b50a-51edd640d5ae	522566a0-f3a0-479b-8637-b488829a7f29	Mie Goreng Ulang Tahun	Regular	1	27000	27000	0	27000	\N	Noodle
a5290fcc-f3fa-4119-b6d5-c174ccbb0086	12617950-f860-4154-948d-f25485cde92c	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	ada4b6c8-9ef2-477a-bb0e-4a020517fd0b	Mie Goreng	Original	1	15000	15000	0	15000	ahhaay	Noodle
2db25503-025c-4327-9549-7cea06966dec	2e78449e-6865-4e98-b1b6-e076fd161fc0	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	ada4b6c8-9ef2-477a-bb0e-4a020517fd0b	Mie Goreng	Original	1	15000	15000	4909	10091	\N	Noodle
2f1a4806-b648-4558-8c8a-575c7322cbd6	637f5df3-697a-4644-b827-e3fa8f43fc30	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	ada4b6c8-9ef2-477a-bb0e-4a020517fd0b	Mie Goreng	Original	10	15000	150000	49090	100910	\N	Noodle
e4c1627b-19fd-4497-8490-e0edbc6fe870	7c124622-584b-4778-8693-4a29a0f913f6	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	ada4b6c8-9ef2-477a-bb0e-4a020517fd0b	Mie Goreng	Original	15	15000	225000	73635	151365	\N	Noodle
c4256fb7-8f62-446e-84c5-2d05cfc31b7d	259ec4b9-759f-4434-b036-f92b3032d15e	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
d4006c78-0d1e-4b53-9925-93cf69a92fdc	259ec4b9-759f-4434-b036-f92b3032d15e	6ab4d723-cdb2-4187-b50a-51edd640d5ae	522566a0-f3a0-479b-8637-b488829a7f29	Mie Goreng Ulang Tahun	Regular	1	27000	27000	0	27000	\N	Noodle
5fc485b3-0b5c-4a43-9228-2c72ee566514	259ec4b9-759f-4434-b036-f92b3032d15e	3ea786b1-63a1-4eb6-8c1b-819916a27761	ae94b5da-1371-4bdb-9a3a-5b69aad9d696	Taiyaki Mix	Regular	1	24000	24000	0	24000	\N	Snack
bdf1b4cc-30ba-4d28-9413-489502bc0447	43386ce2-95f2-4038-bd12-48c92c478980	6ab4d723-cdb2-4187-b50a-51edd640d5ae	522566a0-f3a0-479b-8637-b488829a7f29	Mie Goreng Ulang Tahun	Regular	1	27000	27000	0	27000	\N	Noodle
36d4c798-6074-42ac-9a4b-df74c41cf208	a3693ec4-937a-4299-84bf-0d6f5145e557	55843206-d1c1-4d49-b385-7edb575573e6	6ea3f072-91ea-4606-80fc-983dd0c7a05e	Es Batu	Regular	1	3000	3000	0	3000	\N	\N
5dc2d0e9-2fbf-48d7-922b-d826b8031b2c	a065bff2-7977-4498-97c3-ee7304332a5c	1055f9a1-e494-46a6-81ec-66e94f90993c	58381b94-8e8d-4f50-a2ad-4b34be9f266f	Osaka Matcha	Regular	1	26000	26000	13362	12638	\N	Drink
3a7c4e39-c0fc-41e5-acb3-a72d2432640b	c7cfff97-909b-4107-aecd-ae4c284430f3	55843206-d1c1-4d49-b385-7edb575573e6	6ea3f072-91ea-4606-80fc-983dd0c7a05e	Es Batu	Regular	1	3000	3000	0	3000	\N	\N
8ad977de-120f-4e35-8a2d-77b0d146b96b	ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	ada4b6c8-9ef2-477a-bb0e-4a020517fd0b	Mie Goreng	Original	2	15000	30000	9818	20182	\N	Noodle
1e1e73ef-5a1b-47e1-8d25-b60576fa956f	ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	0c16cffd-a080-4cb0-9aad-bf643ea4a712	b2a53bae-ba9e-4da4-912c-37ea314880e5	Spicy Tori Curry Rice	Regular	1	32000	32000	0	32000	\N	Rice
7e89e2c5-0678-42f7-ae9e-8d650ba5b4a7	485fb670-ee95-451c-a338-5a6231e2baca	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
6fd1f270-a6f2-4050-8da7-07f5398fc124	97f79f7b-6d8d-4d72-98ab-06e8e0b2f050	6ab4d723-cdb2-4187-b50a-51edd640d5ae	522566a0-f3a0-479b-8637-b488829a7f29	Mie Goreng Ulang Tahun	Regular	1	27000	27000	0	27000	\N	Noodle
89f61945-2699-47d3-880b-bfaf3433195c	343b57e0-bb33-44d9-bc5b-cde9af9adc39	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
b8b331dc-1090-45bb-bceb-2ad9db594648	79233c23-242a-47d5-bc7c-d769bdc214b0	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
323c158b-a799-49fc-a941-5336c056e214	ee5686ee-0f25-43c3-a03d-9d57b0e68ac7	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
f617f9f9-fa93-48fa-b4a0-76c097573294	217d1d44-e5f8-4bd0-96cd-9f67b7b6d990	37139bea-ffb9-4e0e-87d8-4229804c6bae	916d4164-43c5-44a2-8a9e-ab3a4092404f	java a	Regular	1	8000	8000	0	8000	\N	\N
072cad71-f417-47c8-bf64-0efdbc77686c	7d49481b-fc34-4fcf-a36d-6bb9332324c6	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	ada4b6c8-9ef2-477a-bb0e-4a020517fd0b	Mie Goreng	Original	1	15000	15000	4909	10091	\N	Noodle
371ee340-7b32-4ac4-ba4b-d98d830ea9d0	746de8b3-e688-489e-a15e-c042994d9bbd	1055f9a1-e494-46a6-81ec-66e94f90993c	58381b94-8e8d-4f50-a2ad-4b34be9f266f	Osaka Matcha	Regular	1	26000	26000	13362	12638	\N	Drink
f20eedff-d6fc-4079-84a8-552e8c58a0c2	48d1cd40-4775-4ebc-b342-1a122bfd4862	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
5856eaa0-4d5c-4790-9b2e-949541f487f5	9f10ad6e-ad4e-48ea-9a32-fdf812c21d19	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
7881a6a3-18ec-4918-b695-702e64f09982	9f10ad6e-ad4e-48ea-9a32-fdf812c21d19	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	fba5ed55-1a6a-4c1e-8519-b4c5d6910ee2	Mie Goreng	Bangladesh	1	15000	15000	0	15000	\N	Noodle
bf23365c-5b12-4090-8617-fc7c38f5828a	f996398e-f339-40d6-8ef1-ad213751a667	55843206-d1c1-4d49-b385-7edb575573e6	6ea3f072-91ea-4606-80fc-983dd0c7a05e	Es Batu	Regular	1	3000	3000	0	3000	\N	\N
d3a14c87-22da-46ff-8fbb-2daebbacf078	d4d3b654-b55c-48fe-9c39-24840dafdfa4	1055f9a1-e494-46a6-81ec-66e94f90993c	58381b94-8e8d-4f50-a2ad-4b34be9f266f	Osaka Matcha	Regular	1	26000	26000	13362	12638	\N	Drink
5263f39e-2a1e-4599-90d8-66bab6cb732a	aa718ebc-b0d9-464b-a2fe-ead42925acd5	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
d8100c0f-973d-47cf-8784-15206a5eb419	ea097c26-d8c5-44c9-aa16-ffda556fa813	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
b0cac2f3-f03f-40aa-b66a-dea55bfb32e6	e5916d2a-9b5b-4564-916b-c73dcc67afbe	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
43e442dd-c1cc-4461-b584-e81b35b3b72c	f406ffea-b4a8-487e-8efd-a5e910376819	1055f9a1-e494-46a6-81ec-66e94f90993c	58381b94-8e8d-4f50-a2ad-4b34be9f266f	Osaka Matcha	Regular	1	26000	26000	13362	12638	\N	Drink
75a57164-658c-4800-9620-d3bc94da7453	5d5db5a3-c625-4407-a52b-9e5182d997c6	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
ded6f208-3b2b-4d72-a47e-4c9c55a005a9	cf08c9ab-789d-4277-a4f8-305d4a18f54f	0c16cffd-a080-4cb0-9aad-bf643ea4a712	b2a53bae-ba9e-4da4-912c-37ea314880e5	Spicy Tori Curry Rice	Regular	1	32000	32000	0	32000	\N	Rice
f6fbe194-cfd9-4cd1-93ca-481f6bbbe10d	cf08c9ab-789d-4277-a4f8-305d4a18f54f	d999f8dd-6e03-4a94-a307-1ed50696920d	626e3f5e-4979-4d13-96b2-eb3a0ac65942	Tamago Curry Rice	Regular	1	28000	28000	0	28000	\N	Rice
839348ba-2015-4438-8ed1-6931c67c2eb4	cf08c9ab-789d-4277-a4f8-305d4a18f54f	4d622ad0-94a8-4819-bdc1-ef9c41ffbeb2	7a1863af-a0a4-4835-9006-5f5c856a66fe	Taiyaki Biscoff	Regular	1	25000	25000	0	25000	\N	Snack
8354e7a2-49b6-41bd-ae32-e61beb0441f2	bbbed552-0d79-4f04-8211-ad82ea464274	0c16cffd-a080-4cb0-9aad-bf643ea4a712	b2a53bae-ba9e-4da4-912c-37ea314880e5	Spicy Tori Curry Rice	Regular	3	32000	96000	0	96000	\N	Rice
cb61b543-3d82-45a0-9bbf-3eb7e5ea99ee	f9a11b6f-d722-4c01-8e7a-67164869ff43	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
758308da-d7e5-4e9e-a40e-846215f696b9	edf257a3-9a8b-476e-b4fc-a34e00b63deb	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
9d4ac768-5404-49e3-8bba-912405da5de0	6e5b54f9-2a86-486b-87a4-00395b3d15d0	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
2732d1e2-7a92-43f7-89f9-922ec466d5e1	03be3215-8f21-4754-90ee-12e2e84d3922	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
d9e3bbc6-afb4-4ac0-8ef7-844cf19770bf	49652282-3bd7-40a9-9d78-c98e8da146bf	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
13884ada-888e-4315-9776-087e4948d1bf	0ecb73c6-9111-4580-8bc0-82ac64b41d4b	6ab4d723-cdb2-4187-b50a-51edd640d5ae	522566a0-f3a0-479b-8637-b488829a7f29	Mie Goreng Ulang Tahun	Regular	1	27000	27000	0	27000	\N	Noodle
b77eb14c-3a90-48d4-96be-af708557e4f2	9728cc46-902a-4e17-b6a7-542ec2061c97	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
6d9a5bd2-17fb-4757-b508-bf20db9ffb3c	ba1b48ef-a23f-4f3b-a4f8-0a185bdd45db	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
477d4be7-8a3f-4db4-bd95-caf64f5842b2	bccfb472-d0a4-4ba8-908e-e3ce7de94f9b	6ab4d723-cdb2-4187-b50a-51edd640d5ae	522566a0-f3a0-479b-8637-b488829a7f29	Mie Goreng Ulang Tahun	Regular	2	27000	54000	0	54000	\N	Noodle
f1fb25ab-0a7a-4cca-896a-c888a29d6314	bccfb472-d0a4-4ba8-908e-e3ce7de94f9b	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
bd5a0b71-0ae0-4208-8583-a99f8f8ac0b8	3faec035-4966-45b7-bb44-2583f1f3672e	6ab4d723-cdb2-4187-b50a-51edd640d5ae	522566a0-f3a0-479b-8637-b488829a7f29	Mie Goreng Ulang Tahun	Regular	1	27000	27000	0	27000	\N	Noodle
a9c26682-0c19-4811-b973-eceedfe6a9b4	7cd3570b-7cda-4d11-bb8e-99cd5b0542e3	55843206-d1c1-4d49-b385-7edb575573e6	6ea3f072-91ea-4606-80fc-983dd0c7a05e	Es Batu	Regular	1	3000	3000	0	3000	\N	\N
436760ef-d537-42f5-9b4e-cfc23e8d6c0c	559fa6ab-1764-4ff5-a375-9e0c20faef86	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
cccbce7d-fa78-48a2-8755-2662e42b2b2b	bab55c7a-45c4-4625-ad05-0101b0b14ce1	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
2f89fbc3-a1cb-4a03-8201-05e38c4a1c76	ff7085f8-ae37-4aa3-8dce-f32d7444660e	eba7ed0e-5990-4679-9eb9-27fb620f873d	6f5aff82-4fab-4e61-a1dd-b526223b611e	QA Sep16 Latte	Regular	3	30000	90000	16605	73395	\N	\N
df670721-4b5c-469a-b79a-7caaea16ead1	73f9fddb-97ea-462f-95f8-2f23ecebee30	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	ada4b6c8-9ef2-477a-bb0e-4a020517fd0b	Mie Goreng	Original	1	15000	15000	4799	10201	\N	Noodle
55645d84-c293-4e42-964b-57e7d1cdb4b1	73f9fddb-97ea-462f-95f8-2f23ecebee30	6ab4d723-cdb2-4187-b50a-51edd640d5ae	522566a0-f3a0-479b-8637-b488829a7f29	Mie Goreng Ulang Tahun	Regular	1	27000	27000	0	27000	\N	Noodle
cddf3abb-48e9-46bd-b45c-f2e444fa1f8b	73f9fddb-97ea-462f-95f8-2f23ecebee30	6a17c6c4-1575-48a9-8069-0ff871735152	c738ad70-2575-4b84-bf3b-25e864d26aea	Crispy Enoki	Regular	1	22000	22000	0	22000	\N	Snack
db2afba7-80fa-46f0-98c8-29ace2f78b3f	05ca4c83-0e32-4190-af14-a1f044e9f78b	eba7ed0e-5990-4679-9eb9-27fb620f873d	6f5aff82-4fab-4e61-a1dd-b526223b611e	QA Sep16 Latte	Regular	2	30000	60000	11400	48600	\N	\N
e6cb4fce-b11c-443c-a5e0-73afe1bcb113	fd9345c4-510f-421a-b918-479661d443f1	1055f9a1-e494-46a6-81ec-66e94f90993c	58381b94-8e8d-4f50-a2ad-4b34be9f266f	Osaka Matcha	Regular	1	26000	26000	13362	12638	\N	Drink
aaddbef0-f2ec-4b5a-8b77-e52b830364a0	fd9345c4-510f-421a-b918-479661d443f1	1055f9a1-e494-46a6-81ec-66e94f90993c	33724e05-3d2e-431f-bc47-2f549d1f8210	Osaka Matcha	Large	1	33000	33000	17712	15288	\N	Drink
a385ef02-e482-45d8-b275-e91205e07eea	fd9345c4-510f-421a-b918-479661d443f1	37139bea-ffb9-4e0e-87d8-4229804c6bae	916d4164-43c5-44a2-8a9e-ab3a4092404f	java a	Regular	1	8000	8000	0	8000	\N	\N
d638558f-3a0f-442a-9b1c-0c56c8bbfa8e	fd9345c4-510f-421a-b918-479661d443f1	a4ae43af-e8f7-4625-a7a4-ae7b14a14227	da3cfd7c-6331-4928-b9e0-c5c09173f807	Mie Goreng	Kriuk	1	15000	15000	0	15000	\N	Noodle
1ed46e07-3399-40a4-97c7-392dcb9d712c	62f3b819-4b89-4cb3-ac49-75a258e92bf5	37139bea-ffb9-4e0e-87d8-4229804c6bae	916d4164-43c5-44a2-8a9e-ab3a4092404f	java a	Regular	1	8000	8000	0	8000	\N	\N
d42b1f8b-a9b2-4d7a-bd33-8ce6806c1166	05435bdc-b661-42c4-bd90-ce83b9d5e6d7	55843206-d1c1-4d49-b385-7edb575573e6	6ea3f072-91ea-4606-80fc-983dd0c7a05e	Es Batu	Regular	1	3000	3000	0	3000	\N	\N
\.


--
-- Data for Name: order_number_counters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_number_counters (business_id, last_number, updated_at) FROM stdin;
99a43f10-309d-40d0-b266-57f43b9b070a	52	2026-09-18 02:59:40.651+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, business_id, location_id, order_number, status, order_type, table_label, subtotal, discount_total, tax_total, service_charge_total, total, cogs_total, gross_profit, gross_margin_percentage, payment_method_label, notes, idempotency_key, created_by, created_at, cancelled_at, cancelled_by, cancellation_reason, refunded_at, refunded_by, refund_reason, cash_received, change_due) FROM stdin;
8fdfca84-46a9-4154-864c-c8ba736acd14	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00001	SUBMITTED	dine_in	o	32000	5000	0	0	27000	0	27000	100.00	qris	\N	6e477a81-f176-4f66-91b1-fcce16f57e7e	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 08:59:52.555565+00	\N	\N	\N	\N	\N	\N	\N	\N
2927ecfc-c15a-434c-b0ba-ce053207851b	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00002	SUBMITTED	dine_in	\N	3000	0	0	0	3000	0	3000	100.00	qris	\N	4c14bf9c-b802-40d6-a82c-9a5fd172abf3	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:03:12.821395+00	\N	\N	\N	\N	\N	\N	\N	\N
5695a532-1c04-496f-8498-0b27e3d82d20	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00003	SUBMITTED	dine_in	\N	27000	0	0	0	27000	0	27000	100.00	cash	\N	2fa91565-53ae-4030-9724-bd701df268ca	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	2026-09-13 09:07:36.048653+00	\N	\N	\N	\N	\N	\N	\N	\N
851a2a4b-8bbd-410a-8ef5-7ce2bd067566	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00004	SUBMITTED	dine_in	\N	3000	0	0	0	3000	0	3000	100.00	qris	\N	35d67d29-6069-446b-8228-ef779c23d46d	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:26:02.788894+00	\N	\N	\N	\N	\N	\N	\N	\N
12617950-f860-4154-948d-f25485cde92c	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00005	SUBMITTED	dine_in	\N	15000	0	0	0	15000	0	15000	100.00	qris	\N	cdc5d672-60fa-4876-8612-6484db8b6c39	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:52:19.558061+00	\N	\N	\N	\N	\N	\N	\N	\N
2e78449e-6865-4e98-b1b6-e076fd161fc0	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00006	SUBMITTED	dine_in	\N	15000	0	0	0	15000	4909	10091	67.27	qris	\N	76d4b803-d4e8-452c-9bb8-5a99b7a0c898	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:53:35.216743+00	\N	\N	\N	\N	\N	\N	\N	\N
637f5df3-697a-4644-b827-e3fa8f43fc30	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00007	SUBMITTED	dine_in	\N	150000	0	0	0	150000	49090	100910	67.27	qris	\N	674683ff-a298-40cd-8f80-5a6aa2f766cc	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:54:25.617942+00	\N	\N	\N	\N	\N	\N	\N	\N
7c124622-584b-4778-8693-4a29a0f913f6	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00008	SUBMITTED	dine_in	\N	225000	0	0	0	225000	73635	151365	67.27	qris	\N	1d4917cf-d219-4276-adab-d07a7f839e7d	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:55:43.121495+00	\N	\N	\N	\N	\N	\N	\N	\N
259ec4b9-759f-4434-b036-f92b3032d15e	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00009	SUBMITTED	dine_in	\N	73000	0	0	0	73000	0	73000	100.00	cash	\N	fa16e015-173e-4e3f-ae34-d3646cc9cc22	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-13 10:28:31.402734+00	\N	\N	\N	\N	\N	\N	\N	\N
43386ce2-95f2-4038-bd12-48c92c478980	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00010	SUBMITTED	dine_in	\N	35000	0	0	0	35000	0	35000	100.00	qris	\N	ffe8f28e-f5c6-46b2-a517-4d2c8ca36190	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 10:52:19.183774+00	\N	\N	\N	\N	\N	\N	\N	\N
a3693ec4-937a-4299-84bf-0d6f5145e557	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00011	SUBMITTED	dine_in	\N	3000	0	0	0	3000	0	3000	100.00	cash	\N	486e6079-23bf-4f73-90b7-e34c895b5db5	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:30:31.504099+00	\N	\N	\N	\N	\N	\N	\N	\N
a065bff2-7977-4498-97c3-ee7304332a5c	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00012	SUBMITTED	dine_in	\N	26000	0	0	0	26000	13362	12638	48.61	cash	\N	7437dc34-62bd-48ec-9ac7-bd17ef5e8515	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:31:06.019554+00	\N	\N	\N	\N	\N	\N	\N	\N
c7cfff97-909b-4107-aecd-ae4c284430f3	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00013	SUBMITTED	dine_in	\N	3000	0	0	0	3000	0	3000	100.00	cash	\N	f9c616b0-98e5-475f-9964-df36210e78c7	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:31:58.232743+00	\N	\N	\N	\N	\N	\N	\N	\N
ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00014	SUBMITTED	dine_in	\N	62000	0	0	0	62000	9818	52182	84.16	cash	\N	bdfdcbd0-17c2-4f86-a275-c9e098895830	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:06:49.438107+00	\N	\N	\N	\N	\N	\N	\N	\N
485fb670-ee95-451c-a338-5a6231e2baca	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00015	SUBMITTED	dine_in	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	398125c8-c50d-4d04-a2b1-46e3c5286634	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:36:15.117752+00	\N	\N	\N	\N	\N	\N	\N	\N
97f79f7b-6d8d-4d72-98ab-06e8e0b2f050	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00016	SUBMITTED	dine_in	\N	27000	0	0	0	27000	0	27000	100.00	cash	\N	a4c0dbfe-fb38-4ea1-a451-91e276915c4d	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:36:42.533254+00	\N	\N	\N	\N	\N	\N	\N	\N
343b57e0-bb33-44d9-bc5b-cde9af9adc39	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00017	SUBMITTED	dine_in	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	aaeafca4-9907-4aee-b76c-3d7212989d53	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:37:05.700029+00	\N	\N	\N	\N	\N	\N	\N	\N
79233c23-242a-47d5-bc7c-d769bdc214b0	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00018	SUBMITTED	dine_in	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	06127fe7-fcf0-42c3-89d6-5cf991fe7e02	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:37:24.376591+00	\N	\N	\N	\N	\N	\N	\N	\N
ee5686ee-0f25-43c3-a03d-9d57b0e68ac7	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00019	SUBMITTED	dine_in	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	e36980e3-3587-4626-9047-3467d9b6d8ae	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:37:55.640974+00	\N	\N	\N	\N	\N	\N	\N	\N
217d1d44-e5f8-4bd0-96cd-9f67b7b6d990	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00020	SUBMITTED	dine_in	\N	8000	0	0	0	8000	0	8000	100.00	cash	\N	69a47fb2-6b7f-44d4-bf16-35fa4e883bbc	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:38:57.759869+00	\N	\N	\N	\N	\N	\N	\N	\N
7d49481b-fc34-4fcf-a36d-6bb9332324c6	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00021	SUBMITTED	dine_in	\N	15000	0	0	0	15000	4909	10091	67.27	cash	\N	6032938e-b8c6-4b4e-953e-28f5a8cbbfd2	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:24.431038+00	\N	\N	\N	\N	\N	\N	\N	\N
746de8b3-e688-489e-a15e-c042994d9bbd	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00022	SUBMITTED	dine_in	\N	26000	0	0	0	26000	13362	12638	48.61	cash	\N	7b025bc8-173e-4559-85fd-1a03a357cbea	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:37.502369+00	\N	\N	\N	\N	\N	\N	\N	\N
48d1cd40-4775-4ebc-b342-1a122bfd4862	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00023	SUBMITTED	dine_in	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	c70050f7-40b8-4f35-9bd7-8aaa811d58c3	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:41:12.062425+00	\N	\N	\N	\N	\N	\N	\N	\N
9f10ad6e-ad4e-48ea-9a32-fdf812c21d19	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00024	SUBMITTED	dine_in	\N	37000	0	0	0	37000	0	37000	100.00	qris	\N	16880bd1-08e8-40c0-a1b2-2db96a1df225	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:45:00.244635+00	\N	\N	\N	\N	\N	\N	\N	\N
f996398e-f339-40d6-8ef1-ad213751a667	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00025	SUBMITTED	dine_in	\N	3000	0	0	0	3000	0	3000	100.00	cash	\N	37f02e53-521e-404b-9142-26ef3525bd4b	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:46:38.099379+00	\N	\N	\N	\N	\N	\N	\N	\N
d4d3b654-b55c-48fe-9c39-24840dafdfa4	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00026	SUBMITTED	dine_in	\N	26000	0	0	0	26000	13362	12638	48.61	cash	\N	daf187e4-f1a9-4231-89fb-0596219da5b0	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:46:54.066326+00	\N	\N	\N	\N	\N	\N	\N	\N
aa718ebc-b0d9-464b-a2fe-ead42925acd5	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00027	SUBMITTED	dine_in	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	072389c5-8474-4e8a-832a-2989f76b53a8	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:09:08.099762+00	\N	\N	\N	\N	\N	\N	\N	\N
ea097c26-d8c5-44c9-aa16-ffda556fa813	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00028	SUBMITTED	dine_in	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	3c769809-6ef1-48ad-8bd7-4f8039ab5378	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:09:51.934024+00	\N	\N	\N	\N	\N	\N	\N	\N
e5916d2a-9b5b-4564-916b-c73dcc67afbe	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00029	SUBMITTED	takeaway	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	f70b0ff6-94cf-45a2-8ae6-53ff8235170d	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:13:41.525808+00	\N	\N	\N	\N	\N	\N	\N	\N
f406ffea-b4a8-487e-8efd-a5e910376819	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00030	SUBMITTED	takeaway	\N	26000	0	0	0	26000	13362	12638	48.61	cash	\N	c37dcdfa-1b5d-48ed-8e61-75a69ff45ee2	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:14:54.06537+00	\N	\N	\N	\N	\N	\N	\N	\N
5d5db5a3-c625-4407-a52b-9e5182d997c6	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00031	SUBMITTED	dine_in	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	d727895e-fa34-482a-ae98-7a8afb70eb1f	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-15 12:15:28.035372+00	\N	\N	\N	\N	\N	\N	\N	\N
cf08c9ab-789d-4277-a4f8-305d4a18f54f	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00032	SUBMITTED	dine_in	\N	85000	0	0	0	85000	0	85000	100.00	cash	\N	2a3e3f19-3090-4fb5-a907-3f59628d51f7	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:50:47.107563+00	\N	\N	\N	\N	\N	\N	100000	15000
bbbed552-0d79-4f04-8211-ad82ea464274	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00033	SUBMITTED	dine_in	\N	96000	0	0	0	96000	0	96000	100.00	cash	\N	df84e3b6-f1ad-40fb-b091-78afa81d2671	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:52:11.727132+00	\N	\N	\N	\N	\N	\N	100000	4000
f9a11b6f-d722-4c01-8e7a-67164869ff43	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00034	SUBMITTED	takeaway	\N	22000	0	0	0	22000	0	22000	100.00	card (Mandiri)	\N	cf0e5c94-e130-4749-8b75-4cf9f6fe3c8d	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:59:18.069848+00	\N	\N	\N	\N	\N	\N	\N	\N
edf257a3-9a8b-476e-b4fc-a34e00b63deb	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00035	SUBMITTED	takeaway	\N	22000	0	0	0	22000	0	22000	100.00	card (Mandiri)	\N	9bd662bb-eef1-4eb5-a92f-d8aa87604880	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:00:41.354505+00	\N	\N	\N	\N	\N	\N	\N	\N
6e5b54f9-2a86-486b-87a4-00395b3d15d0	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00036	SUBMITTED	takeaway	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	cb931dff-34c2-4470-bf9d-c8c51972cbff	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:01:31.335815+00	\N	\N	\N	\N	\N	\N	100000	78000
03be3215-8f21-4754-90ee-12e2e84d3922	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00037	SUBMITTED	takeaway	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	7b1d9997-00f6-48a2-9d24-8433a266b906	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:02:55.738128+00	\N	\N	\N	\N	\N	\N	50000	28000
49652282-3bd7-40a9-9d78-c98e8da146bf	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00038	SUBMITTED	takeaway	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	5235dca5-3343-4dd8-9d8e-97f8e1dd1ecb	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:03:41.178312+00	\N	\N	\N	\N	\N	\N	50000	28000
0ecb73c6-9111-4580-8bc0-82ac64b41d4b	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00039	SUBMITTED	takeaway	\N	27000	0	0	0	27000	0	27000	100.00	qris	\N	277738bd-3f47-4975-ae27-ed0cc11ae5e0	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:04:00.66508+00	\N	\N	\N	\N	\N	\N	\N	\N
9728cc46-902a-4e17-b6a7-542ec2061c97	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00040	SUBMITTED	takeaway	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	9fbf7323-4e0b-45ec-9d62-e2442cb0cc33	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:06:41.517061+00	\N	\N	\N	\N	\N	\N	120000	98000
ba1b48ef-a23f-4f3b-a4f8-0a185bdd45db	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00041	SUBMITTED	takeaway	\N	22000	0	0	0	22000	0	22000	100.00	cash	\N	b784edba-e367-4260-91c8-ed6d21788f3b	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:12:40.246484+00	\N	\N	\N	\N	\N	\N	100000	78000
bccfb472-d0a4-4ba8-908e-e3ce7de94f9b	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00042	SUBMITTED	takeaway	\N	76000	0	0	0	76000	0	76000	100.00	card (BRI)	\N	a2996e7b-9562-4d19-b2f2-64657f0a71e4	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:31:40.252256+00	\N	\N	\N	\N	\N	\N	\N	\N
3faec035-4966-45b7-bb44-2583f1f3672e	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00043	SUBMITTED	takeaway	\N	27000	0	0	0	27000	0	27000	100.00	card (BRI)	\N	9e740e2e-7718-48be-b806-0fef6c6f3d33	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:32:18.356971+00	\N	\N	\N	\N	\N	\N	\N	\N
7cd3570b-7cda-4d11-bb8e-99cd5b0542e3	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00044	SUBMITTED	takeaway	\N	3000	0	0	0	3000	0	3000	100.00	card (BRI)	\N	5b9c8125-9c11-492c-a5fe-d0a913823725	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:33:50.311754+00	\N	\N	\N	\N	\N	\N	\N	\N
559fa6ab-1764-4ff5-a375-9e0c20faef86	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00045	SUBMITTED	takeaway	\N	22000	0	0	0	22000	0	22000	100.00	card (BRI)	\N	88e73128-9f40-4901-b4a2-3d37ba387a19	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:37:20.74997+00	\N	\N	\N	\N	\N	\N	\N	\N
bab55c7a-45c4-4625-ad05-0101b0b14ce1	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00046	SUBMITTED	takeaway	\N	22000	0	0	0	22000	0	22000	100.00	qris	\N	d440210e-8709-4d22-916a-ea46d57c0b05	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:43:49.038542+00	\N	\N	\N	\N	\N	\N	\N	\N
73f9fddb-97ea-462f-95f8-2f23ecebee30	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00048	SUBMITTED	dine_in	\N	64000	0	0	0	64000	4799	59201	92.50	cash	\N	81ee7702-0e91-4fc0-8ba4-f56d05bb8899	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:34:58.138822+00	\N	\N	\N	\N	\N	\N	100000	36000
ff7085f8-ae37-4aa3-8dce-f32d7444660e	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00047	CANCELLED	takeaway	QA Sep16 stock verification	90000	0	0	0	90000	16605	73395	81.55	cash	\N	7191877c-da80-492f-be3d-a9d4e6b3fd14	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 08:03:44.464032+00	2026-09-16 11:55:29.82+00	b087e36c-b8af-40dc-a541-b9a90de7db6e	QA Sep16 verify original stock reversal after recipe change	\N	\N	\N	100000	10000
05ca4c83-0e32-4190-af14-a1f044e9f78b	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00049	SUBMITTED	dine_in	QA Sep16 revised recipe and discount	60000	5000	0	0	55000	11400	43600	79.27	cash	\N	f89e509b-d7ca-42e5-84f4-6f7afde6021e	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:59:18.512855+00	\N	\N	\N	\N	\N	\N	100000	45000
fd9345c4-510f-421a-b918-479661d443f1	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00050	SUBMITTED	dine_in	\N	82000	0	0	0	82000	31074	50926	62.10	card (BCA)	\N	a7d4b672-5ea3-45d6-a9fe-6cb247cb32ee	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	\N	\N	\N	\N	\N	\N	\N	\N
62f3b819-4b89-4cb3-ac49-75a258e92bf5	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00051	SUBMITTED	dine_in	\N	8000	0	0	0	8000	0	8000	100.00	cash	\N	96256a77-3e77-4afd-8a1d-1b1a3f804637	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	2026-09-17 08:37:08.908192+00	\N	\N	\N	\N	\N	\N	8000	0
05435bdc-b661-42c4-bd90-ce83b9d5e6d7	99a43f10-309d-40d0-b266-57f43b9b070a	\N	MTS-00052	SUBMITTED	dine_in	\N	3000	0	0	0	3000	0	3000	100.00	cash	\N	066de35d-bbe7-43a3-898c-453b6eb7bdfa	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-18 02:59:40.628304+00	\N	\N	\N	\N	\N	\N	3000	0
\.


--
-- Data for Name: print_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.print_jobs (id, order_id, destination, provider, status, attempt_count, payload_snapshot, last_error, requested_by, created_at, processed_at, printed_at, request_key, claim_token, lease_expires_at) FROM stdin;
b01a4290-5847-4cde-8b8d-1166ec9bfcde	8fdfca84-46a9-4154-864c-c8ba736acd14	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 29000, "modifiers": ["Egg"], "unitPrice": 29000, "variantName": "Regular"}, {"name": "Es Batu", "quantity": 1, "lineTotal": 3000, "modifiers": [], "unitPrice": 3000, "variantName": "Regular"}], "total": 27000, "orderId": "8fdfca84-46a9-4154-864c-c8ba736acd14", "discount": 5000, "subtotal": 32000, "createdAt": "2026-09-13T08:59:52.555Z", "orderType": "dine_in", "tableLabel": "o", "orderNumber": "MTS-00001", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 08:59:52.555565+00	2026-09-13 08:59:52.673+00	2026-09-13 08:59:52.679+00	\N	\N	\N
fe1cf251-f698-48f4-905a-40dc32e3bc29	12617950-f860-4154-948d-f25485cde92c	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng", "note": "ahhaay", "quantity": 1, "lineTotal": 15000, "modifiers": [], "unitPrice": 15000, "variantName": "Original"}], "total": 15000, "orderId": "12617950-f860-4154-948d-f25485cde92c", "discount": 0, "subtotal": 15000, "createdAt": "2026-09-13T09:52:19.558Z", "orderType": "dine_in", "orderNumber": "MTS-00005", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:52:19.558061+00	2026-09-13 09:52:19.65+00	2026-09-13 09:52:19.665+00	\N	\N	\N
671b0870-e2e3-44bd-b35b-11b68e0eaff9	2927ecfc-c15a-434c-b0ba-ce053207851b	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Es Batu", "quantity": 1, "lineTotal": 3000, "modifiers": [], "unitPrice": 3000, "variantName": "Regular"}], "total": 3000, "orderId": "2927ecfc-c15a-434c-b0ba-ce053207851b", "discount": 0, "subtotal": 3000, "createdAt": "2026-09-13T09:03:12.821Z", "orderType": "dine_in", "orderNumber": "MTS-00002", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:03:12.821395+00	2026-09-13 09:03:12.905+00	2026-09-13 09:03:12.908+00	\N	\N	\N
55b2ed01-fc0d-4710-b25e-eba081cf64d1	5695a532-1c04-496f-8498-0b27e3d82d20	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng Ulang Tahun", "quantity": 1, "lineTotal": 27000, "modifiers": [], "unitPrice": 27000, "variantName": "Regular"}], "total": 27000, "orderId": "5695a532-1c04-496f-8498-0b27e3d82d20", "discount": 0, "subtotal": 27000, "createdAt": "2026-09-13T09:07:36.048Z", "orderType": "dine_in", "orderNumber": "MTS-00003", "locationName": "Matsudon"}	\N	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	2026-09-13 09:07:36.048653+00	2026-09-13 09:07:36.138+00	2026-09-13 09:07:36.143+00	\N	\N	\N
61a0f4d5-63d4-45fb-ae53-d9922752f397	259ec4b9-759f-4434-b036-f92b3032d15e	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}, {"name": "Mie Goreng Ulang Tahun", "quantity": 1, "lineTotal": 27000, "modifiers": [], "unitPrice": 27000, "variantName": "Regular"}, {"name": "Taiyaki Mix", "quantity": 1, "lineTotal": 24000, "modifiers": [], "unitPrice": 24000, "variantName": "Regular"}], "total": 73000, "orderId": "259ec4b9-759f-4434-b036-f92b3032d15e", "discount": 0, "subtotal": 73000, "createdAt": "2026-09-13T10:28:31.402Z", "orderType": "dine_in", "orderNumber": "MTS-00009", "locationName": "Matsudon"}	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-13 10:28:31.402734+00	2026-09-13 10:28:31.471+00	2026-09-13 10:28:31.476+00	\N	\N	\N
6662196f-b870-416a-bf8a-b010b0b50de1	851a2a4b-8bbd-410a-8ef5-7ce2bd067566	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Es Batu", "quantity": 1, "lineTotal": 3000, "modifiers": [], "unitPrice": 3000, "variantName": "Regular"}], "total": 3000, "orderId": "851a2a4b-8bbd-410a-8ef5-7ce2bd067566", "discount": 0, "subtotal": 3000, "createdAt": "2026-09-13T09:26:02.788Z", "orderType": "dine_in", "orderNumber": "MTS-00004", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:26:02.788894+00	2026-09-13 09:26:02.897+00	2026-09-13 09:26:02.904+00	\N	\N	\N
6e1a27fa-f315-4295-ad8d-94e6ee5a8b28	2e78449e-6865-4e98-b1b6-e076fd161fc0	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng", "quantity": 1, "lineTotal": 15000, "modifiers": [], "unitPrice": 15000, "variantName": "Original"}], "total": 15000, "orderId": "2e78449e-6865-4e98-b1b6-e076fd161fc0", "discount": 0, "subtotal": 15000, "createdAt": "2026-09-13T09:53:35.216Z", "orderType": "dine_in", "orderNumber": "MTS-00006", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:53:35.216743+00	2026-09-13 09:53:35.342+00	2026-09-13 09:53:35.346+00	\N	\N	\N
0c2a4704-bebd-422f-8555-0c9832d387a0	7c124622-584b-4778-8693-4a29a0f913f6	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng", "quantity": 15, "lineTotal": 225000, "modifiers": [], "unitPrice": 15000, "variantName": "Original"}], "total": 225000, "orderId": "7c124622-584b-4778-8693-4a29a0f913f6", "discount": 0, "subtotal": 225000, "createdAt": "2026-09-13T09:55:43.121Z", "orderType": "dine_in", "orderNumber": "MTS-00008", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:55:43.121495+00	2026-09-13 09:55:43.258+00	2026-09-13 09:55:43.265+00	\N	\N	\N
722db45a-08c6-4ea7-bdcb-1429b41e6b5c	637f5df3-697a-4644-b827-e3fa8f43fc30	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng", "quantity": 10, "lineTotal": 150000, "modifiers": [], "unitPrice": 15000, "variantName": "Original"}], "total": 150000, "orderId": "637f5df3-697a-4644-b827-e3fa8f43fc30", "discount": 0, "subtotal": 150000, "createdAt": "2026-09-13T09:54:25.617Z", "orderType": "dine_in", "orderNumber": "MTS-00007", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:54:25.617942+00	2026-09-13 09:54:25.729+00	2026-09-13 09:54:25.733+00	\N	\N	\N
7d5092b2-a989-4fec-a797-2425a15b4f6d	43386ce2-95f2-4038-bd12-48c92c478980	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng Ulang Tahun", "quantity": 1, "lineTotal": 27000, "modifiers": [], "unitPrice": 27000, "variantName": "Regular"}, {"name": "java a", "quantity": 1, "lineTotal": 8000, "modifiers": ["Large"], "unitPrice": 8000, "variantName": "Regular"}], "total": 35000, "orderId": "43386ce2-95f2-4038-bd12-48c92c478980", "discount": 0, "subtotal": 35000, "createdAt": "2026-09-13T10:52:19.183Z", "orderType": "dine_in", "orderNumber": "MTS-00010", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 10:52:19.183774+00	2026-09-13 10:52:19.288+00	2026-09-13 10:52:19.292+00	\N	\N	\N
a5d78bcb-5098-4620-87a3-a88b42bc282d	a3693ec4-937a-4299-84bf-0d6f5145e557	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Es Batu", "quantity": 1, "lineTotal": 3000, "modifiers": [], "unitPrice": 3000, "variantName": "Regular"}], "total": 3000, "orderId": "a3693ec4-937a-4299-84bf-0d6f5145e557", "discount": 0, "subtotal": 3000, "createdAt": "2026-09-15T10:30:31.504Z", "orderType": "dine_in", "orderNumber": "MTS-00011", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:30:31.504099+00	2026-09-15 10:30:31.621+00	2026-09-15 10:30:31.626+00	\N	\N	\N
a357fa4d-1504-44ab-896d-2e28a8da2ec0	6e5b54f9-2a86-486b-87a4-00395b3d15d0	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "6e5b54f9-2a86-486b-87a4-00395b3d15d0", "discount": 0, "subtotal": 22000, "changeDue": 78000, "createdAt": "2026-09-15T13:01:31.335Z", "orderType": "takeaway", "orderNumber": "MTS-00036", "cashReceived": 100000, "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:01:31.335815+00	2026-09-15 13:01:31.369+00	2026-09-15 13:01:31.372+00	\N	\N	\N
5a63b3e3-969f-4885-838e-85f99e025546	a065bff2-7977-4498-97c3-ee7304332a5c	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Osaka Matcha", "quantity": 1, "lineTotal": 26000, "modifiers": [], "unitPrice": 26000, "variantName": "Regular"}], "total": 26000, "orderId": "a065bff2-7977-4498-97c3-ee7304332a5c", "discount": 0, "subtotal": 26000, "createdAt": "2026-09-15T10:31:06.019Z", "orderType": "dine_in", "orderNumber": "MTS-00012", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:31:06.019554+00	2026-09-15 10:31:06.137+00	2026-09-15 10:31:06.14+00	\N	\N	\N
78add236-d233-4db6-9615-c171fae74175	c7cfff97-909b-4107-aecd-ae4c284430f3	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Es Batu", "quantity": 1, "lineTotal": 3000, "modifiers": [], "unitPrice": 3000, "variantName": "Regular"}], "total": 3000, "orderId": "c7cfff97-909b-4107-aecd-ae4c284430f3", "discount": 0, "subtotal": 3000, "createdAt": "2026-09-15T10:31:58.232Z", "orderType": "dine_in", "orderNumber": "MTS-00013", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 10:31:58.232743+00	2026-09-15 10:31:58.302+00	2026-09-15 10:31:58.306+00	\N	\N	\N
e1f774cc-54b2-4168-8727-888a4fd82a75	03be3215-8f21-4754-90ee-12e2e84d3922	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "03be3215-8f21-4754-90ee-12e2e84d3922", "discount": 0, "subtotal": 22000, "changeDue": 28000, "createdAt": "2026-09-15T13:02:55.738Z", "orderType": "takeaway", "orderNumber": "MTS-00037", "cashReceived": 50000, "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:02:55.738128+00	2026-09-15 13:02:55.777+00	2026-09-15 13:02:55.781+00	\N	\N	\N
df216939-bcb0-4123-bb58-45efde0147e8	ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng", "quantity": 2, "lineTotal": 30000, "modifiers": [], "unitPrice": 15000, "variantName": "Original"}, {"name": "Spicy Tori Curry Rice", "quantity": 1, "lineTotal": 32000, "modifiers": [], "unitPrice": 32000, "variantName": "Regular"}], "total": 62000, "orderId": "ca0cb3d0-5bb1-4036-8922-f26ff9bcc7cd", "discount": 0, "subtotal": 62000, "createdAt": "2026-09-15T11:06:49.438Z", "orderType": "dine_in", "orderNumber": "MTS-00014", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:06:49.438107+00	2026-09-15 11:06:49.531+00	2026-09-15 11:06:49.535+00	\N	\N	\N
1c8c17b2-0598-4a62-afb7-4e81df516847	49652282-3bd7-40a9-9d78-c98e8da146bf	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "49652282-3bd7-40a9-9d78-c98e8da146bf", "discount": 0, "subtotal": 22000, "changeDue": 28000, "createdAt": "2026-09-15T13:03:41.178Z", "orderType": "takeaway", "orderNumber": "MTS-00038", "cashReceived": 50000, "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:03:41.178312+00	2026-09-15 13:03:41.213+00	2026-09-15 13:03:41.217+00	\N	\N	\N
caa2e6cb-0b76-4f31-811a-a6c056e4db38	485fb670-ee95-451c-a338-5a6231e2baca	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "485fb670-ee95-451c-a338-5a6231e2baca", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T11:36:15.117Z", "orderType": "dine_in", "orderNumber": "MTS-00015", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:36:15.117752+00	2026-09-15 11:36:15.225+00	2026-09-15 11:36:15.231+00	\N	\N	\N
14c993d1-649d-44c7-a6fa-5d5d615d792a	97f79f7b-6d8d-4d72-98ab-06e8e0b2f050	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng Ulang Tahun", "quantity": 1, "lineTotal": 27000, "modifiers": [], "unitPrice": 27000, "variantName": "Regular"}], "total": 27000, "orderId": "97f79f7b-6d8d-4d72-98ab-06e8e0b2f050", "discount": 0, "subtotal": 27000, "createdAt": "2026-09-15T11:36:42.533Z", "orderType": "dine_in", "orderNumber": "MTS-00016", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:36:42.533254+00	2026-09-15 11:36:42.621+00	2026-09-15 11:36:42.626+00	\N	\N	\N
1e8307ac-61c6-48eb-a1e6-ee1320dfe87d	0ecb73c6-9111-4580-8bc0-82ac64b41d4b	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng Ulang Tahun", "quantity": 1, "lineTotal": 27000, "modifiers": [], "unitPrice": 27000, "variantName": "Regular"}], "total": 27000, "orderId": "0ecb73c6-9111-4580-8bc0-82ac64b41d4b", "discount": 0, "subtotal": 27000, "createdAt": "2026-09-15T13:04:00.665Z", "orderType": "takeaway", "orderNumber": "MTS-00039", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:04:00.66508+00	2026-09-15 13:04:00.688+00	2026-09-15 13:04:00.691+00	\N	\N	\N
eb06aa11-a8ff-4be9-85cb-eeca56612004	343b57e0-bb33-44d9-bc5b-cde9af9adc39	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "343b57e0-bb33-44d9-bc5b-cde9af9adc39", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T11:37:05.700Z", "orderType": "dine_in", "orderNumber": "MTS-00017", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:37:05.700029+00	2026-09-15 11:37:05.794+00	2026-09-15 11:37:05.799+00	\N	\N	\N
eb8b3305-887c-48e7-a9f1-289a58cff3e0	9728cc46-902a-4e17-b6a7-542ec2061c97	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "9728cc46-902a-4e17-b6a7-542ec2061c97", "discount": 0, "subtotal": 22000, "changeDue": 98000, "createdAt": "2026-09-15T13:06:41.517Z", "orderType": "takeaway", "orderNumber": "MTS-00040", "cashReceived": 120000, "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:06:41.517061+00	2026-09-15 13:06:41.568+00	2026-09-15 13:06:41.573+00	\N	\N	\N
ba042922-d922-4029-b8aa-b5785f4f3f81	79233c23-242a-47d5-bc7c-d769bdc214b0	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "79233c23-242a-47d5-bc7c-d769bdc214b0", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T11:37:24.376Z", "orderType": "dine_in", "orderNumber": "MTS-00018", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:37:24.376591+00	2026-09-15 11:37:24.466+00	2026-09-15 11:37:24.47+00	\N	\N	\N
7c827c2b-d494-4eb7-bee8-cba6b7830fdf	ee5686ee-0f25-43c3-a03d-9d57b0e68ac7	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "ee5686ee-0f25-43c3-a03d-9d57b0e68ac7", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T11:37:55.640Z", "orderType": "dine_in", "orderNumber": "MTS-00019", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:37:55.640974+00	2026-09-15 11:37:55.739+00	2026-09-15 11:37:55.744+00	\N	\N	\N
9b09e873-ff6c-417a-bc9a-90eb7fc78ccd	ba1b48ef-a23f-4f3b-a4f8-0a185bdd45db	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "ba1b48ef-a23f-4f3b-a4f8-0a185bdd45db", "discount": 0, "subtotal": 22000, "changeDue": 78000, "createdAt": "2026-09-15T13:12:40.246Z", "orderType": "takeaway", "orderNumber": "MTS-00041", "cashReceived": 100000, "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:12:40.246484+00	2026-09-15 13:12:40.296+00	2026-09-15 13:12:40.301+00	\N	\N	\N
60c31a86-d67d-4b48-8b65-b02e455ebca5	217d1d44-e5f8-4bd0-96cd-9f67b7b6d990	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "java a", "quantity": 1, "lineTotal": 8000, "modifiers": ["Large"], "unitPrice": 8000, "variantName": "Regular"}], "total": 8000, "orderId": "217d1d44-e5f8-4bd0-96cd-9f67b7b6d990", "discount": 0, "subtotal": 8000, "createdAt": "2026-09-15T11:38:57.759Z", "orderType": "dine_in", "orderNumber": "MTS-00020", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:38:57.759869+00	2026-09-15 11:38:57.869+00	2026-09-15 11:38:57.874+00	\N	\N	\N
98f28314-da93-4e4c-be58-fc6de2705d69	7cd3570b-7cda-4d11-bb8e-99cd5b0542e3	CUSTOMER_RECEIPT	device	PRINTED	1	{"tax": 0, "lines": [{"name": "Es Batu", "quantity": 1, "lineTotal": 3000, "modifiers": [], "unitPrice": 3000, "variantName": "Regular"}], "total": 3000, "orderId": "7cd3570b-7cda-4d11-bb8e-99cd5b0542e3", "discount": 0, "subtotal": 3000, "createdAt": "2026-09-15T13:33:50.311Z", "orderType": "takeaway", "orderNumber": "MTS-00044", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:33:50.311754+00	2026-09-15 13:33:50.424+00	2026-09-15 13:33:52.28+00	\N	\N	\N
efa1d64c-1f2e-405a-940d-4ce1d4fe2df4	7d49481b-fc34-4fcf-a36d-6bb9332324c6	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng", "quantity": 1, "lineTotal": 15000, "modifiers": [], "unitPrice": 15000, "variantName": "Original"}], "total": 15000, "orderId": "7d49481b-fc34-4fcf-a36d-6bb9332324c6", "discount": 0, "subtotal": 15000, "createdAt": "2026-09-15T11:39:24.431Z", "orderType": "dine_in", "orderNumber": "MTS-00021", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:24.431038+00	2026-09-15 11:39:24.532+00	2026-09-15 11:39:24.537+00	\N	\N	\N
84f91bff-1319-461f-b11e-52f486b4fbff	746de8b3-e688-489e-a15e-c042994d9bbd	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Osaka Matcha", "quantity": 1, "lineTotal": 26000, "modifiers": [], "unitPrice": 26000, "variantName": "Regular"}], "total": 26000, "orderId": "746de8b3-e688-489e-a15e-c042994d9bbd", "discount": 0, "subtotal": 26000, "createdAt": "2026-09-15T11:39:37.502Z", "orderType": "dine_in", "orderNumber": "MTS-00022", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:39:37.502369+00	2026-09-15 11:39:37.601+00	2026-09-15 11:39:37.605+00	\N	\N	\N
c9d5ca95-0e29-4a59-b01c-d8ebe1a2f1a2	48d1cd40-4775-4ebc-b342-1a122bfd4862	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "48d1cd40-4775-4ebc-b342-1a122bfd4862", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T11:41:12.062Z", "orderType": "dine_in", "orderNumber": "MTS-00023", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:41:12.062425+00	2026-09-15 11:41:12.144+00	2026-09-15 11:41:12.147+00	\N	\N	\N
0bc6d7f5-f9fe-42b3-84d8-1d8d8697bba8	9f10ad6e-ad4e-48ea-9a32-fdf812c21d19	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}, {"name": "Mie Goreng", "quantity": 1, "lineTotal": 15000, "modifiers": [], "unitPrice": 15000, "variantName": "Bangladesh"}], "total": 37000, "orderId": "9f10ad6e-ad4e-48ea-9a32-fdf812c21d19", "discount": 0, "subtotal": 37000, "createdAt": "2026-09-15T11:45:00.244Z", "orderType": "dine_in", "orderNumber": "MTS-00024", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:45:00.244635+00	2026-09-15 11:45:00.342+00	2026-09-15 11:45:00.348+00	\N	\N	\N
1828ca3f-6e61-484a-8515-36d06c140dc0	f996398e-f339-40d6-8ef1-ad213751a667	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Es Batu", "quantity": 1, "lineTotal": 3000, "modifiers": [], "unitPrice": 3000, "variantName": "Regular"}], "total": 3000, "orderId": "f996398e-f339-40d6-8ef1-ad213751a667", "discount": 0, "subtotal": 3000, "createdAt": "2026-09-15T11:46:38.099Z", "orderType": "dine_in", "orderNumber": "MTS-00025", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:46:38.099379+00	2026-09-15 11:46:38.191+00	2026-09-15 11:46:38.196+00	\N	\N	\N
013d11a4-1b02-4f42-a018-76e6193d1c43	d4d3b654-b55c-48fe-9c39-24840dafdfa4	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Osaka Matcha", "quantity": 1, "lineTotal": 26000, "modifiers": [], "unitPrice": 26000, "variantName": "Regular"}], "total": 26000, "orderId": "d4d3b654-b55c-48fe-9c39-24840dafdfa4", "discount": 0, "subtotal": 26000, "createdAt": "2026-09-15T11:46:54.066Z", "orderType": "dine_in", "orderNumber": "MTS-00026", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:46:54.066326+00	2026-09-15 11:46:54.181+00	2026-09-15 11:46:54.186+00	\N	\N	\N
362fb13b-6a18-4b24-977e-326e573eccb6	a065bff2-7977-4498-97c3-ee7304332a5c	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Osaka Matcha", "quantity": 1, "lineTotal": 26000, "modifiers": [], "unitPrice": 26000, "variantName": "Regular"}], "total": 26000, "orderId": "a065bff2-7977-4498-97c3-ee7304332a5c", "discount": 0, "subtotal": 26000, "createdAt": "2026-09-15T10:31:06.019Z", "orderType": "dine_in", "orderNumber": "MTS-00012", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 11:49:10.984788+00	2026-09-15 11:49:11.038+00	2026-09-15 11:49:11.042+00	990f5fdc-d372-448e-b9c1-7be9175a40ee	\N	\N
653a770a-bd6f-406c-af54-b00a2b39e7b5	aa718ebc-b0d9-464b-a2fe-ead42925acd5	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "aa718ebc-b0d9-464b-a2fe-ead42925acd5", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T12:09:08.099Z", "orderType": "dine_in", "orderNumber": "MTS-00027", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:09:08.099762+00	2026-09-15 12:09:08.194+00	2026-09-15 12:09:08.198+00	\N	\N	\N
d50d301c-18ec-4a2e-83cc-dfde1ce2513f	ea097c26-d8c5-44c9-aa16-ffda556fa813	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "ea097c26-d8c5-44c9-aa16-ffda556fa813", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T12:09:51.934Z", "orderType": "dine_in", "orderNumber": "MTS-00028", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:09:51.934024+00	2026-09-15 12:09:52.03+00	2026-09-15 12:09:52.035+00	\N	\N	\N
9bcbefe5-ab34-40a2-89e2-7ad1558b2655	bccfb472-d0a4-4ba8-908e-e3ce7de94f9b	CUSTOMER_RECEIPT	device	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng Ulang Tahun", "quantity": 2, "lineTotal": 54000, "modifiers": [], "unitPrice": 27000, "variantName": "Regular"}, {"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 76000, "orderId": "bccfb472-d0a4-4ba8-908e-e3ce7de94f9b", "discount": 0, "subtotal": 76000, "createdAt": "2026-09-15T13:31:40.252Z", "orderType": "takeaway", "orderNumber": "MTS-00042", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:31:40.252256+00	2026-09-15 13:31:40.387+00	2026-09-15 13:31:42.739+00	\N	\N	\N
af32a23d-3aab-4a00-8cdf-9dd05b0228c7	e5916d2a-9b5b-4564-916b-c73dcc67afbe	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "e5916d2a-9b5b-4564-916b-c73dcc67afbe", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T12:13:41.525Z", "orderType": "takeaway", "orderNumber": "MTS-00029", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:13:41.525808+00	2026-09-15 12:13:41.605+00	2026-09-15 12:13:41.609+00	\N	\N	\N
4c19f24b-121c-4348-a50f-8623a11a539e	f406ffea-b4a8-487e-8efd-a5e910376819	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Osaka Matcha", "quantity": 1, "lineTotal": 26000, "modifiers": [], "unitPrice": 26000, "variantName": "Regular"}], "total": 26000, "orderId": "f406ffea-b4a8-487e-8efd-a5e910376819", "discount": 0, "subtotal": 26000, "createdAt": "2026-09-15T12:14:54.065Z", "orderType": "takeaway", "orderNumber": "MTS-00030", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:14:54.06537+00	2026-09-15 12:14:54.155+00	2026-09-15 12:14:54.158+00	\N	\N	\N
b62d7080-6f1b-4f6b-b729-5c5068a4ba6d	3faec035-4966-45b7-bb44-2583f1f3672e	CUSTOMER_RECEIPT	device	PRINTED	1	{"tax": 0, "lines": [{"name": "Mie Goreng Ulang Tahun", "quantity": 1, "lineTotal": 27000, "modifiers": [], "unitPrice": 27000, "variantName": "Regular"}], "total": 27000, "orderId": "3faec035-4966-45b7-bb44-2583f1f3672e", "discount": 0, "subtotal": 27000, "createdAt": "2026-09-15T13:32:18.356Z", "orderType": "takeaway", "orderNumber": "MTS-00043", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:32:18.356971+00	2026-09-15 13:32:18.438+00	2026-09-15 13:32:20.554+00	\N	\N	\N
ba70afce-2c06-4b54-ae80-464ab75c37de	5d5db5a3-c625-4407-a52b-9e5182d997c6	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "5d5db5a3-c625-4407-a52b-9e5182d997c6", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T12:15:28.035Z", "orderType": "dine_in", "orderNumber": "MTS-00031", "locationName": "Matsudon"}	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-15 12:15:28.035372+00	2026-09-15 12:15:28.087+00	2026-09-15 12:15:28.091+00	\N	\N	\N
ececc707-1a56-4a47-bc17-be91a979bf20	cf08c9ab-789d-4277-a4f8-305d4a18f54f	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Spicy Tori Curry Rice", "quantity": 1, "lineTotal": 32000, "modifiers": [], "unitPrice": 32000, "variantName": "Regular"}, {"name": "Tamago Curry Rice", "quantity": 1, "lineTotal": 28000, "modifiers": [], "unitPrice": 28000, "variantName": "Regular"}, {"name": "Taiyaki Biscoff", "quantity": 1, "lineTotal": 25000, "modifiers": [], "unitPrice": 25000, "variantName": "Regular"}], "total": 85000, "orderId": "cf08c9ab-789d-4277-a4f8-305d4a18f54f", "discount": 0, "subtotal": 85000, "changeDue": 15000, "createdAt": "2026-09-15T12:50:47.107Z", "orderType": "dine_in", "orderNumber": "MTS-00032", "cashReceived": 100000, "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:50:47.107563+00	2026-09-15 12:50:47.149+00	2026-09-15 12:50:47.153+00	\N	\N	\N
a41d7827-1679-4083-83a7-64a7f96c106a	bbbed552-0d79-4f04-8211-ad82ea464274	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Spicy Tori Curry Rice", "quantity": 3, "lineTotal": 96000, "modifiers": [], "unitPrice": 32000, "variantName": "Regular"}], "total": 96000, "orderId": "bbbed552-0d79-4f04-8211-ad82ea464274", "discount": 0, "subtotal": 96000, "changeDue": 4000, "createdAt": "2026-09-15T12:52:11.727Z", "orderType": "dine_in", "orderNumber": "MTS-00033", "cashReceived": 100000, "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:52:11.727132+00	2026-09-15 12:52:11.775+00	2026-09-15 12:52:11.781+00	\N	\N	\N
19d471b7-253c-407b-bd2e-7e21a37c8fed	f9a11b6f-d722-4c01-8e7a-67164869ff43	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "f9a11b6f-d722-4c01-8e7a-67164869ff43", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T12:59:18.069Z", "orderType": "takeaway", "orderNumber": "MTS-00034", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 12:59:18.069848+00	2026-09-15 12:59:18.124+00	2026-09-15 12:59:18.129+00	\N	\N	\N
cb37b2ed-d7b1-41e2-8eab-ab1cec9f3d71	edf257a3-9a8b-476e-b4fc-a34e00b63deb	CUSTOMER_RECEIPT	mock	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "edf257a3-9a8b-476e-b4fc-a34e00b63deb", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T13:00:41.354Z", "orderType": "takeaway", "orderNumber": "MTS-00035", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:00:41.354505+00	2026-09-15 13:00:41.389+00	2026-09-15 13:00:41.393+00	\N	\N	\N
0611a9ea-2cd3-41c6-b8bf-8fb8a6c83073	559fa6ab-1764-4ff5-a375-9e0c20faef86	CUSTOMER_RECEIPT	device	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "559fa6ab-1764-4ff5-a375-9e0c20faef86", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T13:37:20.749Z", "orderType": "takeaway", "orderNumber": "MTS-00045", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:37:20.74997+00	2026-09-15 13:37:20.829+00	2026-09-15 13:37:26.62+00	\N	\N	\N
af232eae-7eb7-4cb9-bb04-020d209f00c1	bab55c7a-45c4-4625-ad05-0101b0b14ce1	CUSTOMER_RECEIPT	device	PRINTED	1	{"tax": 0, "lines": [{"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 22000, "orderId": "bab55c7a-45c4-4625-ad05-0101b0b14ce1", "discount": 0, "subtotal": 22000, "createdAt": "2026-09-15T13:43:49.038Z", "orderType": "takeaway", "orderNumber": "MTS-00046", "locationName": "Matsudon"}	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-15 13:43:49.038542+00	2026-09-15 13:43:49.141+00	2026-09-15 13:43:51.186+00	\N	\N	\N
11b715cd-365f-4339-9d9d-0e9d6cd1d923	ff7085f8-ae37-4aa3-8dce-f32d7444660e	CUSTOMER_RECEIPT	device	QUEUED	1	{"tax": 0, "lines": [{"name": "QA Sep16 Latte", "quantity": 3, "lineTotal": 90000, "modifiers": [], "unitPrice": 30000, "variantName": "Regular"}], "total": 90000, "orderId": "ff7085f8-ae37-4aa3-8dce-f32d7444660e", "discount": 0, "subtotal": 90000, "changeDue": 10000, "createdAt": "2026-09-16T08:03:44.464Z", "orderType": "takeaway", "tableLabel": "QA Sep16 stock verification", "orderNumber": "MTS-00047", "cashReceived": 100000, "locationName": "Matsudon"}	Awaiting tablet print	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 08:03:44.464032+00	2026-09-16 08:03:44.616+00	\N	\N	\N	\N
5fa0f6d1-2d43-4c00-87c6-5c3748b9e03a	73f9fddb-97ea-462f-95f8-2f23ecebee30	CUSTOMER_RECEIPT	device	QUEUED	1	{"tax": 0, "lines": [{"name": "Mie Goreng", "quantity": 1, "lineTotal": 15000, "modifiers": [], "unitPrice": 15000, "variantName": "Original"}, {"name": "Mie Goreng Ulang Tahun", "quantity": 1, "lineTotal": 27000, "modifiers": [], "unitPrice": 27000, "variantName": "Regular"}, {"name": "Crispy Enoki", "quantity": 1, "lineTotal": 22000, "modifiers": [], "unitPrice": 22000, "variantName": "Regular"}], "total": 64000, "orderId": "73f9fddb-97ea-462f-95f8-2f23ecebee30", "discount": 0, "subtotal": 64000, "changeDue": 36000, "createdAt": "2026-09-16T11:34:58.138Z", "orderType": "dine_in", "orderNumber": "MTS-00048", "cashReceived": 100000, "locationName": "Matsudon"}	Awaiting tablet print	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:34:58.138822+00	2026-09-16 11:34:58.241+00	\N	\N	\N	\N
e20ff0e8-a5d8-4c67-9cd4-cac1c7a1c405	05ca4c83-0e32-4190-af14-a1f044e9f78b	CUSTOMER_RECEIPT	device	QUEUED	1	{"tax": 0, "lines": [{"name": "QA Sep16 Latte", "quantity": 2, "lineTotal": 60000, "modifiers": [], "unitPrice": 30000, "variantName": "Regular"}], "total": 55000, "orderId": "05ca4c83-0e32-4190-af14-a1f044e9f78b", "discount": 5000, "subtotal": 60000, "changeDue": 45000, "createdAt": "2026-09-16T11:59:18.512Z", "orderType": "dine_in", "tableLabel": "QA Sep16 revised recipe and discount", "orderNumber": "MTS-00049", "cashReceived": 100000, "locationName": "Matsudon"}	Awaiting tablet print	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:59:18.512855+00	2026-09-16 11:59:18.582+00	\N	\N	\N	\N
55f16e1b-ba65-44e6-99ef-49f213563ec5	fd9345c4-510f-421a-b918-479661d443f1	CUSTOMER_RECEIPT	device	QUEUED	1	{"tax": 0, "lines": [{"name": "Osaka Matcha", "quantity": 1, "lineTotal": 26000, "modifiers": [], "unitPrice": 26000, "variantName": "Regular"}, {"name": "Osaka Matcha", "quantity": 1, "lineTotal": 33000, "modifiers": [], "unitPrice": 33000, "variantName": "Large"}, {"name": "java a", "quantity": 1, "lineTotal": 8000, "modifiers": ["Large"], "unitPrice": 8000, "variantName": "Regular"}, {"name": "Mie Goreng", "quantity": 1, "lineTotal": 15000, "modifiers": [], "unitPrice": 15000, "variantName": "Kriuk"}], "total": 82000, "orderId": "fd9345c4-510f-421a-b918-479661d443f1", "discount": 0, "subtotal": 82000, "createdAt": "2026-09-17T06:55:58.021Z", "orderType": "dine_in", "orderNumber": "MTS-00050", "locationName": "Matsudon"}	Awaiting tablet print	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-17 06:55:58.021342+00	2026-09-17 06:55:58.197+00	\N	\N	\N	\N
d459581d-2f2b-4aba-a65f-83726301cca7	62f3b819-4b89-4cb3-ac49-75a258e92bf5	CUSTOMER_RECEIPT	device	QUEUED	1	{"tax": 0, "lines": [{"name": "java a", "quantity": 1, "lineTotal": 8000, "modifiers": ["Large"], "unitPrice": 8000, "variantName": "Regular"}], "total": 8000, "orderId": "62f3b819-4b89-4cb3-ac49-75a258e92bf5", "discount": 0, "subtotal": 8000, "changeDue": 0, "createdAt": "2026-09-17T08:37:08.908Z", "orderType": "dine_in", "orderNumber": "MTS-00051", "cashReceived": 8000, "locationName": "Matsudon"}	Awaiting tablet print	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	2026-09-17 08:37:08.908192+00	2026-09-17 08:37:08.983+00	\N	\N	\N	\N
a2eb73a7-930a-4dad-976b-f1a66130f67d	05435bdc-b661-42c4-bd90-ce83b9d5e6d7	CUSTOMER_RECEIPT	device	PRINTED	1	{"tax": 0, "lines": [{"name": "Es Batu", "quantity": 1, "lineTotal": 3000, "modifiers": [], "unitPrice": 3000, "variantName": "Regular"}], "total": 3000, "orderId": "05435bdc-b661-42c4-bd90-ce83b9d5e6d7", "discount": 0, "subtotal": 3000, "changeDue": 0, "createdAt": "2026-09-18T02:59:40.628Z", "orderType": "dine_in", "orderNumber": "MTS-00052", "cashReceived": 3000, "locationName": "Matsudon"}	\N	03243253-f0de-4700-ad92-3c70bd16de8d	2026-09-18 02:59:40.628304+00	2026-09-18 02:59:40.712+00	2026-09-18 02:59:42.692+00	\N	\N	\N
\.


--
-- Data for Name: purchase_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchase_lines (id, purchase_id, ingredient_id, quantity_purchased, purchase_unit, conversion_to_base_units, quantity_base_units, total_line_cost, cost_per_base_unit, ingredient_name_snapshot, ingredient_base_unit_snapshot) FROM stdin;
fb8a613a-b1ed-4be7-9762-d4b609c74214	b80378ae-eb70-4a2a-a9e3-8ef2b7391129	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	1.0000	dus	40.000000	40.0000	118000	2950.000000	Mie goreng original	piece
5db460f5-7f2c-4065-b5e2-96b5d83063a9	b80378ae-eb70-4a2a-a9e3-8ef2b7391129	de449976-7785-4384-b858-834d42348ef4	1.0000	karpet	30.000000	30.0000	55000	1833.333333	telur	piece
b382face-7d44-4cec-afd3-cf71d75d579c	b80378ae-eb70-4a2a-a9e3-8ef2b7391129	91f12ef6-dab9-4370-843f-71024607e1e2	100.0000	gr	1.000000	100.0000	4200	42.000000	cabe	gram
3d8c664a-ebc1-4ea2-a363-51a2284e1223	0a41e275-7b29-4b03-8036-f71c1f960e4a	f231724a-06a2-4499-a4c2-96bee6927b36	2.0000	dus	500.000000	1000.0000	1360000	1360.000000	Cup	piece
9ac23403-54c5-45ae-b999-92ebca4aa522	0a41e275-7b29-4b03-8036-f71c1f960e4a	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	2.0000	galon	4935.000000	9870.0000	182000	18.439716	Simple syrup	gram
890437cd-7ed8-43bb-aa97-e1a72d105026	0a41e275-7b29-4b03-8036-f71c1f960e4a	977c2dd1-1691-4f49-8599-64ea9e3846f1	20.0000	kg	1000.000000	20000.0000	1600000	80.000000	Creamer	gram
b07c4341-1e11-4f37-ab74-109b69740966	0a41e275-7b29-4b03-8036-f71c1f960e4a	6d14fad6-3ee7-4265-9a56-180d4c58c148	48.0000	kg	1000.000000	48000.0000	960000	20.000000	Fresh Milk	millilitre
6540172f-8b19-42f6-a492-7ccfe9367020	0a41e275-7b29-4b03-8036-f71c1f960e4a	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	3.0000	kg	1000.000000	3000.0000	642000	214.000000	Matcha	gram
c04e3bc7-1558-4e4b-830f-dfb2f4789e80	8e934f80-c18a-4e13-8fab-3f5acc28d8fd	d8a13950-dee9-4fdd-a339-1e21e366f496	2.0000	dus	500.000000	1000.0000	1400000	1400.000000	Cup L	piece
1ab4e593-0592-43a2-8e6e-07afe64c0978	885233d4-3b92-469b-b261-d2345496ac74	\N	15.0000	kg	1000.000000	15000.0000	90000	6.000000	Es batu	gram
33aedb82-920d-4514-8f4b-9e1f928d9c55	735514c5-5e34-4c3a-b4b6-b997888e9ee0	d906603a-b681-49de-883d-4c8e445d7110	15.0000	kg	1000.000000	15000.0000	90000	6.000000	Ice cube	gram
6bd80b74-ad36-4c4f-b215-810003768ae7	05343b66-8919-46c5-967e-23f695f5fbb5	91f12ef6-dab9-4370-843f-71024607e1e2	1.0000	kg	1000.000000	1000.0000	5000	5.000000	cabe	gram
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.purchases (id, business_id, location_id, supplier_id, invoice_number, purchase_date, status, total_cost, created_by, finalized_at, reversed_by_purchase_id, created_at) FROM stdin;
885233d4-3b92-469b-b261-d2345496ac74	99a43f10-309d-40d0-b266-57f43b9b070a	\N	\N	\N	2026-09-13	FINALIZED	90000	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	2026-09-13 09:15:51.457+00	\N	2026-09-13 09:15:51.392296+00
b80378ae-eb70-4a2a-a9e3-8ef2b7391129	99a43f10-309d-40d0-b266-57f43b9b070a	\N	\N	\N	2026-09-13	FINALIZED	177200	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 09:50:28.637+00	\N	2026-09-13 09:50:28.54154+00
0a41e275-7b29-4b03-8036-f71c1f960e4a	99a43f10-309d-40d0-b266-57f43b9b070a	\N	\N	\N	2026-09-14	FINALIZED	4744000	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:15:10.749+00	\N	2026-09-14 07:15:10.64484+00
8e934f80-c18a-4e13-8fab-3f5acc28d8fd	99a43f10-309d-40d0-b266-57f43b9b070a	\N	\N	\N	2026-09-14	FINALIZED	1400000	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:19:44.164+00	\N	2026-09-14 07:19:44.13676+00
735514c5-5e34-4c3a-b4b6-b997888e9ee0	99a43f10-309d-40d0-b266-57f43b9b070a	\N	\N	\N	2026-09-14	FINALIZED	90000	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-14 07:37:05.052+00	\N	2026-09-14 07:37:05.018951+00
05343b66-8919-46c5-967e-23f695f5fbb5	99a43f10-309d-40d0-b266-57f43b9b070a	\N	\N	\N	2026-09-16	FINALIZED	5000	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 11:34:24.927+00	\N	2026-09-16 11:34:24.844728+00
\.


--
-- Data for Name: recipe_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recipe_lines (id, recipe_id, ingredient_id, quantity_base_units, waste_percentage, notes) FROM stdin;
aa42ac17-f335-40e7-be65-9efd0a9ef267	b151749a-fc69-4a9f-8187-b920502c0c1e	91f12ef6-dab9-4370-843f-71024607e1e2	3.0000	0.00	\N
a7bfedf5-de5c-4e4c-8762-f478b3da282f	b151749a-fc69-4a9f-8187-b920502c0c1e	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	1.0000	0.00	\N
836de02c-8376-4694-b4f5-11a375f8628f	b151749a-fc69-4a9f-8187-b920502c0c1e	de449976-7785-4384-b858-834d42348ef4	1.0000	0.00	\N
a7b65293-364c-4ce3-a22b-3ff12ce72d08	465119aa-5519-4f45-9903-d0b4d72ffe28	91f12ef6-dab9-4370-843f-71024607e1e2	3.0000	0.00	\N
dec3c53e-32d9-4b5c-812b-699aab0649a7	465119aa-5519-4f45-9903-d0b4d72ffe28	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	1.0000	0.00	\N
a064d9aa-1b63-49cc-989a-dbdc23af61f9	465119aa-5519-4f45-9903-d0b4d72ffe28	de449976-7785-4384-b858-834d42348ef4	1.0000	0.00	\N
10af0611-fd0a-4ed5-922d-3039d595b53e	27854ede-85a4-4f10-b334-f518fc671799	d8a13950-dee9-4fdd-a339-1e21e366f496	1.0000	30.00	\N
5f3ca72b-7bf5-4024-adee-f241584bf8b6	acce575b-465e-4f47-936d-41fd8ca74911	f231724a-06a2-4499-a4c2-96bee6927b36	1.0000	0.00	\N
2e24cfc6-add0-4657-be8f-d42f40e9ccb0	acce575b-465e-4f47-936d-41fd8ca74911	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	10.0000	0.00	\N
0223b67b-def6-4c95-87fb-555861e24850	acce575b-465e-4f47-936d-41fd8ca74911	977c2dd1-1691-4f49-8599-64ea9e3846f1	40.0000	0.00	\N
5e782f71-c60c-4cd1-ab98-f945acf90792	acce575b-465e-4f47-936d-41fd8ca74911	6d14fad6-3ee7-4265-9a56-180d4c58c148	100.0000	0.00	\N
4a602917-8e72-49ce-9426-e3fd1ff24ae9	acce575b-465e-4f47-936d-41fd8ca74911	d906603a-b681-49de-883d-4c8e445d7110	500.0000	0.00	\N
c42a5e58-f518-4ae8-81fc-625dfbd5e364	acce575b-465e-4f47-936d-41fd8ca74911	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	15.0000	0.00	\N
52762d5c-c863-4a3c-9837-3f4e32a7ae7a	60fd6dda-609e-41a8-a628-fa41e6b10948	f231724a-06a2-4499-a4c2-96bee6927b36	1.0000	30.00	\N
4445cb6b-d787-4b85-a013-4638ea037948	60fd6dda-609e-41a8-a628-fa41e6b10948	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	10.0000	0.00	\N
5cfc7022-4f29-44dc-b540-6fdca790a5f0	60fd6dda-609e-41a8-a628-fa41e6b10948	977c2dd1-1691-4f49-8599-64ea9e3846f1	40.0000	0.00	\N
2f479f12-13a7-43a1-9f3c-0f21fc5ce1ca	60fd6dda-609e-41a8-a628-fa41e6b10948	6d14fad6-3ee7-4265-9a56-180d4c58c148	100.0000	0.00	\N
88ceb763-6b1f-4ed1-ace3-ce6f1d499ec6	60fd6dda-609e-41a8-a628-fa41e6b10948	d906603a-b681-49de-883d-4c8e445d7110	500.0000	0.00	\N
bebb194f-db36-4845-8af3-7186a8614d8f	60fd6dda-609e-41a8-a628-fa41e6b10948	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	15.0000	0.00	\N
2a209a00-e792-47f8-9b3c-ad9ff0b1a725	a796ca0a-68b8-4365-ae0f-1662b982da37	f231724a-06a2-4499-a4c2-96bee6927b36	1.0000	0.00	\N
53a4e8c6-f6b5-41d1-8822-53a0e4f8e1ba	a796ca0a-68b8-4365-ae0f-1662b982da37	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	10.0000	0.00	\N
fa2b3120-a8c4-4d0a-865b-67ba51fee064	a796ca0a-68b8-4365-ae0f-1662b982da37	977c2dd1-1691-4f49-8599-64ea9e3846f1	40.0000	0.00	\N
7dee3568-ab5d-40eb-b027-17a2fe5b4dc2	a796ca0a-68b8-4365-ae0f-1662b982da37	6d14fad6-3ee7-4265-9a56-180d4c58c148	100.0000	0.00	\N
ff8cddf1-655d-48f6-a3b0-b8e82822637d	a796ca0a-68b8-4365-ae0f-1662b982da37	d906603a-b681-49de-883d-4c8e445d7110	500.0000	0.00	\N
2d908392-e088-49d2-b2fe-3afa6ac07f30	a796ca0a-68b8-4365-ae0f-1662b982da37	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	15.0000	0.00	\N
0e83bc99-509e-4c8a-be44-6fac24755989	d2aa0cfb-b40f-4175-bcc0-f7795233af93	f231724a-06a2-4499-a4c2-96bee6927b36	1.0000	30.00	\N
104c0887-21fb-41b0-85dd-a4468c4aa045	ec15eafe-e2f9-462b-9415-5e7a6220a293	f231724a-06a2-4499-a4c2-96bee6927b36	1.0000	30.00	\N
d48621b8-0ddd-48f2-92d4-b3447d340be6	ec15eafe-e2f9-462b-9415-5e7a6220a293	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	10.0000	0.00	\N
6cb2170b-cc41-41f2-b9f7-0b48abd8822f	ec15eafe-e2f9-462b-9415-5e7a6220a293	977c2dd1-1691-4f49-8599-64ea9e3846f1	40.0000	0.00	\N
d3d1af5d-2372-4066-9f94-1e5080f1ad8f	ec15eafe-e2f9-462b-9415-5e7a6220a293	6d14fad6-3ee7-4265-9a56-180d4c58c148	100.0000	0.00	\N
4ef57fcb-e323-4ea8-a20e-f1aa7107be84	ec15eafe-e2f9-462b-9415-5e7a6220a293	d906603a-b681-49de-883d-4c8e445d7110	500.0000	0.00	\N
a59e1d9b-5a09-41c7-97c5-6e8e5ea10d50	ec15eafe-e2f9-462b-9415-5e7a6220a293	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	15.0000	0.00	\N
aefdaa8a-8284-4d1a-8e47-68ba597b4191	c0e71042-6b0f-48b3-86ca-e5f92dd4be37	d8a13950-dee9-4fdd-a339-1e21e366f496	1.0000	30.00	\N
e490c92e-2143-486f-bfe7-0272f8eeb468	c0e71042-6b0f-48b3-86ca-e5f92dd4be37	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	15.0000	0.00	\N
6ba24c28-a26e-45eb-9bd1-0fd947271f55	c0e71042-6b0f-48b3-86ca-e5f92dd4be37	977c2dd1-1691-4f49-8599-64ea9e3846f1	60.0000	0.00	\N
a5e35e83-f676-480c-9ec9-784a865495b7	c0e71042-6b0f-48b3-86ca-e5f92dd4be37	6d14fad6-3ee7-4265-9a56-180d4c58c148	150.0000	0.00	\N
b5ef3f9b-c5cd-4d63-84d9-dbcb78d3bd70	c0e71042-6b0f-48b3-86ca-e5f92dd4be37	d906603a-b681-49de-883d-4c8e445d7110	500.0000	0.00	\N
3b7b585e-d377-416b-b4c4-43a8e19f5281	c0e71042-6b0f-48b3-86ca-e5f92dd4be37	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	22.5000	0.00	\N
ed488a55-d115-41cf-a7e1-1003ba59219b	818c51ff-8b2d-42ba-8825-bbbadcc7cb0f	d8a13950-dee9-4fdd-a339-1e21e366f496	1.0000	30.00	\N
455d6775-4356-41ae-b53e-3636a0add04d	818c51ff-8b2d-42ba-8825-bbbadcc7cb0f	b073e0d3-9ab2-4455-8dcb-6b9ef47f6352	15.0000	0.00	\N
f93a4431-686d-45a3-a9ff-315381f2a409	818c51ff-8b2d-42ba-8825-bbbadcc7cb0f	977c2dd1-1691-4f49-8599-64ea9e3846f1	60.0000	0.00	\N
87ecd06a-d2bd-4fe9-a768-df06dd06536d	818c51ff-8b2d-42ba-8825-bbbadcc7cb0f	6d14fad6-3ee7-4265-9a56-180d4c58c148	150.0000	0.00	\N
ac7a2c73-db1c-4945-a604-05db0967fab6	818c51ff-8b2d-42ba-8825-bbbadcc7cb0f	d906603a-b681-49de-883d-4c8e445d7110	500.0000	0.00	\N
c19e1991-1a82-41d8-a11e-a82f4c694d5a	818c51ff-8b2d-42ba-8825-bbbadcc7cb0f	6fe11bee-8b53-4103-9bd0-e2fa53a6408a	22.5000	0.00	\N
f68b6e86-645d-43fb-bac5-1b0277fc525a	bdfb14dc-319f-4f36-985a-28ccc97d49a4	4d1064fd-7f62-4ea1-b50a-3c692d6e3211	18.5000	10.00	\N
23778b77-cb39-4894-8cfe-8366e3231842	bdfb14dc-319f-4f36-985a-28ccc97d49a4	0d8e3498-e1d8-4788-8a6a-ce73419e3957	150.0000	0.00	\N
bbd24470-8554-4e4d-a191-489a6b50a19e	bdfb14dc-319f-4f36-985a-28ccc97d49a4	c9584b98-d4c4-447e-8788-ec94605e4fbb	1.0000	0.00	\N
8d51f1b1-907e-401e-8ba6-2644a93ca39b	900cfeab-c221-456e-96f8-5a014f51926a	4d1064fd-7f62-4ea1-b50a-3c692d6e3211	20.0000	10.00	\N
5461ac89-b44b-46fe-8df1-35dff2b83f9f	900cfeab-c221-456e-96f8-5a014f51926a	0d8e3498-e1d8-4788-8a6a-ce73419e3957	150.0000	0.00	\N
abfd9c51-5182-47b4-9b08-5224ec760f51	900cfeab-c221-456e-96f8-5a014f51926a	c9584b98-d4c4-447e-8788-ec94605e4fbb	1.0000	0.00	\N
9c899307-b2bd-4289-b7b9-4b5545f75fe4	5c186d6d-1469-4369-a66d-217c9ad55663	4d1064fd-7f62-4ea1-b50a-3c692d6e3211	25.0000	0.00	\N
4a0e6630-cf77-4c81-a932-14fa080c4092	5c186d6d-1469-4369-a66d-217c9ad55663	0d8e3498-e1d8-4788-8a6a-ce73419e3957	225.0000	0.00	\N
630e9647-d35a-4d77-87c0-576cad1f3a2f	5c186d6d-1469-4369-a66d-217c9ad55663	c9584b98-d4c4-447e-8788-ec94605e4fbb	1.0000	0.00	\N
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recipes (id, menu_item_variant_id, version, active, created_at, created_by) FROM stdin;
b151749a-fc69-4a9f-8187-b920502c0c1e	ada4b6c8-9ef2-477a-bb0e-4a020517fd0b	1	f	2026-09-13 09:51:52.129135+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
465119aa-5519-4f45-9903-d0b4d72ffe28	ada4b6c8-9ef2-477a-bb0e-4a020517fd0b	2	t	2026-09-13 09:53:23.634137+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
acce575b-465e-4f47-936d-41fd8ca74911	58381b94-8e8d-4f50-a2ad-4b34be9f266f	1	f	2026-09-14 07:25:57.394209+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
60fd6dda-609e-41a8-a628-fa41e6b10948	58381b94-8e8d-4f50-a2ad-4b34be9f266f	2	f	2026-09-14 07:26:05.424119+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
a796ca0a-68b8-4365-ae0f-1662b982da37	58381b94-8e8d-4f50-a2ad-4b34be9f266f	3	f	2026-09-14 07:27:14.315928+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
d2aa0cfb-b40f-4175-bcc0-f7795233af93	58381b94-8e8d-4f50-a2ad-4b34be9f266f	4	f	2026-09-14 07:28:26.748597+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
ec15eafe-e2f9-462b-9415-5e7a6220a293	58381b94-8e8d-4f50-a2ad-4b34be9f266f	5	t	2026-09-14 07:29:56.632341+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
27854ede-85a4-4f10-b334-f518fc671799	33724e05-3d2e-431f-bc47-2f549d1f8210	1	f	2026-09-14 07:23:06.703564+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
c0e71042-6b0f-48b3-86ca-e5f92dd4be37	33724e05-3d2e-431f-bc47-2f549d1f8210	2	f	2026-09-14 07:31:13.305233+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
818c51ff-8b2d-42ba-8825-bbbadcc7cb0f	33724e05-3d2e-431f-bc47-2f549d1f8210	3	t	2026-09-14 07:32:47.310271+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
bdfb14dc-319f-4f36-985a-28ccc97d49a4	6f5aff82-4fab-4e61-a1dd-b526223b611e	1	f	2026-09-16 08:02:52.891986+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
900cfeab-c221-456e-96f8-5a014f51926a	6f5aff82-4fab-4e61-a1dd-b526223b611e	2	t	2026-09-16 11:54:49.395871+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
5c186d6d-1469-4369-a66d-217c9ad55663	9344cf78-4f10-4bee-8f41-5f5b3b211116	1	t	2026-09-16 12:02:33.550055+00	b087e36c-b8af-40dc-a541-b9a90de7db6e
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.roles (id, name) FROM stdin;
9ce7bf7f-04da-4b06-99a1-d893d180a581	super_admin
f03aa4cb-12bf-4803-856d-fad4cd021b69	owner
7711def6-eed2-412d-a0ef-d37fbf807f8b	manager
cd989701-b0f6-471a-9249-6e52a54c73d8	cashier
6c5724d3-2da5-4b51-9bc8-c0406b7844ea	inventory_staff
24daecc3-da4b-4791-83cf-6c545a6e8eea	viewer
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sessions (id, user_id, token_hash, expires_at, user_agent, ip_address, created_at) FROM stdin;
c05292bf-405c-4ca7-83f1-e0a276ba2382	b087e36c-b8af-40dc-a541-b9a90de7db6e	5d8dd3c19fb61fc8b9111b05a7c8db89018f9791ee20af616a306d201f0e4198	2026-09-27 10:49:51.248+00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	180.241.8.236	2026-09-13 10:49:51.22779+00
0381f956-964f-4998-afb0-d20d0f1117f4	b087e36c-b8af-40dc-a541-b9a90de7db6e	925d09e64d584968a74e2608d0d1bb0f2f8436b21897f79195c26b9577e54033	2026-09-30 07:55:26.123+00	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	\N	2026-09-16 07:55:26.085248+00
c417d15e-2354-44f8-bd34-a5a9028e147e	b087e36c-b8af-40dc-a541-b9a90de7db6e	e001febaa88c0ed577694b2781c575be1feafae33b9a408daef609553f42fc13	2026-09-30 12:19:13.655+00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	\N	2026-09-16 12:19:13.627733+00
fa6f6854-f755-4422-9527-1f1e8fea0c53	7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	c82717bc3c70b386665304b97c1760cf8031d79c53aba8996b4de5cc5b6b79fe	2026-10-01 06:55:51.836+00	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.6.1 Mobile/15E148 Safari/604.1	\N	2026-09-17 06:55:51.798207+00
de5e6e92-90ef-4e1c-b620-6761cfc5067a	b087e36c-b8af-40dc-a541-b9a90de7db6e	a1b184bc4462d6cc39836119e44d993de6186d874678e7548bb46fe74eaccb14	2026-10-01 13:52:18.037+00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36	\N	2026-09-17 13:52:18.001131+00
4f94c016-324d-416d-ac6a-5fc11627d901	03243253-f0de-4700-ad92-3c70bd16de8d	062128480de86051f0692695acf19973f4372d9e07260421bcaa4a358c688ea0	2026-10-02 02:57:18.643+00	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36	\N	2026-09-18 02:57:18.641753+00
\.


--
-- Data for Name: stock_count_lines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stock_count_lines (id, stock_count_id, ingredient_id, system_quantity, counted_quantity, difference_quantity, ingredient_name_snapshot, ingredient_base_unit_snapshot) FROM stdin;
8450927f-3990-4746-89b8-693d5ca38516	b895ae63-dd26-47b3-80b3-6dfde8b01dc2	48972053-ddea-4013-ba8b-dead6db49581	0.0000	1000.0000	1000.0000	Chicken Meat	gram
\.


--
-- Data for Name: stock_counts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stock_counts (id, business_id, location_id, status, counted_by, submitted_at, created_at) FROM stdin;
b895ae63-dd26-47b3-80b3-6dfde8b01dc2	99a43f10-309d-40d0-b266-57f43b9b070a	\N	SUBMITTED	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-16 12:23:39.123+00	2026-09-16 12:23:39.087623+00
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.suppliers (id, business_id, name, contact_name, phone, email, address, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_roles (user_id, role_id) FROM stdin;
b087e36c-b8af-40dc-a541-b9a90de7db6e	f03aa4cb-12bf-4803-856d-fad4cd021b69
03243253-f0de-4700-ad92-3c70bd16de8d	cd989701-b0f6-471a-9249-6e52a54c73d8
7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	7711def6-eed2-412d-a0ef-d37fbf807f8b
ce3921aa-0dde-4b16-ba1d-8b5b44edba54	6c5724d3-2da5-4b51-9bc8-c0406b7844ea
9a46b839-07de-4358-bbf0-b4c0b3e1906c	24daecc3-da4b-4791-83cf-6c545a6e8eea
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, business_id, name, email, password_hash, active, created_at, updated_at) FROM stdin;
b087e36c-b8af-40dc-a541-b9a90de7db6e	99a43f10-309d-40d0-b266-57f43b9b070a	Matsudon Owner	owner@matsudon.id	$2b$12$ZX3uo4ousXTY6r8z.WiYeedjCkschw2NMXl4JtyjQZeHSAYSEeODi	t	2026-09-13 06:24:09.822629+00	2026-09-13 07:07:51.147333+00
03243253-f0de-4700-ad92-3c70bd16de8d	99a43f10-309d-40d0-b266-57f43b9b070a	Matsudon Cashier	cashier@matsudon.id	$2b$12$NRqNPKnzDl0GrW45j85CcO7jqWfXdEHgXGfNxvspw6CaAhZWdIDjK	t	2026-09-13 06:24:09.822629+00	2026-09-13 07:07:51.808424+00
7ed187bd-6f44-47ca-9ab7-d787ea6fd35e	99a43f10-309d-40d0-b266-57f43b9b070a	Matsudon Manager	manager@matsudon.id	$2b$12$sgvLM3xN5zw7XE57m8mjDe0i470POfVutJRJEj6JeKYVwktakCBhC	t	2026-09-13 07:08:09.583335+00	2026-09-13 07:12:07.846631+00
ce3921aa-0dde-4b16-ba1d-8b5b44edba54	99a43f10-309d-40d0-b266-57f43b9b070a	Matsudon Inventory	inventory@matsudon.id	$2b$12$ByQ1/v53Co6GHOvDcVrh5.pa.LKrFcI0LIcnpJkJIZ/UY57nYmiwG	t	2026-09-13 07:08:09.583335+00	2026-09-13 07:12:08.490883+00
9a46b839-07de-4358-bbf0-b4c0b3e1906c	99a43f10-309d-40d0-b266-57f43b9b070a	Matsudon Viewer	viewer@matsudon.id	$2b$12$TmpzpEhDJN183cpTrcT2qefBTEE/f76aztR.dWkYtCTp5.XWTkzk2	t	2026-09-13 07:08:09.583335+00	2026-09-13 07:12:09.123713+00
\.


--
-- Data for Name: waste_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.waste_records (id, business_id, location_id, ingredient_id, quantity_base_units, reason, estimated_cost, notes, photo_url, created_by, created_at, ingredient_name_snapshot, ingredient_base_unit_snapshot) FROM stdin;
1e11941b-5949-48dc-91ca-478e435e1000	99a43f10-309d-40d0-b266-57f43b9b070a	\N	3c6c1770-6c98-4e0f-9c5b-dc215e4896ae	1.0000	damaged	2950	\N	\N	b087e36c-b8af-40dc-a541-b9a90de7db6e	2026-09-13 10:26:04.082964+00	Mie goreng original	piece
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2026-09-12 21:36:41
20211116045059	2026-09-12 21:36:41
20211116050929	2026-09-12 21:36:41
20211116051442	2026-09-12 21:36:41
20211116212300	2026-09-12 21:36:41
20211116213355	2026-09-12 21:36:41
20211116213934	2026-09-12 21:36:41
20211116214523	2026-09-12 21:36:41
20211122062447	2026-09-12 21:36:41
20211124070109	2026-09-12 21:36:41
20211202204204	2026-09-12 21:36:41
20211202204605	2026-09-12 21:36:41
20211210212804	2026-09-12 21:36:41
20211228014915	2026-09-12 21:36:41
20220107221237	2026-09-12 21:36:41
20220228202821	2026-09-12 21:36:41
20220312004840	2026-09-12 21:36:41
20220603231003	2026-09-12 21:36:41
20220603232444	2026-09-12 21:36:41
20220615214548	2026-09-12 21:36:41
20220712093339	2026-09-12 21:36:41
20220908172859	2026-09-12 21:36:41
20220916233421	2026-09-12 21:36:41
20230119133233	2026-09-12 21:36:41
20230128025114	2026-09-12 21:36:41
20230128025212	2026-09-12 21:36:41
20230227211149	2026-09-12 21:36:41
20230228184745	2026-09-12 21:36:41
20230308225145	2026-09-12 21:36:41
20230328144023	2026-09-12 21:36:41
20231018144023	2026-09-12 21:36:41
20231204144023	2026-09-12 21:36:41
20231204144024	2026-09-12 21:36:41
20231204144025	2026-09-12 21:36:41
20240108234812	2026-09-12 21:36:41
20240109165339	2026-09-12 21:36:41
20240227174441	2026-09-12 21:36:41
20240311171622	2026-09-12 21:36:41
20240321100241	2026-09-12 21:36:41
20240401105812	2026-09-12 21:36:41
20240418121054	2026-09-12 21:36:41
20240523004032	2026-09-12 21:36:41
20240618124746	2026-09-12 21:36:41
20240801235015	2026-09-12 21:36:41
20240805133720	2026-09-12 21:36:41
20240827160934	2026-09-12 21:36:41
20240919163303	2026-09-12 21:36:41
20240919163305	2026-09-12 21:36:41
20241019105805	2026-09-12 21:36:41
20241030150047	2026-09-12 21:36:41
20241108114728	2026-09-12 21:36:41
20241121104152	2026-09-12 21:36:41
20241130184212	2026-09-12 21:36:41
20241220035512	2026-09-12 21:36:41
20241220123912	2026-09-12 21:36:41
20241224161212	2026-09-12 21:36:41
20250107150512	2026-09-12 21:36:41
20250110162412	2026-09-12 21:36:41
20250123174212	2026-09-12 21:36:41
20250128220012	2026-09-12 21:36:41
20250506224012	2026-09-12 21:36:41
20250523164012	2026-09-12 21:36:41
20250714121412	2026-09-12 21:36:41
20250905041441	2026-09-12 21:36:41
20251103001201	2026-09-12 21:36:41
20251120212548	2026-09-12 21:36:41
20251120215549	2026-09-12 21:36:41
20260218120000	2026-09-12 21:36:41
20260326120000	2026-09-12 21:36:41
20260514120000	2026-09-12 21:36:41
20260527120000	2026-09-12 21:36:41
20260528120000	2026-09-12 21:36:41
20260603120000	2026-09-12 21:36:41
20260605120000	2026-09-12 21:36:41
20260606110000	2026-09-12 21:36:41
20260616120000	2026-09-12 21:36:41
20260624120000	2026-09-12 21:36:41
20260626120000	2026-09-12 21:36:41
20260706120000	2026-09-12 21:36:41
20260707120000	2026-09-12 21:36:41
20260709120000	2026-09-12 21:36:41
20260714120000	2026-09-12 21:36:41
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter, selected_columns) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type, versioning_status) FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2026-09-12 21:36:43.138526
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2026-09-12 21:36:43.181593
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2026-09-12 21:36:43.187199
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2026-09-12 21:36:43.210748
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2026-09-12 21:36:43.226932
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2026-09-12 21:36:43.232871
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2026-09-12 21:36:43.239551
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2026-09-12 21:36:43.245648
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2026-09-12 21:36:43.252085
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2026-09-12 21:36:43.25925
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2026-09-12 21:36:43.265374
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2026-09-12 21:36:43.271513
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2026-09-12 21:36:43.2773
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2026-09-12 21:36:43.282499
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2026-09-12 21:36:43.287939
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2026-09-12 21:36:43.317011
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2026-09-12 21:36:43.322955
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2026-09-12 21:36:43.330078
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2026-09-12 21:36:43.335291
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2026-09-12 21:36:43.342505
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2026-09-12 21:36:43.349051
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2026-09-12 21:36:43.356921
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2026-09-12 21:36:43.372429
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2026-09-12 21:36:43.384207
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2026-09-12 21:36:43.390748
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2026-09-12 21:36:43.396512
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2026-09-12 21:36:43.402637
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2026-09-12 21:36:43.407917
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2026-09-12 21:36:43.413224
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2026-09-12 21:36:43.418099
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2026-09-12 21:36:43.428308
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2026-09-12 21:36:43.433617
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2026-09-12 21:36:43.438699
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2026-09-12 21:36:43.445184
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2026-09-12 21:36:43.450157
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2026-09-12 21:36:43.45512
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2026-09-12 21:36:43.46025
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2026-09-12 21:36:43.469233
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2026-09-12 21:36:43.474749
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2026-09-12 21:36:43.490274
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2026-09-12 21:36:43.497117
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2026-09-12 21:36:43.502496
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2026-09-12 21:36:43.507604
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2026-09-12 21:36:43.512647
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2026-09-12 21:36:43.517606
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2026-09-12 21:36:43.523257
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2026-09-12 21:36:43.535338
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2026-09-12 21:36:43.541307
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2026-09-12 21:36:43.546636
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2026-09-12 21:36:43.565366
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-09-12 21:36:43.571239
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-09-12 21:36:43.889313
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-09-12 21:36:43.89154
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-09-12 21:36:43.902164
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-09-12 21:36:43.905329
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-09-12 21:36:43.907431
56	fix-optimized-search-function	b823ed1e418101032fa01374edc9a436e54e3ed4	2026-09-12 21:36:43.914207
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-09-12 21:36:43.923798
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-09-12 21:36:43.929385
59	drop-unused-functions	38456f13e39691c2bbb4b5151d0d1cdbabd4a8c4	2026-09-12 21:36:43.936608
60	optimize-existing-functions-again	db35e1c91a9201e59f4fef8d972c2f277d68b157	2026-09-12 21:36:43.942312
61	mark-filename-immutable	fe0096517ae9d60aaec1d110172ba9036dc66bb7	2026-09-12 21:36:43.948415
62	object-versioning-core	0b855f00ff3be0bfca91efee02a9858912491a9a	2026-09-12 21:36:43.95362
63	fix-search-name-relative-to-prefix	c7485e417624f795ce8bb2da21927f48e088904d	2026-09-12 21:36:43.970769
64	fix-search-by-timestamp-sqli	0af424ecd388a39bb1645184b222185a12149675	2026-09-12 21:36:43.978267
65	objects-key-version-index	603c1c55658e982d35839001e2c2b59a50703904	2026-09-12 21:36:44.077874
66	objects-current-version-index	191466c93aa2c46a00e36505577c5fcab8d7cb4b	2026-09-12 21:36:44.096899
67	objects-null-version-index	15bfe8c35b66642b6c78ba60060fa8793bd2207a	2026-09-12 21:36:44.111079
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, archived_at, is_delete_marker, is_versioned) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata, metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: -
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE SET; Schema: drizzle; Owner: -
--

SELECT pg_catalog.setval('drizzle.__drizzle_migrations_id_seq', 10, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: -
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: custom_oauth_providers custom_oauth_providers_identifier_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_identifier_key UNIQUE (identifier);


--
-- Name: custom_oauth_providers custom_oauth_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.custom_oauth_providers
    ADD CONSTRAINT custom_oauth_providers_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: mfa_recovery_code_sets mfa_recovery_code_sets_mfa_factor_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_recovery_code_sets
    ADD CONSTRAINT mfa_recovery_code_sets_mfa_factor_id_key UNIQUE (mfa_factor_id);


--
-- Name: mfa_recovery_code_sets mfa_recovery_code_sets_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_recovery_code_sets
    ADD CONSTRAINT mfa_recovery_code_sets_pkey PRIMARY KEY (id);


--
-- Name: mfa_recovery_code_sets mfa_recovery_code_sets_user_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_recovery_code_sets
    ADD CONSTRAINT mfa_recovery_code_sets_user_id_key UNIQUE (user_id);


--
-- Name: mfa_recovery_codes mfa_recovery_codes_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_recovery_codes
    ADD CONSTRAINT mfa_recovery_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: scim_tokens scim_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.scim_tokens
    ADD CONSTRAINT scim_tokens_pkey PRIMARY KEY (id);


--
-- Name: scim_users scim_users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.scim_users
    ADD CONSTRAINT scim_users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webauthn_challenges webauthn_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credentials webauthn_credentials_pkey; Type: CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_pkey PRIMARY KEY (id);


--
-- Name: __drizzle_migrations __drizzle_migrations_pkey; Type: CONSTRAINT; Schema: drizzle; Owner: -
--

ALTER TABLE ONLY drizzle.__drizzle_migrations
    ADD CONSTRAINT __drizzle_migrations_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: businesses businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: inventory_movements inventory_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_movements
    ADD CONSTRAINT inventory_movements_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: login_attempts login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_attempts
    ADD CONSTRAINT login_attempts_pkey PRIMARY KEY (key_hash);


--
-- Name: menu_categories menu_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_pkey PRIMARY KEY (id);


--
-- Name: menu_item_modifier_groups menu_item_modifier_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_item_modifier_groups
    ADD CONSTRAINT menu_item_modifier_groups_pkey PRIMARY KEY (id);


--
-- Name: menu_item_variants menu_item_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_item_variants
    ADD CONSTRAINT menu_item_variants_pkey PRIMARY KEY (id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: modifier_groups modifier_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_groups
    ADD CONSTRAINT modifier_groups_pkey PRIMARY KEY (id);


--
-- Name: modifier_options modifier_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_options
    ADD CONSTRAINT modifier_options_pkey PRIMARY KEY (id);


--
-- Name: modifier_recipe_lines modifier_recipe_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_recipe_lines
    ADD CONSTRAINT modifier_recipe_lines_pkey PRIMARY KEY (id);


--
-- Name: order_ingredient_consumption order_ingredient_consumption_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_ingredient_consumption
    ADD CONSTRAINT order_ingredient_consumption_pkey PRIMARY KEY (id);


--
-- Name: order_line_modifiers order_line_modifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_line_modifiers
    ADD CONSTRAINT order_line_modifiers_pkey PRIMARY KEY (id);


--
-- Name: order_lines order_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_lines
    ADD CONSTRAINT order_lines_pkey PRIMARY KEY (id);


--
-- Name: order_number_counters order_number_counters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_number_counters
    ADD CONSTRAINT order_number_counters_pkey PRIMARY KEY (business_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: print_jobs print_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_jobs
    ADD CONSTRAINT print_jobs_pkey PRIMARY KEY (id);


--
-- Name: purchase_lines purchase_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_lines
    ADD CONSTRAINT purchase_lines_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: recipe_lines recipe_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_lines
    ADD CONSTRAINT recipe_lines_pkey PRIMARY KEY (id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_unique UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_hash_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_hash_unique UNIQUE (token_hash);


--
-- Name: stock_count_lines stock_count_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_count_lines
    ADD CONSTRAINT stock_count_lines_pkey PRIMARY KEY (id);


--
-- Name: stock_counts stock_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_counts
    ADD CONSTRAINT stock_counts_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_user_id_role_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_role_id_pk PRIMARY KEY (user_id, role_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: waste_records waste_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.waste_records
    ADD CONSTRAINT waste_records_pkey PRIMARY KEY (id);


--
-- Name: messages messages_payload_exclusive; Type: CHECK CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE realtime.messages
    ADD CONSTRAINT messages_payload_exclusive CHECK (((payload IS NULL) OR (binary_payload IS NULL))) NOT VALID;


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: -
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: custom_oauth_providers_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_created_at_idx ON auth.custom_oauth_providers USING btree (created_at);


--
-- Name: custom_oauth_providers_enabled_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_enabled_idx ON auth.custom_oauth_providers USING btree (enabled);


--
-- Name: custom_oauth_providers_identifier_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_identifier_idx ON auth.custom_oauth_providers USING btree (identifier);


--
-- Name: custom_oauth_providers_provider_type_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX custom_oauth_providers_provider_type_idx ON auth.custom_oauth_providers USING btree (provider_type);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: idx_users_created_at_desc; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_users_created_at_desc ON auth.users USING btree (created_at DESC);


--
-- Name: idx_users_email; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_users_email ON auth.users USING btree (email);


--
-- Name: idx_users_last_sign_in_at_desc; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_users_last_sign_in_at_desc ON auth.users USING btree (last_sign_in_at DESC);


--
-- Name: idx_users_name; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX idx_users_name ON auth.users USING btree (((raw_user_meta_data ->> 'name'::text))) WHERE ((raw_user_meta_data ->> 'name'::text) IS NOT NULL);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: mfa_recovery_codes_set_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX mfa_recovery_codes_set_id_idx ON auth.mfa_recovery_codes USING btree (mfa_recovery_code_set_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: scim_tokens_expires_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX scim_tokens_expires_at_idx ON auth.scim_tokens USING btree (expires_at);


--
-- Name: scim_tokens_revoked_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX scim_tokens_revoked_at_idx ON auth.scim_tokens USING btree (revoked_at);


--
-- Name: scim_tokens_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX scim_tokens_sso_provider_id_idx ON auth.scim_tokens USING btree (sso_provider_id);


--
-- Name: scim_tokens_token_hash_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX scim_tokens_token_hash_key ON auth.scim_tokens USING btree (token_hash);


--
-- Name: scim_users_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX scim_users_created_at_idx ON auth.scim_users USING btree (sso_provider_id, created_at, id) WHERE (deleted_at IS NULL);


--
-- Name: scim_users_deleted_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX scim_users_deleted_at_idx ON auth.scim_users USING btree (deleted_at);


--
-- Name: scim_users_external_id_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX scim_users_external_id_key ON auth.scim_users USING btree (sso_provider_id, external_id) WHERE ((external_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: scim_users_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX scim_users_id_idx ON auth.scim_users USING btree (sso_provider_id, id) WHERE (deleted_at IS NULL);


--
-- Name: scim_users_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX scim_users_sso_provider_id_idx ON auth.scim_users USING btree (sso_provider_id);


--
-- Name: scim_users_updated_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX scim_users_updated_at_idx ON auth.scim_users USING btree (sso_provider_id, updated_at, id) WHERE (deleted_at IS NULL);


--
-- Name: scim_users_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX scim_users_user_id_idx ON auth.scim_users USING btree (user_id);


--
-- Name: scim_users_user_name_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX scim_users_user_name_idx ON auth.scim_users USING btree (sso_provider_id, user_name COLLATE "C", id) WHERE (deleted_at IS NULL);


--
-- Name: scim_users_user_name_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX scim_users_user_name_key ON auth.scim_users USING btree (sso_provider_id, user_name) WHERE (deleted_at IS NULL);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: -
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: webauthn_challenges_expires_at_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX webauthn_challenges_expires_at_idx ON auth.webauthn_challenges USING btree (expires_at);


--
-- Name: webauthn_challenges_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX webauthn_challenges_user_id_idx ON auth.webauthn_challenges USING btree (user_id);


--
-- Name: webauthn_credentials_credential_id_key; Type: INDEX; Schema: auth; Owner: -
--

CREATE UNIQUE INDEX webauthn_credentials_credential_id_key ON auth.webauthn_credentials USING btree (credential_id);


--
-- Name: webauthn_credentials_user_id_idx; Type: INDEX; Schema: auth; Owner: -
--

CREATE INDEX webauthn_credentials_user_id_idx ON auth.webauthn_credentials USING btree (user_id);


--
-- Name: audit_logs_business_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_logs_business_created_at_idx ON public.audit_logs USING btree (business_id, created_at, id);


--
-- Name: expenses_business_expense_date_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX expenses_business_expense_date_idx ON public.expenses USING btree (business_id, expense_date);


--
-- Name: ingredients_business_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ingredients_business_id_idx ON public.ingredients USING btree (business_id);


--
-- Name: inventory_movements_business_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_movements_business_created_at_idx ON public.inventory_movements USING btree (business_id, created_at, id);


--
-- Name: inventory_movements_ingredient_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX inventory_movements_ingredient_created_at_idx ON public.inventory_movements USING btree (ingredient_id, created_at);


--
-- Name: login_attempts_expires_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX login_attempts_expires_at_idx ON public.login_attempts USING btree (expires_at);


--
-- Name: menu_categories_business_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX menu_categories_business_id_idx ON public.menu_categories USING btree (business_id);


--
-- Name: menu_item_modifier_groups_group_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX menu_item_modifier_groups_group_id_idx ON public.menu_item_modifier_groups USING btree (modifier_group_id);


--
-- Name: menu_item_modifier_groups_menu_item_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX menu_item_modifier_groups_menu_item_id_idx ON public.menu_item_modifier_groups USING btree (menu_item_id);


--
-- Name: menu_item_variants_menu_item_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX menu_item_variants_menu_item_id_idx ON public.menu_item_variants USING btree (menu_item_id);


--
-- Name: menu_items_business_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX menu_items_business_id_idx ON public.menu_items USING btree (business_id);


--
-- Name: modifier_groups_business_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX modifier_groups_business_id_idx ON public.modifier_groups USING btree (business_id);


--
-- Name: modifier_options_group_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX modifier_options_group_id_idx ON public.modifier_options USING btree (modifier_group_id);


--
-- Name: modifier_recipe_lines_ingredient_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX modifier_recipe_lines_ingredient_id_idx ON public.modifier_recipe_lines USING btree (ingredient_id);


--
-- Name: modifier_recipe_lines_option_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX modifier_recipe_lines_option_id_idx ON public.modifier_recipe_lines USING btree (modifier_option_id);


--
-- Name: order_ingredient_consumption_ingredient_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_ingredient_consumption_ingredient_id_idx ON public.order_ingredient_consumption USING btree (ingredient_id);


--
-- Name: order_ingredient_consumption_movement_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_ingredient_consumption_movement_id_idx ON public.order_ingredient_consumption USING btree (inventory_movement_id);


--
-- Name: order_ingredient_consumption_order_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_ingredient_consumption_order_id_idx ON public.order_ingredient_consumption USING btree (order_id);


--
-- Name: order_ingredient_consumption_order_line_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_ingredient_consumption_order_line_id_idx ON public.order_ingredient_consumption USING btree (order_line_id);


--
-- Name: order_line_modifiers_option_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_line_modifiers_option_id_idx ON public.order_line_modifiers USING btree (modifier_option_id);


--
-- Name: order_line_modifiers_order_line_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_line_modifiers_order_line_id_idx ON public.order_line_modifiers USING btree (order_line_id);


--
-- Name: order_lines_menu_item_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_lines_menu_item_id_idx ON public.order_lines USING btree (menu_item_id);


--
-- Name: order_lines_order_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_lines_order_id_idx ON public.order_lines USING btree (order_id);


--
-- Name: order_lines_variant_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX order_lines_variant_id_idx ON public.order_lines USING btree (menu_item_variant_id);


--
-- Name: orders_business_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_business_created_at_idx ON public.orders USING btree (business_id, created_at, id);


--
-- Name: orders_business_idempotency_key_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX orders_business_idempotency_key_idx ON public.orders USING btree (business_id, idempotency_key);


--
-- Name: orders_business_order_number_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX orders_business_order_number_idx ON public.orders USING btree (business_id, order_number);


--
-- Name: print_jobs_attention_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX print_jobs_attention_idx ON public.print_jobs USING btree (created_at) WHERE (status = ANY (ARRAY['FAILED'::public.print_status, 'PROCESSING'::public.print_status]));


--
-- Name: print_jobs_order_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX print_jobs_order_created_at_idx ON public.print_jobs USING btree (order_id, created_at);


--
-- Name: print_jobs_order_request_key_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX print_jobs_order_request_key_idx ON public.print_jobs USING btree (order_id, request_key);


--
-- Name: purchase_lines_ingredient_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX purchase_lines_ingredient_id_idx ON public.purchase_lines USING btree (ingredient_id);


--
-- Name: purchase_lines_purchase_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX purchase_lines_purchase_id_idx ON public.purchase_lines USING btree (purchase_id);


--
-- Name: purchases_business_purchase_date_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX purchases_business_purchase_date_idx ON public.purchases USING btree (business_id, purchase_date);


--
-- Name: recipe_lines_ingredient_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX recipe_lines_ingredient_id_idx ON public.recipe_lines USING btree (ingredient_id);


--
-- Name: recipe_lines_recipe_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX recipe_lines_recipe_id_idx ON public.recipe_lines USING btree (recipe_id);


--
-- Name: recipes_active_variant_version_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX recipes_active_variant_version_idx ON public.recipes USING btree (menu_item_variant_id, version) WHERE active;


--
-- Name: recipes_variant_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX recipes_variant_id_idx ON public.recipes USING btree (menu_item_variant_id);


--
-- Name: sessions_expires_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_expires_at_idx ON public.sessions USING btree (expires_at);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_user_id_idx ON public.sessions USING btree (user_id);


--
-- Name: stock_count_lines_ingredient_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stock_count_lines_ingredient_id_idx ON public.stock_count_lines USING btree (ingredient_id);


--
-- Name: stock_count_lines_stock_count_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX stock_count_lines_stock_count_id_idx ON public.stock_count_lines USING btree (stock_count_id);


--
-- Name: suppliers_business_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX suppliers_business_id_idx ON public.suppliers USING btree (business_id);


--
-- Name: users_business_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_business_id_idx ON public.users USING btree (business_id);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: waste_records_business_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX waste_records_business_created_at_idx ON public.waste_records USING btree (business_id, created_at, id);


--
-- Name: waste_records_ingredient_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX waste_records_ingredient_id_idx ON public.waste_records USING btree (ingredient_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: -
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_action_filter_selec; Type: INDEX; Schema: realtime; Owner: -
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_action_filter_selec ON realtime.subscription USING btree (subscription_id, entity, filters, action_filter, COALESCE(selected_columns, '{}'::text[]));


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_bucket_id_name_lower; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX idx_objects_bucket_id_name_lower ON storage.objects USING btree (bucket_id, lower(name) COLLATE "C");


--
-- Name: idx_objects_current_version; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX idx_objects_current_version ON storage.objects USING btree (bucket_id, name COLLATE "C") WHERE (archived_at IS NULL);


--
-- Name: idx_objects_null_version; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX idx_objects_null_version ON storage.objects USING btree (bucket_id, name COLLATE "C") WHERE (NOT is_versioned);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: -
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_name_version_key; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX objects_bucket_id_name_version_key ON storage.objects USING btree (bucket_id, name COLLATE "C", version) NULLS NOT DISTINCT;


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: -
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: -
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: buckets protect_buckets_delete; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects protect_objects_delete; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: -
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_recovery_code_sets mfa_recovery_code_sets_mfa_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_recovery_code_sets
    ADD CONSTRAINT mfa_recovery_code_sets_mfa_factor_id_fkey FOREIGN KEY (mfa_factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_recovery_code_sets mfa_recovery_code_sets_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_recovery_code_sets
    ADD CONSTRAINT mfa_recovery_code_sets_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_recovery_codes mfa_recovery_codes_mfa_recovery_code_set_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.mfa_recovery_codes
    ADD CONSTRAINT mfa_recovery_codes_mfa_recovery_code_set_id_fkey FOREIGN KEY (mfa_recovery_code_set_id) REFERENCES auth.mfa_recovery_code_sets(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: scim_tokens scim_tokens_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.scim_tokens
    ADD CONSTRAINT scim_tokens_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: scim_users scim_users_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.scim_users
    ADD CONSTRAINT scim_users_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: scim_users scim_users_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.scim_users
    ADD CONSTRAINT scim_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: webauthn_challenges webauthn_challenges_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_challenges
    ADD CONSTRAINT webauthn_challenges_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: webauthn_credentials webauthn_credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: -
--

ALTER TABLE ONLY auth.webauthn_credentials
    ADD CONSTRAINT webauthn_credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: audit_logs audit_logs_actor_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_actor_user_id_users_id_fk FOREIGN KEY (actor_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: audit_logs audit_logs_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: expenses expenses_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: expenses expenses_created_by_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_created_by_users_id_fk FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: expenses expenses_location_id_locations_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_location_id_locations_id_fk FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE SET NULL;


--
-- Name: ingredients ingredients_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: ingredients ingredients_preferred_supplier_id_suppliers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_preferred_supplier_id_suppliers_id_fk FOREIGN KEY (preferred_supplier_id) REFERENCES public.suppliers(id) ON DELETE SET NULL;


--
-- Name: inventory_movements inventory_movements_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_movements
    ADD CONSTRAINT inventory_movements_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: inventory_movements inventory_movements_created_by_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_movements
    ADD CONSTRAINT inventory_movements_created_by_users_id_fk FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: inventory_movements inventory_movements_ingredient_id_ingredients_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_movements
    ADD CONSTRAINT inventory_movements_ingredient_id_ingredients_id_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON DELETE SET NULL;


--
-- Name: inventory_movements inventory_movements_location_id_locations_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_movements
    ADD CONSTRAINT inventory_movements_location_id_locations_id_fk FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE SET NULL;


--
-- Name: locations locations_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: menu_categories menu_categories_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: menu_item_modifier_groups menu_item_modifier_groups_menu_item_id_menu_items_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_item_modifier_groups
    ADD CONSTRAINT menu_item_modifier_groups_menu_item_id_menu_items_id_fk FOREIGN KEY (menu_item_id) REFERENCES public.menu_items(id) ON DELETE CASCADE;


--
-- Name: menu_item_modifier_groups menu_item_modifier_groups_modifier_group_id_modifier_groups_id_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_item_modifier_groups
    ADD CONSTRAINT menu_item_modifier_groups_modifier_group_id_modifier_groups_id_ FOREIGN KEY (modifier_group_id) REFERENCES public.modifier_groups(id) ON DELETE CASCADE;


--
-- Name: menu_item_variants menu_item_variants_menu_item_id_menu_items_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_item_variants
    ADD CONSTRAINT menu_item_variants_menu_item_id_menu_items_id_fk FOREIGN KEY (menu_item_id) REFERENCES public.menu_items(id) ON DELETE CASCADE;


--
-- Name: menu_items menu_items_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: menu_items menu_items_category_id_menu_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_menu_categories_id_fk FOREIGN KEY (category_id) REFERENCES public.menu_categories(id) ON DELETE SET NULL;


--
-- Name: modifier_groups modifier_groups_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_groups
    ADD CONSTRAINT modifier_groups_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: modifier_options modifier_options_modifier_group_id_modifier_groups_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_options
    ADD CONSTRAINT modifier_options_modifier_group_id_modifier_groups_id_fk FOREIGN KEY (modifier_group_id) REFERENCES public.modifier_groups(id) ON DELETE CASCADE;


--
-- Name: modifier_recipe_lines modifier_recipe_lines_ingredient_id_ingredients_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_recipe_lines
    ADD CONSTRAINT modifier_recipe_lines_ingredient_id_ingredients_id_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON DELETE CASCADE;


--
-- Name: modifier_recipe_lines modifier_recipe_lines_modifier_option_id_modifier_options_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifier_recipe_lines
    ADD CONSTRAINT modifier_recipe_lines_modifier_option_id_modifier_options_id_fk FOREIGN KEY (modifier_option_id) REFERENCES public.modifier_options(id) ON DELETE CASCADE;


--
-- Name: order_ingredient_consumption order_ingredient_consumption_ingredient_id_ingredients_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_ingredient_consumption
    ADD CONSTRAINT order_ingredient_consumption_ingredient_id_ingredients_id_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON DELETE SET NULL;


--
-- Name: order_ingredient_consumption order_ingredient_consumption_inventory_movement_id_inventory_mo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_ingredient_consumption
    ADD CONSTRAINT order_ingredient_consumption_inventory_movement_id_inventory_mo FOREIGN KEY (inventory_movement_id) REFERENCES public.inventory_movements(id) ON DELETE SET NULL;


--
-- Name: order_ingredient_consumption order_ingredient_consumption_order_id_orders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_ingredient_consumption
    ADD CONSTRAINT order_ingredient_consumption_order_id_orders_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_ingredient_consumption order_ingredient_consumption_order_line_id_order_lines_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_ingredient_consumption
    ADD CONSTRAINT order_ingredient_consumption_order_line_id_order_lines_id_fk FOREIGN KEY (order_line_id) REFERENCES public.order_lines(id) ON DELETE CASCADE;


--
-- Name: order_line_modifiers order_line_modifiers_modifier_option_id_modifier_options_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_line_modifiers
    ADD CONSTRAINT order_line_modifiers_modifier_option_id_modifier_options_id_fk FOREIGN KEY (modifier_option_id) REFERENCES public.modifier_options(id) ON DELETE SET NULL;


--
-- Name: order_line_modifiers order_line_modifiers_order_line_id_order_lines_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_line_modifiers
    ADD CONSTRAINT order_line_modifiers_order_line_id_order_lines_id_fk FOREIGN KEY (order_line_id) REFERENCES public.order_lines(id) ON DELETE CASCADE;


--
-- Name: order_lines order_lines_menu_item_id_menu_items_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_lines
    ADD CONSTRAINT order_lines_menu_item_id_menu_items_id_fk FOREIGN KEY (menu_item_id) REFERENCES public.menu_items(id) ON DELETE SET NULL;


--
-- Name: order_lines order_lines_menu_item_variant_id_menu_item_variants_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_lines
    ADD CONSTRAINT order_lines_menu_item_variant_id_menu_item_variants_id_fk FOREIGN KEY (menu_item_variant_id) REFERENCES public.menu_item_variants(id) ON DELETE SET NULL;


--
-- Name: order_lines order_lines_order_id_orders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_lines
    ADD CONSTRAINT order_lines_order_id_orders_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_number_counters order_number_counters_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_number_counters
    ADD CONSTRAINT order_number_counters_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: orders orders_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: orders orders_cancelled_by_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_cancelled_by_users_id_fk FOREIGN KEY (cancelled_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: orders orders_created_by_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_created_by_users_id_fk FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: orders orders_location_id_locations_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_location_id_locations_id_fk FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE SET NULL;


--
-- Name: orders orders_refunded_by_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_refunded_by_users_id_fk FOREIGN KEY (refunded_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: print_jobs print_jobs_order_id_orders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_jobs
    ADD CONSTRAINT print_jobs_order_id_orders_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: print_jobs print_jobs_requested_by_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_jobs
    ADD CONSTRAINT print_jobs_requested_by_users_id_fk FOREIGN KEY (requested_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: purchase_lines purchase_lines_ingredient_id_ingredients_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_lines
    ADD CONSTRAINT purchase_lines_ingredient_id_ingredients_id_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON DELETE SET NULL;


--
-- Name: purchase_lines purchase_lines_purchase_id_purchases_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_lines
    ADD CONSTRAINT purchase_lines_purchase_id_purchases_id_fk FOREIGN KEY (purchase_id) REFERENCES public.purchases(id) ON DELETE CASCADE;


--
-- Name: purchases purchases_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: purchases purchases_created_by_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_created_by_users_id_fk FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: purchases purchases_location_id_locations_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_location_id_locations_id_fk FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE SET NULL;


--
-- Name: purchases purchases_supplier_id_suppliers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_supplier_id_suppliers_id_fk FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id) ON DELETE SET NULL;


--
-- Name: recipe_lines recipe_lines_ingredient_id_ingredients_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_lines
    ADD CONSTRAINT recipe_lines_ingredient_id_ingredients_id_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON DELETE CASCADE;


--
-- Name: recipe_lines recipe_lines_recipe_id_recipes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipe_lines
    ADD CONSTRAINT recipe_lines_recipe_id_recipes_id_fk FOREIGN KEY (recipe_id) REFERENCES public.recipes(id) ON DELETE CASCADE;


--
-- Name: recipes recipes_created_by_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_created_by_users_id_fk FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: recipes recipes_menu_item_variant_id_menu_item_variants_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_menu_item_variant_id_menu_item_variants_id_fk FOREIGN KEY (menu_item_variant_id) REFERENCES public.menu_item_variants(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: stock_count_lines stock_count_lines_ingredient_id_ingredients_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_count_lines
    ADD CONSTRAINT stock_count_lines_ingredient_id_ingredients_id_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON DELETE SET NULL;


--
-- Name: stock_count_lines stock_count_lines_stock_count_id_stock_counts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_count_lines
    ADD CONSTRAINT stock_count_lines_stock_count_id_stock_counts_id_fk FOREIGN KEY (stock_count_id) REFERENCES public.stock_counts(id) ON DELETE CASCADE;


--
-- Name: stock_counts stock_counts_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_counts
    ADD CONSTRAINT stock_counts_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: stock_counts stock_counts_counted_by_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_counts
    ADD CONSTRAINT stock_counts_counted_by_users_id_fk FOREIGN KEY (counted_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: stock_counts stock_counts_location_id_locations_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_counts
    ADD CONSTRAINT stock_counts_location_id_locations_id_fk FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE SET NULL;


--
-- Name: suppliers suppliers_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: user_roles user_roles_role_id_roles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_roles_id_fk FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE RESTRICT;


--
-- Name: user_roles user_roles_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: waste_records waste_records_business_id_businesses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.waste_records
    ADD CONSTRAINT waste_records_business_id_businesses_id_fk FOREIGN KEY (business_id) REFERENCES public.businesses(id) ON DELETE RESTRICT;


--
-- Name: waste_records waste_records_created_by_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.waste_records
    ADD CONSTRAINT waste_records_created_by_users_id_fk FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: waste_records waste_records_ingredient_id_ingredients_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.waste_records
    ADD CONSTRAINT waste_records_ingredient_id_ingredients_id_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON DELETE SET NULL;


--
-- Name: waste_records waste_records_location_id_locations_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.waste_records
    ADD CONSTRAINT waste_records_location_id_locations_id_fk FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE SET NULL;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: -
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: __drizzle_migrations; Type: ROW SECURITY; Schema: drizzle; Owner: -
--

ALTER TABLE drizzle.__drizzle_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: order_number_counters; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.order_number_counters ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: -
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: -
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: -
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: -
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


--
-- PostgreSQL database dump complete
--

\unrestrict egmuJpd7SE7u4VzDnFObFuFwd7G31fRma0n1Z15EgyQg8DThPeYZsLTFGhseD9J

