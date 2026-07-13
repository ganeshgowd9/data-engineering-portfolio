# Airflow DAG Design

extract_data → validate_data → transform_data → publish_data → notify_status

## Production Concepts
- Retries
- Dependency management
- Scheduling
- Data quality checkpoint
- Reporting layer publishing
- Monitoring and notification pattern
