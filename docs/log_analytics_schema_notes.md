# Log Analytics Schema Notes

**Project:** `production-ready-azure-data-pipeline`  
**Phase:** 7 — Monitoring and Observability  
**Source file reviewed:** `query_data(1).csv`

---

## 1. Purpose

This document summarizes the relevant Log Analytics columns observed in the exported schema.

The schema indicates an `AzureDiagnostics`-style logging model.

---

## 2. General Columns

| Column | Purpose |
|---|---|
| `TimeGenerated` | Time when the log record was generated |
| `ResourceId` | Azure resource ID |
| `Category` | Log category, such as pipeline/activity related category |
| `ResourceGroup` | Resource group name |
| `SubscriptionId` | Azure subscription identifier |
| `ResourceProvider` | Azure provider |
| `Resource` | Resource name |
| `ResourceType` | Resource type |
| `OperationName` | Operation represented by the log record |
| `ResultType` | General result type |
| `CorrelationId` | Correlation identifier |

---

## 3. ADF Pipeline Columns

| Column | Purpose |
|---|---|
| `pipelineName_s` | ADF pipeline name |
| `runId_g` | Pipeline run ID |
| `status_s` | Pipeline or activity status |
| `start_t` | Start time |
| `end_t` | End time |
| `Parameters_p_load_date_s` | Captured pipeline parameter `p_load_date` |
| `Parameters_p_source_system_s` | Captured pipeline parameter `p_source_system` |

---

## 4. ADF Activity Columns

| Column | Purpose |
|---|---|
| `activityName_s` | ADF activity name |
| `activityType_s` | ADF activity type |
| `activityRunId_g` | Activity run ID |
| `pipelineRunId_g` | Parent pipeline run ID |
| `activityRetryCount_d` | Retry count |
| `activityIterationCount_d` | Iteration count, useful for ForEach-related activity logs |

---

## 5. Copy Activity Output Columns

| Column | Purpose |
|---|---|
| `Output_dataRead_d` | Bytes or units read by Copy activity |
| `Output_dataWritten_d` | Bytes or units written by Copy activity |
| `Output_filesRead_d` | Files read |
| `Output_filesWritten_d` | Files written |
| `Output_copyDuration_d` | Copy duration |
| `Output_throughput_d` | Copy throughput |
| `Output_usedDataIntegrationUnits_d` | DIUs used |
| `Output_usedParallelCopies_d` | Parallel copies used |
| `Output_errors_s` | Copy activity output errors, if any |

---

## 6. Error Columns

| Column | Purpose |
|---|---|
| `Error_errorCode_s` | Error code |
| `Error_message_s` | Error message |
| `Error_failureType_s` | Failure type |
| `Error_target_s` | Failed target |

---

## 7. Design Note

Because the exported schema includes `AzureDiagnostics`-style suffixed columns, this project should use KQL queries against:

```kusto
AzureDiagnostics
```

with filters on:

```kusto
Category
pipelineName_s
activityName_s
pipelineRunId_g
runId_g
```
