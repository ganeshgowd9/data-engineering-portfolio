# Kafka Streaming Claims Pipeline

## Overview

This project simulates real-time claims event ingestion using Kafka-style producer and consumer scripts.

## Business Use Case

Claims and transaction-like events often arrive continuously. This project shows how streaming events can be produced, consumed, validated, and prepared for downstream processing.

## Skills Demonstrated

- Kafka-style streaming design
- Python event producer
- Python event consumer
- JSON event processing
- Real-time pipeline concepts
- Event validation
- Monitoring-ready pipeline structure

## Run Locally

This project is written as a lightweight simulation and does not require a running Kafka cluster.

```bash
python producer/simulate_claim_events.py
python consumer/process_claim_events.py
```
