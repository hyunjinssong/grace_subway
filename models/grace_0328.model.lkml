connection: "grace_0328_subway_real"

# include all the views
include: "/views/**/*.view"

datagroup: grace_0328_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: grace_0328_default_datagroup

explore: calender {}

explore: transfer {}

explore: bm_f_card_anal_5y {}

explore: bm_f_unsturct__5y {}
