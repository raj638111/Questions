

date_format(trans_date, '%Y-%m')
DATE_ADD(w1.RecordDate, INTERVAL 1 DAY)
date_format(r.created_at, "%m") in ('02')
round(sqrt(power(t1.x-t2.x,2) + power(t1.y-t2.y,2)),2)

order by num_points desc, team_id asc

AVG(val) OVER (PARTITION BY subject ORDER BY time
  ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
           AS running_average

SUM(val) OVER (PARTITION BY subject ORDER BY time
                        ROWS UNBOUNDED PRECEDING)
frame_between:
    BETWEEN frame_start AND frame_end

frame_start, frame_end: {
    CURRENT ROW
  | UNBOUNDED PRECEDING
  | UNBOUNDED FOLLOWING
  | expr PRECEDING
  | expr FOLLOWING
}
