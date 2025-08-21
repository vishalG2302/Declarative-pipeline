import dlt
from pyspark.sql.functions import *
# from pyspark.sql.types import *


# transforming Customers DATA
@dlt.view(name = "customers_enr_view")
def customers_stg_trns():
    df = spark.readStream.table("customer_stg")
    df = df.withColumn("customer_name", upper(col("customer_name")))
    return df

# Creating Description silver tables
dlt.create_streaming_table(
    name = "customers_enr"
)

dlt.create_auto_cdc_flow(
    target="customers_enr",
    source="customers_enr_view",
    keys=["customer_id"],
    sequence_by="last_updated",
    ignore_null_updates=False,
    stored_as_scd_type=1   
)


# creating silver view for Gold layer
