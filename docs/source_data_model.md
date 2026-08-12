# Source Data Model

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 1 — Architecture and Scope Definition  
**Status:** MVP decisions confirmed

---

## 1. Purpose

This project uses a small retail/order-processing dataset to preserve continuity with previous portfolio projects.

The value of the project is production readiness, not data volume.

---

## 2. Confirmed Source File Strategy

Source files will be small CSV files uploaded through a script.

Sample folder:

```text
sample-data/incoming/
```

Candidate files:

```text
orders_YYYYMMDD.csv
payments_YYYYMMDD.csv
order_items_YYYYMMDD.csv
```

---

## 3. Orders File

| Column | Type | Description |
|---|---|---|
| `order_id` | string/int | Business order identifier |
| `customer_id` | string/int | Customer identifier |
| `order_date` | date | Order date |
| `order_status` | string | Order lifecycle status |
| `order_total` | decimal | Order total amount |
| `source_file_name` | string | Source file name for traceability |

Allowed statuses:

```text
PENDING
PAID
COMPLETED
CANCELLED
REFUNDED
```

---

## 4. Payments File

| Column | Type | Description |
|---|---|---|
| `payment_id` | string/int | Payment identifier |
| `order_id` | string/int | Related order |
| `payment_date` | date | Payment date |
| `payment_status` | string | Payment lifecycle status |
| `payment_amount` | decimal | Payment amount |
| `source_file_name` | string | Source file name for traceability |

Allowed statuses:

```text
PENDING
APPROVED
DECLINED
REFUNDED
```

---

## 5. Order Items File

| Column | Type | Description |
|---|---|---|
| `order_item_id` | string/int | Order item identifier |
| `order_id` | string/int | Related order |
| `product_id` | string/int | Product identifier |
| `quantity` | int | Quantity ordered |
| `unit_price` | decimal | Unit price |
| `line_total` | decimal | Quantity multiplied by unit price |
| `source_file_name` | string | Source file name for traceability |

---

## 6. Confirmed Validation Behavior

The MVP uses:

```text
Bad rows to rejected + controlled pipeline status.
```

Invalid records should be visible through:

```text
datalake/rejected/
```

and operational traceability should be visible through:

```text
datalake/audit/
Azure Data Factory Monitor
Log Analytics
```
