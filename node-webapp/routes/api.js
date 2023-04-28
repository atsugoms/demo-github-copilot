// ToDoアプリに対する操作を行うAPIを定義する
const router = require('express').Router();
const { MySQLClient, sql } = require('../lib/database/client');

// ToDoを取得する
router.get('/tasks', async (req, res, next) => {
  var user_id = req.session?.user_id || 1;
  var query = sql("SELECT_TASKS");
  var tasks = await MySQLClient.executeQuery(query, [user_id]);
  res.json(tasks);
});

module.exports = router;