view: bm_f_card_anal_5y {
  sql_table_name: `SubwayBI.bm_f_card_anal_5y`
    ;;

  dimension: get_cnt {
    type: number
    label: "총승차인원수"
    sql: ${TABLE}.get_cnt ;;
  }

  dimension: get_off {
    type: number
    label: "총하차인원수"
    sql: ${TABLE}.get_off ;;
  }

  dimension: moving_passenger_cnt {
    type: number
    label: "유동인원수"
    sql: ${TABLE}.moving_passenger_cnt ;;
  }

  dimension: station_nm {
    type: string
    label: "역명"
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_route_nm {
    type: string
    label: "호선"
    sql: ${TABLE}.subway_route_nm ;;
  }

  dimension: sunsusong_cnt {
    type: number
    label: "순수송인원수"
    sql: abs(${TABLE}.sunsusong_cnt) ;;
  }

  dimension: sumsumasdf {
    type: number
    label: " 다더한거"
    sql: sum(${TABLE}.sunsusong_cnt);;
  }


  dimension_group: use_dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.use_dt ;;
  }

  dimension_group: use_dt_interval {
    type: time
    convert_tz: no
    datatype: date
    sql: date_sub(${use_dt_date}, INTERVAL 1 Year);;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
