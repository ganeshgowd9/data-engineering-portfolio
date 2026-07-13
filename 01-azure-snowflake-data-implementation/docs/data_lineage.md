# Data Lineage

Source Systems / Files
→ Azure Data Factory
→ Azure Data Lake Raw Zone
→ Python / Databricks Validation
→ Curated Dataset
→ Snowflake Reporting Tables
→ Power BI / Analytics / Business Reporting

## Governance Notes
- Source-to-target mappings documented.
- Validation runs before reporting-layer load.
- Data ownership and definitions should be maintained in a catalog.
- Failed records should be logged and reviewed before reprocessing.
