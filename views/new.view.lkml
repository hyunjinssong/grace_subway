view: new {
  derived_table: {
    sql: SELECT * FROM `mzcdsc-team-200716.SubwayBI.bm_f_card_anal_5y`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: use_dt {
    type: date
    datatype: date
    sql: ${TABLE}.use_dt ;;
  }

  dimension: subway_route_nm {
    type: string
    sql: ${TABLE}.subway_route_nm ;;
  }

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: get_cnt {
    type: number
    sql: ${TABLE}.get_cnt ;;
  }

  dimension: get_off {
    type: number
    sql: ${TABLE}.get_off ;;
  }

  dimension: moving_passenger_cnt {
    type: number
    sql: ${TABLE}.moving_passenger_cnt ;;
  }

  dimension: sunsusong_cnt {
    type: number
    sql: ${TABLE}.sunsusong_cnt ;;
  }

  set: detail {
    fields: [
      use_dt,
      subway_route_nm,
      station_nm,
      get_cnt,
      get_off,
      moving_passenger_cnt,
      sunsusong_cnt
    ]
  }
}
