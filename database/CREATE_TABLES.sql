USE todo;

DROP TABLE IF EXISTS task_category;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  user_id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE categories (
  category_id INT NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE tasks (
  task_id INT NOT NULL AUTO_INCREMENT,
  task_name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deadline DATE,
  priority INT NOT NULL DEFAULT 0,
  is_completed BOOLEAN DEFAULT 0,
  user_id INT NOT NULL,
  PRIMARY KEY (task_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE task_category (
  task_id INT NOT NULL,
  category_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (task_id, category_id),
  FOREIGN KEY (task_id) REFERENCES tasks(task_id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
