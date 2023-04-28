// Node.js + Express を使って WebApp を作成する
const express = require('express');
const app = express();
const path = require('path');
const PORT = process.env.PORT || 3000;

// テンプレートエンジンに EJS を指定する
app.set('view engine', 'ejs');

// 静的コンテンツを返却する
app.use('/public', express.static(path.join(__dirname, '/public')));

// ミドルウェアの設定
app.use(express.urlencoded({ extended: true }));

// 各ルーターへのアクセス
app.use('/', require('./routes/home'));
app.use('/create', require('./routes/create'));
app.use('/api', require('./routes/api'));

// サーバーを起動する
app.listen(PORT, () => {
  console.log(`ToDo App listening on port ${PORT}!`);
});
