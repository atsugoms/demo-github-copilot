-- task_category テーブルからタスクを削除する
DELETE FROM task_category
WHERE task_id = ? AND user_id = ?;
