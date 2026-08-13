# Sample Data Dictionary

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 5 — Sample Data and Scripted Upload

---

## 1. Purpose

This document describes the sample CSV files used by the production-ready Azure data pipeline.

The dataset is intentionally small. The goal is production-readiness practice, not data volume.

---

## 2. Orders

File: `orders_20260812.csv`

| Column | Description |
|---|---|
| `order_id` | Business order identifier |
| `customer_id` | Customer identifier |
| `order_date` | Order date |
| `order_status` | Order lifecycle status |
| `order_total` | Order total amount |
| `source_file_name` | Source file name for traceability |

Allowed status examples: `PAID`, `COMPLETED`, `PENDING`, `CANCELLED`, `REFUNDED`.

---

## 3. Payments

File: `payments_20260812.csv`

| Column | Description |
|---|---|
| `payment_id` | Payment identifier |
| `order_id` | Related order |
| `payment_date` | Payment date |
| `payment_status` | Payment lifecycle status |
| `payment_amount` | Payment amount |
| `source_file_name` | Source file name for traceability |

Allowed status examples: `APPROVED`, `PENDING`, `DECLINED`, `REFUNDED`.

---

## 4. Order Items

File: `order_items_20260812.csv`

| Column | Description |
|---|---|
| `order_item_id` | Order item identifier |
| `order_id` | Related order |
| `product_id` | Product identifier |
| `quantity` | Quantity ordered |
| `unit_price` | Unit price |
| `line_total` | Quantity multiplied by unit price |
| `source_file_name` | Source file name for traceability |

---

## 5. Invalid Test File

File: `orders_invalid_20260812.csv`

This file intentionally includes bad rows for future validation and rejected-record testing:

- Invalid order status.
- Negative order total.
- Missing `order_id`.

This file should not be used as the default happy-path input.
