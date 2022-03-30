view: line_total {
  derived_table: {
    sql: SELECT
          bm_f_card_anal_5y.subway_route_nm  AS bm_f_card_anal_5y_subway_route_nm,
          sum(abs(bm_f_card_anal_5y.sunsusong_cnt))  AS Line_Total
      FROM `SubwayBI.bm_f_card_anal_5y`
           AS bm_f_card_anal_5y
      GROUP BY
          1
      ORDER BY
          1 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bm_f_card_anal_5y_subway_route_nm {
    type: string
    sql: ${TABLE}.bm_f_card_anal_5y_subway_route_nm ;;
  }

  dimension: line_total {
    type: number
    sql: ${TABLE}.Line_Total ;;
  }

  set: detail {
    fields: [bm_f_card_anal_5y_subway_route_nm, line_total]
  }
}
