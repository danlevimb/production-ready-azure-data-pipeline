# Evidence

This directory contains public-safe validation evidence for the Production-Ready Azure Data Pipeline.

Evidence supports the engineering claims in the README and technical documentation. It is not a substitute for the implementation itself.

## Evidence areas

The repository organizes proof around:

- resource setup;
- security and identity;
- pipeline execution;
- monitoring;
- controlled failure diagnostics;
- alerting and notification;
- cost / cleanup decisions;
- final review.

See [../docs/evidence_index.md](../docs/evidence_index.md) for the detailed claims-to-evidence index.

## Public-safety rules

Do not publish screenshots or files exposing:

- Subscription IDs
- Tenant IDs
- Object IDs
- Principal IDs
- personal email addresses
- phone numbers unless intentionally redacted
- secrets
- account keys
- SAS tokens
- connection strings
- client secrets
- full portal URLs containing sensitive identifiers

## Evidence discipline

Every published artifact should:

1. prove a specific project claim;
2. preserve enough Azure context to be technically meaningful;
3. avoid duplicate proof;
4. remove unnecessary personal or account-identifying information;
5. remain consistent with the project's documented scope boundaries.

The strongest proof in this project is the chain from controlled failure → Log Analytics telemetry → KQL diagnosis → Azure Monitor alert → Action Group notification.
