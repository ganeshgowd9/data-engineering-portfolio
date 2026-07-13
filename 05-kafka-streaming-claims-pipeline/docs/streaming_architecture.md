# Streaming Architecture

Producer  
→ Kafka Topic: claims-events  
→ Consumer Validation  
→ Curated Stream Output  
→ Data Lake / Snowflake / Monitoring Layer

## Production Concepts

- Event schema validation
- JSON payload processing
- Dead-letter queue for invalid events
- Real-time monitoring
- Downstream reporting and analytics
