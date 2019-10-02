connection: "looker_app"

# include all views in this project
include: "views/*.view.lkml"

# include all the dashboards
# include: "dashboards/*.dashboard"

explore: orders {

  view_name: "order"

  join: order_line {
    sql_on: ${order_line.order_id} = ${order.id};;
    relationship: one_to_many
  }

  join: order_tag {
    sql_on: ${order_tag.order_id} = ${order.id};;
    relationship: many_to_one
  }

  join: product {
    sql_on: ${product.id} = ${order_line.product_id} ;;
    relationship: one_to_one
  }

  join: customer {
    sql_on: ${customer.id} = ${order.customer_id} ;;
    relationship: many_to_one
  }

  join: collect {
    sql_on: ${collect.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: collection {
    sql_on: ${collection.id} = ${collect.collection_id} ;;
    relationship: many_to_one
  }




#   join: customers {
#     sql_on: ${customers.id} = ${orders.customer_id} ;;
#     type: left_outer
#     relationship: many_to_one
#   }
#
#   join: customer_order_facts {
#     view_label: "Customers"
#     sql_on: ${customers._id} = ${customer_order_facts.customer_id} ;;
#     type: left_outer
#     relationship: many_to_one
#   }


}

# explore:  checkouts {
# }
# explore:  transactions {
# }
# explore:  products {
# }

#Large Dollars Amount format
named_value_format: largeamount {
  value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
}
