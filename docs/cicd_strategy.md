# CI/CD Strategy

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed


> **Historical design record.** This document captures the original Phase 1 decisions and is intentionally preserved as project history. The implementation subsequently progressed to a completed portfolio-ready MVP. See the [main README](../README.md) for the current project state and demonstrated capabilities.

---

## 1. CI/CD Tool

Confirmed tool:

```text
GitHub Actions
```

---

## 2. Confirmed MVP Scope

The MVP starts with:

```text
GitHub Actions with Bicep validation first.
```

Full automated deployment can be added later or documented as a future improvement.

---

## 3. Candidate Workflow Responsibilities

The first workflow may:

- Validate repository structure
- Validate Bicep syntax
- Optionally run Bicep build
- Optionally run a what-if deployment
- Document manual deployment boundaries
- Publish workflow evidence

---

## 4. Initial MVP Flow

```text
Push to GitHub
        ↓
GitHub Actions workflow
        ↓
Bicep validation
        ↓
Manual or documented deployment
```
