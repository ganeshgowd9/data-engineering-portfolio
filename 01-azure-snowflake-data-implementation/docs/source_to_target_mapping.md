# Source-to-Target Mapping

| Source Column | Target Column | Rule |
|---|---|---|
| customer_id | customer_id | Cast to NUMBER |
| customer_name | customer_name | Trim spaces |
| province | province | Standardize province code |
| policy_id | policy_id | Direct mapping |
| claim_amount | claim_amount | Cast to NUMBER(12,2) |
| claim_status | claim_status | Validate status list |
| updated_at | updated_at | Cast to DATE |
| claim_amount | claim_flag | Derive claim activity flag |
