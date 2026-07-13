CREATE OR REPLACE TABLE FACT_CLAIMS AS
SELECT
    c.claim_id,
    p.policy_id,
    p.customer_id,
    c.claim_status,
    c.claim_amount,
    c.claim_date,
    p.premium_amount,
    CASE
        WHEN c.claim_amount > p.premium_amount THEN 'HIGH_CLAIM'
        WHEN c.claim_amount > 0 THEN 'NORMAL_CLAIM'
        ELSE 'NO_CLAIM'
    END AS claim_category,
    CURRENT_TIMESTAMP() AS dw_created_at
FROM STG_CLAIMS c
LEFT JOIN STG_POLICIES p
    ON c.policy_id = p.policy_id;
