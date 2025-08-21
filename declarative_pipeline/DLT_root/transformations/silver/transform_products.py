import dlt
from pyspark.sql.functions import *
from pyspark.sql.types import *


# transforming Sales DATA
@dlt.view(name = "products_enr_view")
def products_stg_trns():
    df = spark.readStream.table("products_stg")
    df = df.withColumn("price", col("price").cast(IntegerType()))
    return df

# Creating Description silver tables
dlt.create_streaming_table(
    name = "products_enr"
)

dlt.create_auto_cdc_flow(
    target="products_enr",
    source="products_enr_view",
    keys=["product_id"],
    sequence_by="last_updated",
    ignore_null_updates=False,
    stored_as_scd_type=1   
)

# creating silver view for Gold layer
