import csv
from pathlib import Path

REQUIRED_COLUMNS = {
    "customer_id", "customer_name", "province", "policy_id",
    "claim_amount", "claim_status", "updated_at"
}
VALID_STATUSES = {"Approved", "Pending", "Rejected", "No Claim"}

def read_csv(path: Path):
    with path.open("r", encoding="utf-8") as file:
        return list(csv.DictReader(file))

def validate_schema(rows):
    if not rows:
        raise ValueError("Input file is empty.")
    missing = REQUIRED_COLUMNS - set(rows[0].keys())
    if missing:
        raise ValueError(f"Missing required columns: {missing}")

def validate_records(rows):
    errors = []
    seen_customer_ids = set()

    for index, row in enumerate(rows, start=2):
        customer_id = row.get("customer_id", "").strip()
        claim_status = row.get("claim_status", "").strip()

        if not customer_id:
            errors.append(f"Row {index}: customer_id is missing.")

        if customer_id in seen_customer_ids:
            errors.append(f"Row {index}: duplicate customer_id {customer_id}.")
        seen_customer_ids.add(customer_id)

        if claim_status not in VALID_STATUSES:
            errors.append(f"Row {index}: invalid claim_status {claim_status}.")

        try:
            claim_amount = float(row.get("claim_amount", 0))
            if claim_amount < 0:
                errors.append(f"Row {index}: claim_amount cannot be negative.")
        except ValueError:
            errors.append(f"Row {index}: claim_amount is not numeric.")

    return errors

def main():
    input_path = Path(__file__).resolve().parents[1] / "data" / "sample_customers.csv"
    rows = read_csv(input_path)
    validate_schema(rows)
    errors = validate_records(rows)

    print(f"Records processed: {len(rows)}")
    if errors:
        print("Validation failed:")
        for error in errors:
            print(f"- {error}")
        raise SystemExit(1)

    print("Validation passed. Dataset is ready for transformation.")

if __name__ == "__main__":
    main()
