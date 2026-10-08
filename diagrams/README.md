# Visual Package

This directory contains the visual layer for the Production-Ready Azure Data Pipeline.

The package follows the portfolio-wide visual standard while preserving this project's identity around **security, Infrastructure as Code, observability, failure handling, and operational readiness**.

## Assets

```text
diagrams/
├── banner.jpg
├── 01_production_readiness_architecture.jpg
└── 02_observability_failure_alerting.jpg
```

| Asset | Role |
|---|---|
| `banner.jpg` | README hero / first visual impression |
| `01_production_readiness_architecture.jpg` | Implemented architecture and operational-control overview |
| `02_observability_failure_alerting.jpg` | Controlled failure → telemetry → KQL → alert → notification flow |

## Visual discipline

- The banner establishes project identity without acting as implementation evidence.
- The architecture diagram summarizes only capabilities implemented in this MVP.
- The observability diagram focuses on the strongest operational proof chain in the repository.
- Portal screenshots remain under `evidence/`; conceptual visuals remain here.
- Visuals must not imply Databricks, Synapse, Power BI, full CI/CD deployment, private networking, or other capabilities outside the implemented project scope.

## Portfolio consistency

The visual language intentionally aligns with the later Azure portfolio repositories:

- dark navy / near-black foundation;
- cyan / teal Azure-oriented accents;
- selective orange for alert/failure states;
- high contrast;
- minimal visual noise;
- one engineering story per image.

The goal is a recognizable portfolio family, not identical covers.
