# Cost Controls

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed


> **Historical design record.** This document captures the original Phase 1 decisions and is intentionally preserved as project history. The implementation subsequently progressed to a completed portfolio-ready MVP. See the [main README](../README.md) for the current project state and demonstrated capabilities.

---

## 1. Cost-Control Principles

- Use small sample data.
- Avoid always-on compute unless required.
- Avoid Databricks and Synapse for this MVP.
- Avoid Dedicated SQL Pools.
- Avoid Spark Pools.
- Use ADF only for small controlled runs.
- Use Log Analytics with modest ingestion.
- Use GitHub Actions initially for Bicep validation rather than heavy automated deployment.
- Clean up resources after evidence capture unless intentionally preserved.
- Document what is kept and why.

---

## 2. Explicitly Avoided Services

The MVP avoids:

- Dedicated SQL Pool
- Spark Pool
- Databricks clusters
- Synapse workspace
- Large streaming services
- Large-scale storage
- Always-on compute
- Complex networking components unless added intentionally
