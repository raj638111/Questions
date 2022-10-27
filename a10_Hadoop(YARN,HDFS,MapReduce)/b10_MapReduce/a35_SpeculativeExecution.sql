
https://mallikarjuna_g.gitbooks.io/spark/content/spark-taskschedulerimpl-speculative-execution.html



Speculative tasks (also speculatable tasks or task strugglers) are
tasks that run slower than most (FIXME the setting) of the all tasks in a job.

Speculative execution of tasks is a health-check procedure that checks for tasks to be speculated, i.e. running slower in a stage than the median of all successfully completed tasks in a taskset (FIXME the setting). Such slow tasks will be re-submitted to another worker. It will not stop the slow tasks, but run a new copy in parallel.