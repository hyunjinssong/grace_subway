view: line_number {
  derived_table: {
    sql: SELECT
          (bm_f_card_anal_5y.use_dt ) AS bm_f_card_anal_5y_use_dt_date,
          sum(abs(bm_f_card_anal_5y.sunsusong_cnt))  AS Total,
          bm_f_card_anal_5y.subway_route_nm  AS bm_f_card_anal_5y_subway_route_nm
      FROM `SubwayBI.bm_f_card_anal_5y`
           AS bm_f_card_anal_5y
      GROUP BY
          1,
          3
      ORDER BY
          1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bm_f_card_anal_5y_use_dt_date {
    type: date
    datatype: date
    sql: ${TABLE}.bm_f_card_anal_5y_use_dt_date ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.Total ;;
  }

  dimension: bm_f_card_anal_5y_subway_route_nm {
    type: string
    sql: ${TABLE}.bm_f_card_anal_5y_subway_route_nm ;;
  }

  set: detail {
    fields: [bm_f_card_anal_5y_use_dt_date, total, bm_f_card_anal_5y_subway_route_nm]
  }
}
