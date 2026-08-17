# Cost Review and Cleanup Decision

**Project:** `production-ready-azure-data-pipeline`

---

## 1. Purpose

This document records the cost-aware decision at project closeout.

The project used small MVP resources, but some resources may continue to generate small charges if left active.

---

## 2. Resources to Review

| Resource | Example Name | Keep? | Notes |
|---|---|---|---|
| Resource group | `rg-prdp-dev` | TBD | Main project boundary |
| Data Factory | `adf-prdp-dev-geq2n4` | TBD | May have minimal cost when idle |
| Storage account | `stprdpdevgeq2n4khizfxo` | TBD | Small storage cost |
| Key Vault | `kv-prdp-dev-geq2n4` | TBD | Low cost but not free in all usage patterns |
| Log Analytics | `law-prdp-dev-geq2n4` | TBD | Cost depends on ingestion/retention |
| Alert rule | `alert-prdp-adf-pipeline-failure` | TBD | Estimated around low monthly cost |
| Action group | `ag-prdp-dev-alerts` / `prdpalert` | TBD | Notification costs may vary by channel |

---

## 3. Recommended MVP Decision

Recommended short-term decision:

```text
Keep resources active temporarily until final public repo review, roadmap update, and portfolio positioning are complete.
```

Recommended final closeout decision:

```text
Delete or disable anything that generates recurring cost unless intentionally preserved for demos.
```

---

## 4. Alert Rule Decision

Possible decisions:

### Option A — Keep Alert Temporarily

Pros:

- Allows demo/retest.
- Preserves live alert evidence.
- Useful while project is under final review.

Cons:

- May generate monthly cost.

### Option B — Disable Alert Rule

Pros:

- Preserves configuration without evaluating.
- Reduces risk of unnecessary notifications.
- Useful if you want to keep the resource visible.

Cons:

- May still need to confirm billing behavior.

### Option C — Delete Alert Rule

Pros:

- Clean cost control.
- Strong closeout hygiene.

Cons:

- Removes live demo capability.

Recommended:

```text
Keep temporarily during final closeout. Disable or delete after evidence is safely committed.
```

---

## 5. Final Cleanup Record Template

```text
Cleanup date:
YYYY-MM-DD

Deleted resources:
- [resource]

Disabled resources:
- [resource]

Preserved resources:
- [resource]
- reason

Cost-control note:
Resources were cleaned up or intentionally preserved after evidence capture.
```
