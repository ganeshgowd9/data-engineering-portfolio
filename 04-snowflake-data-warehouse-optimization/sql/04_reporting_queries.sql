-- Claims summary by province
SELECT
    dc.province,
    fc.claim_status,
    COUNT(*) AS claim_count,
    SUM(fc.claim_amount) AS total_claim_amount,
    AVG(fc.claim_amount) AS avg_claim_amount
FROM FACT_CLAIMS fc
LEFT JOIN DIM_CUSTOMER dc
    ON fc.customer_id = dc.customer_id
GROUP BY dc.province, fc.claim_status
ORDER BY dc.province, fc.claim_status;

-- High-value claims
SELECT
    claim_id,
    policy_id,
    customer_id,
    claim_amount,
    claim_category
FROM FACT_CLAIMS
WHERE claim_category = 'HIGH_CLAIM'
ORDER BY claim_amount DESC;
