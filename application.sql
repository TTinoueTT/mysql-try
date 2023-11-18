DROP TABLE IF EXISTS posts;
-- postsテーブルが存在しているとこのファイルが再読み込みしたときエラーになるので最初に削除す
CREATE TABLE posts
(
  id INT PRIMARY KEY AUTO_INCREMENT,
  message VARCHAR(140) UNIQUE,
  likes INT,
  area VARCHAR(20)
);

INSERT INTO posts (message, likes, area) VALUES
  ('post-1', 12, 'Tokyo'),
  ('post-2', 8, 'Fukuoka'),
  ('post-3', 11, 'Tokyo'),
  ('post-4', 3, 'Osaka'),
  ('post-5', NULL, 'Tokyo'),
  ('post-6', 9, 'Osaka'),
  ('post-7', 4, 'Tokyo'),
  ('post-8', NULL, 'Tokyo'),
  ('post-9', 31, 'Fukuoka');

-- SELECT COUNT(likes) FROM posts;
-- SELECT COUNT(id) FROM posts;
-- SELECT COUNT(*) FROM posts;

-- SELECT SUM(area) FROM posts;
-- SELECT COUNT(area) FROM posts;

-- SELECT * FROM posts;
-- SELECT DISTINCT area FROM posts;
-- SELECT area, SUM(likes) FROM posts GROUP BY area;
SELECT area, likes
FROM posts
WHERE likes < 10;

-- SELECT area, SUM(likes) AS sumlikes
-- FROM posts
-- WHERE likes < 10
-- GROUP BY area 
-- HAVING sumlikes > 10;

-- SELECT * FROM posts WHERE area = 'Osaka';
-- -- IF条件文
-- SELECT *, IF(likes > 10, 'A', 'B') AS team FROM posts;
-- -- CASE条件文
-- SELECT
--   *,
--   CASE
--     WHEN likes > 10 THEN 'A'
--     WHEN likes > 5 THEN 'B'
--     ELSE 'C'
--   END AS team
-- FROM
--   posts;

-- テーブル作成の応用
-- postsテーブルの中身から条件を絞って新規テーブルを作成
DROP TABLE IF EXISTS posts_tokyo;
CREATE TABLE posts_tokyo AS SELECT * FROM posts WHERE area = 'Tokyo';
SELECT * FROM posts_tokyo;

DROP VIEW IF EXISTS posts_tokyo_view;
CREATE VIEW posts_tokyo_view AS SELECT * FROM posts WHERE area = 'Tokyo';
SELECT * FROM posts_tokyo_view;

-- -- postsテーブルの中身ごと複製
-- DROP TABLE IF EXISTS posts_copy;
-- CREATE TABLE posts_copy AS SELECT * FROM posts;
-- SELECT * FROM posts_copy;
-- -- postsテーブルの構造のみを複製(LIKEを使用)、レコードはコピーされない
-- DROP TABLE IF EXISTS posts_skelton;
-- CREATE TABLE posts_skelton LIKE posts;
-- SELECT * FROM posts_skelton;

SHOW TABLES;

-- SELECT * FROM posts WHERE id = 1;
UPDATE posts SET likes = 15 WHERE id = 1;
SELECT * FROM posts WHERE id = 1;

SELECT * FROM posts_tokyo;
SELECT * FROM posts_tokyo_view;