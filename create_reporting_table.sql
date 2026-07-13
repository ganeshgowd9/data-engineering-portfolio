import csv
from pathlib import Path

class DataQualityFramework:
    def __init__(self, rows):
        self.rows = rows
        self.errors = []

    def check_required_columns(self, required_columns):
        if not self.rows:
            self.errors.append("Dataset is empty.")
            return

        missing = set(required_columns) - set(self.rows[0].keys())
        if missing:
            self.errors.append(f"Missing columns: {missing}")

    def check_nulls(self, columns):
        for row_number, row in enumerate(self.rows, start=2):
            for column in columns:
                if not row.get(column):
                    self.errors.append(f"Row {row_number}: null value in {column}")

    def check_duplicates(self, key_column):
        seen = set()
        for row_number, row in enumerate(self.rows, start=2):
            key = row.get(key_column)
            if key in seen:
                self.errors.append(f"Row {row_number}: duplicate key {key}")
            seen.add(key)

    def check_accepted_values(self, column, accepted_values):
        for row_number, row in enumerate(self.rows, start=2):
            if row.get(column) not in accepted_values:
                self.errors.append(f"Row {row_number}: invalid value {row.get(column)} in {column}")

    def check_numeric_range(self, column, minimum=None, maximum=None):
        for row_number, row in enumerate(self.rows, start=2):
            try:
                value = float(row.get(column))
                if minimum is not None and value < minimum:
                    self.errors.append(f"Row {row_number}: {column} is below minimum")
                if maximum is not None and value > maximum:
                    self.errors.append(f"Row {row_number}: {column} is above maximum")
            except ValueError:
                self.errors.append(f"Row {row_number}: {column} is not numeric")

    def report(self):
        if not self.errors:
            print("All data quality checks passed.")
            return True

        print("Data quality checks failed:")
        for error in self.errors:
            print(f"- {error}")
        return False

def read_csv(path):
    with path.open("r", encoding="utf-8") as file:
        return list(csv.DictReader(file))

def main():
    input_path = Path(__file__).resolve().parents[1] / "data" / "sample_policy_data.csv"
    rows = read_csv(input_path)

    dq = DataQualityFramework(rows)
    dq.check_required_columns(["policy_id", "customer_id", "province", "premium_amount", "policy_status"])
    dq.check_nulls(["policy_id", "customer_id", "province"])
    dq.check_duplicates("policy_id")
    dq.check_accepted_values("policy_status", {"Active", "Cancelled", "Expired"})
    dq.check_numeric_range("premium_amount", minimum=0)
    dq.report()

if __name__ == "__main__":
    main()
