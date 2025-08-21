import dlt
from pyspark.sql.functions import *

# transforming Sales DATA
@dlt.view(name = "sales_enr_view")
def sales_stg_trns():
    df = spark.readStream.table("sales_stg")
    df = df.withColumn("total_amount", col("quantity") * col("amount"))
    return df

# Creating Description silver tables
dlt.create_streaming_table(
    name = "sales_enr"
)

# dlt.create_auto_cdc_flow(
#     target = "sales_enr",
#     source = "sales_stg_trns",
#     keys = ["sales_id"],
#     sequence_by = "sales_timestamp",
#     ignore_null_updates = False,
#     apply_as_deletes = None,
#     apply_as_truncates = None,
#     # column_list = None,
#     expect_column_list = None,
#     stored_as_scd_type = 1,
#     track_history_column_list = None,
#     track_history_except_column_list = None
# )

dlt.create_auto_cdc_flow(
    target="sales_enr",
    source="sales_enr_view",
    keys=["sales_id"],
    sequence_by="sale_timestamp",
    ignore_null_updates=False,
    stored_as_scd_type=1   
)

# creating silver view for Gold layer































