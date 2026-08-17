# Final Repository QA Checklist

**Project:** `production-ready-azure-data-pipeline`

---

## 1. Git Status

Run:

```powershell
git status
```

Expected:

```text
nothing to commit, working tree clean
```

---

## 2. Secret Scan Checklist

Manually inspect public files for:

- Storage account keys
- SAS tokens
- Connection strings
- Passwords
- Client secrets
- Tenant IDs
- Subscription IDs
- Object IDs
- Personal emails
- Phone numbers
- Full alert URLs with subscription identifiers

Recommended searches in VS Code:

```text
AccountKey
SharedAccessSignature
sig=
DefaultEndpointsProtocol
client_secret
password
tenant
subscription
gmail
hotmail
```

---

## 3. Evidence QA

Evidence should show:

| Area | Evidence |
|---|---|
| Resource setup | Azure resources created |
| Security | Managed Identity, RBAC, linked services |
| Pipeline execution | Pipeline success and Bronze output |
| Monitoring | KQL queries over AzureDiagnostics |
| Failure diagnostics | Controlled failure and error details |
| Alerting | Alert fired, SMS/email notification |
| Cost controls | Cost-aware resource decisions |

---

## 4. Public Claims QA

Safe claims:

- Small ADF ingestion pipeline
- ADLS Gen2 landing and Bronze layout
- Managed Identity access
- Key Vault linked service
- Bicep IaC baseline
- GitHub Actions Bicep validation
- Log Analytics monitoring
- KQL operational queries
- Controlled failure diagnostics
- Azure Monitor alerting with Action Group notification

Avoid claiming:

- Enterprise-grade production deployment
- Full CI/CD deployment automation if only validation was implemented
- Full multi-environment strategy
- Private networking
- Microsoft Purview governance
- Databricks/Synapse processing
- Real-time streaming
