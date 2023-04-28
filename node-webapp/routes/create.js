// todoを作成する画面を表示する
const router = require('express').Router();
const { MySQLClient, sql } = require('../lib/database/client');

router.get('/', (req, res, next) => {
  res.render('create', { title: 'ToDo作成' });
});

// todoを作成する
router.post('/', async (req, res, next) => {
  // todoを追加する
  const { description, created } = req.body;
  var user_id = req.session?.user_id || 1;
  var deadline = null;
  var priority = 0;
  try {
    var query = await sql("INSERT_TASK");
    await MySQLClient.executeQuery(
      query,
      [description, deadline, priority, user_id]
    );
  } catch (e) {
    console.log(e);
  }

  // todoを追加した後に、トップページにリダイレクトする
  res.redirect('/');
});

module.exports = router;