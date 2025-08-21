import dlt

#create Empty Streaming table
dlt.create_streaming_table(
    name = "dim_products"
)

#AUTO CDC FLOW
dlt.create_auto_cdc_flow(
    target = "dim_products",
    source = "products_enr_view",
    keys = ["product_id"],
    sequence_by = "last_updated",  
    ignore_null_updates = False,
    apply_as_deletes = None,
    apply_as_truncates = None,
    column_list = None,
    except_column_list = None,
    stored_as_scd_type = 2,
    track_history_column_list = None,
    track_history_except_column_list = None
)