from pathlib import Path
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, when, current_timestamp, sum as spark_sum, count

def create_spark_session():
    return SparkSession.builder.appName("PySpark Lakehouse Claims Pipeline").master("local[*]").getOrCreate()

def main():
    spark = create_spark_session()
    base_path = Path(__file__).resolve().parents[1]
    input_path = str(base_path / "data" / "sample_claims.csv")

    bronze_df = spark.read.option("header", True).option("inferSchema", True).csv(input_path)

    silver_df = (
        bronze_df
        .filter(col("claim_id").isNotNull())
        .filter(col("customer_id").isNotNull())
        .withColumn("claim_flag", when(col("claim_amount") > 0, "CLAIM_ACTIVITY").otherwise("NO_CLAIM_ACTIVITY"))
        .withColumn("processed_at", current_timestamp())
    )

    gold_df = (
        silver_df
        .groupBy("province", "claim_status")
        .agg(count("*").alias("claim_count"), spark_sum("claim_amount").alias("total_claim_amount"))
        .orderBy("province", "claim_status")
    )

    print("Bronze Layer")
    bronze_df.show()

    print("Silver Layer")
    silver_df.show()

    print("Gold Layer")
    gold_df.show()

    spark.stop()

if __name__ == "__main__":
    main()
