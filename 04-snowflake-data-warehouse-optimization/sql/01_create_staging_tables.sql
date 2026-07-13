CREATE OR REPLACE TABLE STG_CUSTOMERS (
    customer_id NUMBER,
    customer_name STRING,
    province STRING,
    created_at DATE
);

CREATE OR REPLACE TABLE STG_POLICIES (
    policy_id STRING,
    customer_id NUMBER,
    policy_type STRING,
    premium_amount NUMBER(12, 2),
    policy_start_date DATE,
    policy_end_date DATE
);

CREATE OR REPLACE TABLE STG_CLAIMS (
    claim_id STRING,
    policy_id STRING,
    claim_status STRING,
    claim_amount NUMBER(12, 2),
    claim_date DATE
);
