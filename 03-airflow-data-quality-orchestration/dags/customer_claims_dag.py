from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python import PythonOperator

default_args = {
    "owner": "ganesh",
    "depends_on_past": False,
    "retries": 2,
    "retry_delay": timedelta(minutes=5),
}

def extract_data():
    print("Extracting customer claims data from source systems.")

def validate_data():
    print("Running schema, null, duplicate, and record count checks.")

def transform_data():
    print("Transforming raw data into curated reporting-ready datasets.")

def publish_data():
    print("Publishing curated data to reporting layer / Snowflake table.")

def notify_status():
    print("Pipeline completed successfully.")

with DAG(
    dag_id="customer_claims_data_quality_pipeline",
    default_args=default_args,
    description="Portfolio DAG for data quality orchestration.",
    schedule_interval="@daily",
    start_date=datetime(2026, 1, 1),
    catchup=False,
    tags=["data-engineering", "portfolio", "airflow"],
) as dag:

    extract = PythonOperator(task_id="extract_data", python_callable=extract_data)
    validate = PythonOperator(task_id="validate_data", python_callable=validate_data)
    transform = PythonOperator(task_id="transform_data", python_callable=transform_data)
    publish = PythonOperator(task_id="publish_data", python_callable=publish_data)
    notify = PythonOperator(task_id="notify_status", python_callable=notify_status)

    extract >> validate >> transform >> publish >> notify
