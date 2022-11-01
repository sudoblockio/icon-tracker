#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
CREATE USER "icon-admin" WITH PASSWORD '$ICON_ADMIN_PASSWORD';
CREATE USER "icon-worker" WITH PASSWORD '$ICON_WORKER_PASSWORD';
CREATE USER "icon-api" WITH PASSWORD '$ICON_API_PASSWORD';
CREATE DATABASE mainnet_contracts_v2 OWNER "icon-admin";
\c mainnet_contracts_v2
GRANT CONNECT ON DATABASE mainnet_contracts_v2 TO "icon-worker";
GRANT USAGE ON SCHEMA public TO "icon-worker";
GRANT ALL ON ALL TABLES IN SCHEMA public TO "icon-worker";
GRANT CONNECT ON DATABASE mainnet_contracts_v2 TO "icon-api";
GRANT USAGE ON SCHEMA public TO "icon-api";
GRANT SELECT ON ALL TABLES IN SCHEMA public TO "icon-api";
CREATE DATABASE mainnet_extractor_v2 OWNER "icon-admin";
\c mainnet_extractor_v2
GRANT CONNECT ON DATABASE mainnet_extractor_v2 TO "icon-worker";
GRANT USAGE ON SCHEMA public TO "icon-worker";
GRANT ALL ON ALL TABLES IN SCHEMA public TO "icon-worker";
GRANT CONNECT ON DATABASE mainnet_extractor_v2 TO "icon-api";
GRANT USAGE ON SCHEMA public TO "icon-api";
GRANT SELECT ON ALL TABLES IN SCHEMA public TO "icon-api";
CREATE DATABASE mainnet_governance_v2 OWNER "icon-admin";
\c mainnet_governance_v2
GRANT CONNECT ON DATABASE mainnet_governance_v2 TO "icon-worker";
GRANT USAGE ON SCHEMA public TO "icon-worker";
GRANT ALL ON ALL TABLES IN SCHEMA public TO "icon-worker";
GRANT CONNECT ON DATABASE mainnet_governance_v2 TO "icon-api";
GRANT USAGE ON SCHEMA public TO "icon-api";
GRANT SELECT ON ALL TABLES IN SCHEMA public TO "icon-api";
CREATE DATABASE mainnet_metrics_v2 OWNER "icon-admin";
\c mainnet_metrics_v2
GRANT CONNECT ON DATABASE mainnet_metrics_v2 TO "icon-worker";
GRANT USAGE ON SCHEMA public TO "icon-worker";
GRANT ALL ON ALL TABLES IN SCHEMA public TO "icon-worker";
GRANT CONNECT ON DATABASE mainnet_metrics_v2 TO "icon-api";
GRANT USAGE ON SCHEMA public TO "icon-api";
GRANT SELECT ON ALL TABLES IN SCHEMA public TO "icon-api";
CREATE DATABASE mainnet_transformer_v2 OWNER "icon-admin";
\c mainnet_transformer_v2
GRANT CONNECT ON DATABASE mainnet_transformer_v2 TO "icon-worker";
GRANT USAGE ON SCHEMA public TO "icon-worker";
GRANT ALL ON ALL TABLES IN SCHEMA public TO "icon-worker";
GRANT CONNECT ON DATABASE mainnet_transformer_v2 TO "icon-api";
GRANT USAGE ON SCHEMA public TO "icon-api";
GRANT SELECT ON ALL TABLES IN SCHEMA public TO "icon-api";
EOSQL
