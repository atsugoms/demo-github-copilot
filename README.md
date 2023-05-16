# GitHub Copilot

本デモアプリでは To-Do アプリを途中から実装することを想定して作成しています。
未完成状態の To-Do アプリを Copilot を使って素早く開発してみましょう！

## Copilotでできること

- コメントからコード/SQL生成
- 文脈から関数や次の行をオートコンプリート
- 知識検索（APIまたはライブラリコール）
- コードからコメント生成


### コメントからコード/SQL/HTML生成

- JavaScriptのコードを自動生成

    `./routes/api.js` にコメントを記載すると自動でAPIが作成される

    作成されるコードは独自のライブラリコードも含めて予測してくれる。

    ```
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

    // ToDoを登録する ★追記★

    module.exports = router;
    ```
- SQLを自動生成

    `./lib/database/sql/DELETE_TASK.sql` にコメント記載すると自動で削除SQLが作成される

    テーブルなどの情報は他のSQL文から推測して作成してくれる。

    ```
    -- tasks テーブルからタスクを削除する ★追記★

    ```


- HTMLを自動生成
    
    `./views/create.ejs` に他の項目を自動で推測して追加してくれる

    ```
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <%- include('./partials/_meta') %>
      <title>Create</title>
    </head>
    <body>
      <%- include('./partials/_header') %>
      <main class="container">
        <form method="POST" action="/create" class="form-control">
          <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <input type="text" class="form-control" id="description" name="description" placeholder="Homework">
          </div>
          <div class="mb-3">
            <label for="deadline" class="form-label">Deadline</label>
            <input type="date" class="form-control" name="deadline" id="deadline">
          </div>
          <div></div> ★追記してdivタグの間を改行すると判定★
          <div class="mb-3">
            <input type="submit" class="btn btn-primary" value="Create">
          </div>
        </form>
      </main>
    </body>
    </html>
    ```

- HTMLを自動生成

  `./views/home.ejs` に改行を入れると自動で補完してくれる

    ```
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <%- include('./partials/_meta.ejs') %>
      <title>To-Do App</title>
    </head>
    <body>
      <%- include('./partials/_header.ejs') %>
      <main class="container">
        <h2>Index</h2>
        <a href="/create">Create</a>
        <table class="table">
          <thead>
            <tr>
              <th>Description</th>
              <th>Created</th>
            </tr>
          </thead>
          <tbody>★ここで改行★</tbody>
        </table>
      </main>
    </body>
    </html>
    ```


### コードからコメント生成

- `./routes/create.js` の `GET: /` にはコメントがないが、実装から判断してコメントを入れてくれる

    ```
    // todoを作成する画面を表示する
    const router = require('express').Router();
    const { MySQLClient, sql } = require('../lib/database/client');

    ★ここへコメント "//" を書き始める★
    router.get('/', (req, res, next) => {
      res.render('create', { title: 'ToDo作成' });
    });

    ... （省略） ...

    module.exports = router;
    ```
