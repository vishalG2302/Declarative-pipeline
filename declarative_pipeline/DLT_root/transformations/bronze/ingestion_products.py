import dlt

product_rules = {
    "rule_1": "product_id IS NOT NULL",
    "rule_2": "price >=0"
}

# INGestion products
@dlt.table(
    name="products_stg"
)
@dlt.expect_all(product_rules)
def products_stg():
    df = spark.readStream.table("dlt_vishal.source.products")
    return df
 