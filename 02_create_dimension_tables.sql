def extract():
    return [
        {"customer_id": 1001, "amount": 1200.50},
        {"customer_id": 1002, "amount": 980.00},
    ]

def transform(rows):
    transformed = []
    for row in rows:
        transformed.append({
            "customer_id": row["customer_id"],
            "amount": row["amount"],
            "amount_category": "HIGH" if row["amount"] >= 1000 else "NORMAL"
        })
    return transformed

def load(rows):
    print(f"Loaded {len(rows)} records into reporting layer.")

def main():
    raw_rows = extract()
    curated_rows = transform(raw_rows)
    load(curated_rows)

if __name__ == "__main__":
    main()
