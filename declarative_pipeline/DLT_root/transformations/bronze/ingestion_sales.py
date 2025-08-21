import dlt


# sales expections
sales_rule = {
    "rule_1": "sales_id IS NOT NULL"
}

# empty streaming table
dlt.create_streaming_table(
    name="sales_stg",
    expect_all = sales_rule
)

#creating East Sales Flow
@dlt.append_flow(target="sales_stg")
def east_sales():
    
    df = spark.readStream.table("dlt_vishal.source.sales_east")
    return df

# Createing West Sales Flow

@dlt.append_flow(target="sales_stg")
def west_sales():
    df = spark.readStream.table("dlt_vishal.source.sales_west")
    return df