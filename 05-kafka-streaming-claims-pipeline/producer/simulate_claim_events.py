import json
import random
from datetime import datetime
from pathlib import Path

statuses = ["Submitted", "Approved", "Rejected", "Pending"]
provinces = ["ON", "BC", "AB", "QC"]

def create_event(event_id: int):
    return {
        "event_id": f"EVT-{event_id:05d}",
        "claim_id": f"CLM-{random.randint(10000, 99999)}",
        "customer_id": random.randint(1000, 9999),
        "province": random.choice(provinces),
        "claim_amount": round(random.uniform(100, 10000), 2),
        "claim_status": random.choice(statuses),
        "event_time": datetime.utcnow().isoformat()
    }

def main():
    output_path = Path(__file__).resolve().parents[1] / "data" / "claim_events.jsonl"
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with output_path.open("w", encoding="utf-8") as file:
        for event_id in range(1, 21):
            event = create_event(event_id)
            file.write(json.dumps(event) + "\n")

    print(f"Generated 20 claim events at {output_path}")

if __name__ == "__main__":
    main()
