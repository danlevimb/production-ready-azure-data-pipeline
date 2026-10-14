# Evidence

This directory contains validation evidence for the Production-Ready Azure Data Pipeline.

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

## Evidence discipline

Every published artifact should:

1. prove a specific project claim;
2. preserve enough Azure context to be technically meaningful;
3. avoid duplicate proof;
4. remain consistent with the project's documented scope boundaries.

The strongest proof in this project is the chain from controlled failure → Log Analytics telemetry → KQL diagnosis → Azure Monitor alert → Action Group notification.
