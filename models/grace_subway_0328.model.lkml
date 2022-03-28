connection: "grace_subway"

# include all the views
include: "/views/**/*.view"

datagroup: grace_subway_0328_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: grace_subway_0328_default_datagroup

explore: card_bi {}
