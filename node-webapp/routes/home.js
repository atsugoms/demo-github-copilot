// index.js の EJS を返すルートを追加する
const router = require('express').Router();
const { MySQLClient, sql } = require('../lib/database/client');

// トップ画面を返す
router.get('/', async (req, res, next) => {
  res.render('home');
});

module.exports = router;