CREATE OR REPLACE TABLE DIM_CUSTOMER AS
SELECT
    customer_id,
    customer_name,
    province,
    created_at,
    CURRENT_TIMESTAMP() AS dw_created_at
FROM STG_CUSTOMERS;

CREATE OR REPLACE TABLE DIM_POLICY AS
SELECT
    policy_id,
    customer_id,
    policy_type,
    premium_amount,
    policy_start_date,
    policy_end_date,
    CURRENT_TIMESTAMP() AS dw_created_at
FROM STG_POLICIES;
