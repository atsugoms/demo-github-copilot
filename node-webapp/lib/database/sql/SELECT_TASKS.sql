-- tasksテーブルから指定したユーザーのタスク一覧を取得する
SELECT
  task_id,
  task_name,
  deadline,
  priority
FROM
  tasks
WHERE
  user_id = ?
ORDER BY
  deadline ASC;
