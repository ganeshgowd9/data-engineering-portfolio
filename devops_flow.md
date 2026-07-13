# Data Quality Rules Catalog

| Rule Name | Description | Severity |
|---|---|---|
| Required Columns | Ensures expected schema is present | High |
| Null Check | Ensures key fields are populated | High |
| Duplicate Key Check | Prevents duplicate business keys | High |
| Accepted Values | Validates business status values | Medium |
| Numeric Range | Ensures numeric values are within valid range | Medium |

## Example Use Cases

- Validate raw files before ETL processing.
- Stop bad data before Snowflake reporting loads.
- Create reusable checks for multiple datasets.
- Support audit, governance, and production reliability.
