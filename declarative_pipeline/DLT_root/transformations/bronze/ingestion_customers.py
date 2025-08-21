import dlt
customer_rules = {
    "rule_1": "customer_id IS NOT NULL",
    "rule_2": "customer_name IS NOT NULL"
}

@dlt.table(
    name="customer_stg"
)
@dlt.expect_all_or_drop(customer_rules)
def products_stg():

    df = spark.readStream.table("dlt_vishal.source.customers")
    return df