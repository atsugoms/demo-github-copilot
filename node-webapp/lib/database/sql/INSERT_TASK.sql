-- tasks テーブルに新しいタスクを追加する
INSERT INTO tasks (
  task_name,
  deadline,
  priority,
  user_id
) VALUES (
  ?,
  ?,
  ?,
  ?
);
