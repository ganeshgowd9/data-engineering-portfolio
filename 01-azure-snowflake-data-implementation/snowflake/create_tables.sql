CREATE OR REPLACE TABLE RAW_CUSTOMER_CLAIMS (
    customer_id NUMBER,
    customer_name STRING,
    province STRING,
    policy_id STRING,
    claim_amount NUMBER(12, 2),
    claim_status STRING,
    updated_at DATE,
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE REPORTING_CUSTOMER_CLAIMS (
    customer_id NUMBER,
    customer_name STRING,
    province STRING,
    policy_id STRING,
    claim_amount NUMBER(12, 2),
    claim_status STRING,
    claim_flag STRING,
    updated_at DATE,
    reporting_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);
