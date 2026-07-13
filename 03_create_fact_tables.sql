CREATE TABLE IF NOT EXISTS reporting_customer_amounts (
    customer_id INT,
    amount DECIMAL(12, 2),
    amount_category VARCHAR(20),
    created_at TIMESTAMP
);
