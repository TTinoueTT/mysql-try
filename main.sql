DROP TABLE IF EXISTS posts;
-- postsテーブルが存在しているとこのファイルが再読み込みしたときエラーになるので最初に削除す
CREATE TABLE posts
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  message VARCHAR(140) UNIQUE,
  -- likes INT UNSIGNED NOT NULL CHECK (likes >= 0 AND likes <= 100),
  likes INT CHECK (likes >= 0 AND likes <= 100),
  mood DECIMAL(4, 2) UNSIGNED DEFAULT 0, -- 全体で4桁、少数は第二位までの制約
  lang CHAR
  (2),
  category ENUM
  ('Gadget', 'Game', 'Business'), -- ENUMは選択肢を与える文字列型
  commodities
  SET
  ('Apple', 'Orange', 'Mackerel', 'bhungdang'),
  -- SET型は選択肢インデックスを左からインデックス番号 2^0で1, 2^1で2, 2^2で4と累乗で指定する
  is_draft BOOL,
  created DATETIME
);

  DESC posts;
  SHOW TABLES;

  -- INSERT INTO posts (message, likes) VALUES ('Thanks', 12);
  -- INSERT INTO posts (message, likes) VALUES ('Arigato', 4);
  INSERT INTO posts
    (message, likes, mood, lang, category, commodities, is_draft, created)
  VALUES
    ('Thanks', 12, 7.83, 'EN', 'Gadget', 'Apple,Orange', TRUE, '2020-10-11 15:32:10'),
    ('Arigato', 4, 4.21, 'JA', 'Game', 'Apple,Orange', FALSE, '2020-10-11'),
    ('Sheishe', 7, 4.99, 'CH', 1, 5, 0, NOW()) -- インデックス番号でENUM型のデータを指定
    -- ('Merci', 4, 4.88, 'IT', 'Business', 'Apple,Orange', )
  ;

  -- INSERT INTO posts (message, likes) VALUES ('Gracias', 4);
  -- 指定カラム以外のデータを入れなくてもnullで許容される

  -- INSERT INTO posts (message) VALUES ('Gracias'); -- NOT NULL により doesn't have a default value
  -- INSERT INTO posts (message, likes) VALUES ('Arigato', 4); -- UNIQUE により Duplicate entry 'Arigato' for key 'message'
  INSERT INTO posts (message, likes) VALUES ('Danke', 102);

  SELECT *
  FROM posts;

  -- SELECT * FROM posts WHERE message = 'Danke';
  -- SELECT likes * 500 / 3 FROM posts;

-- 四則演算の利用
  -- SELECT 15 + 5 ;
  -- SELECT 15 + 5  AS results;

-- 計算結果の関数の利用(FLOOR, CEIL, ROUND)
  -- SELECT FLOOR (500 / 3) AS floor;
  -- SELECT CEIL (500 / 3) AS ceil;
  -- SELECT ROUND (500 / 3) AS round;

  -- 文字列の関数
  SELECT message, SUBSTRING(message, 3) FROM posts;
  SELECT message, SUBSTRING(message, 3, 2) FROM posts;
  SELECT CONCAT(message, '-', likes), SUBSTRING(message, 3, 2) FROM posts;
  SELECT CONCAT(message, '-', likes) AS meli, SUBSTRING(message, 3, 2) AS sub, LENGTH(message) AS len FROM posts;

  DELETE FROM posts where likes < 10;
  -- SELECT * FROM posts WHERE likes < 10;
  SELECT * FROM posts;
  TRUNCATE TABLE posts; -- テーブル内を削除して連番も初期化
  INSERT INTO posts (message, likes) VALUES ('Xiexie', 20);
  SELECT * FROM posts;

