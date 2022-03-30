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

explore: bm_f_unsturct__5y {}

explore: bm_f_card_anal_5y {
  join: line_number {
    type: left_outer
    sql_on: ${line_number.bm_f_card_anal_5y_subway_route_nm} = ${bm_f_card_anal_5y.subway_route_nm} ;;
    relationship: one_to_many
  }
}


explore: data {}

explore: line_total {}

explore: line_number {}

explore: new {
  join: data {
    type: inner
    sql_on: (${data.bm_f_card_anal_5y_use_dt_date},Interval 1 YEAR) =${new.use_dt}
    AND ${data.bm_f_card_anal_5y_station_nm} = ${new.station_nm} ;;
    relationship: one_to_one
  }
}
