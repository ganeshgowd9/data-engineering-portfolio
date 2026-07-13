import json
from pathlib import Path

VALID_STATUSES = {"Submitted", "Approved", "Rejected", "Pending"}

def validate_event(event):
    required_fields = {
        "event_id", "claim_id", "customer_id", "province",
        "claim_amount", "claim_status", "event_time"
    }

    missing = required_fields - set(event.keys())
    if missing:
        return False, f"Missing fields: {missing}"

    if event["claim_status"] not in VALID_STATUSES:
        return False, "Invalid claim status"

    if float(event["claim_amount"]) < 0:
        return False, "Claim amount cannot be negative"

    return True, "Valid"

def main():
    input_path = Path(__file__).resolve().parents[1] / "data" / "claim_events.jsonl"

    valid_count = 0
    invalid_count = 0
    total_amount = 0.0

    with input_path.open("r", encoding="utf-8") as file:
        for line in file:
            event = json.loads(line)
            is_valid, message = validate_event(event)

            if is_valid:
                valid_count += 1
                total_amount += float(event["claim_amount"])
            else:
                invalid_count += 1
                print(f"Invalid event {event.get('event_id')}: {message}")

    print(f"Valid events: {valid_count}")
    print(f"Invalid events: {invalid_count}")
    print(f"Total claim amount processed: {round(total_amount, 2)}")

if __name__ == "__main__":
    main()
