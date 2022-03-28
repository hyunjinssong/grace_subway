view: sql_runner_query {
  derived_table: {
    sql: SELECT
          (card_bi.Date ) AS card_bi_date_date,
          card_bi.Line  AS card_bi_line,
          sum(card_bi.Sub)  AS card_bi_sub
      FROM `SubwayBI.CARD_BI`
           AS card_bi
      GROUP BY
          1,
          2
      ORDER BY
          1 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: card_bi_date_date {
    type: date
    datatype: date
    sql: ${TABLE}.card_bi_date_date ;;
  }

  dimension: card_bi_line {
    type: string
    sql: ${TABLE}.card_bi_line ;;
  }

  dimension: card_bi_sub {
    type: number
    sql: ${TABLE}.card_bi_sub ;;
  }

  set: detail {
    fields: [card_bi_date_date, card_bi_line, card_bi_sub]
  }
}
