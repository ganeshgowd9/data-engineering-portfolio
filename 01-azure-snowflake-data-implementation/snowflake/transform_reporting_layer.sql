INSERT INTO REPORTING_CUSTOMER_CLAIMS (
    customer_id,
    customer_name,
    province,
    policy_id,
    claim_amount,
    claim_status,
    claim_flag,
    updated_at
)
SELECT
    customer_id,
    customer_name,
    province,
    policy_id,
    claim_amount,
    claim_status,
    CASE
        WHEN claim_amount > 0 THEN 'CLAIM_ACTIVITY'
        ELSE 'NO_CLAIM_ACTIVITY'
    END AS claim_flag,
    updated_at
FROM RAW_CUSTOMER_CLAIMS
WHERE customer_id IS NOT NULL;
