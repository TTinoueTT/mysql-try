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

SELECT
  *,
  AVG(likes) OVER () AS avg,
  AVG(likes) OVER (PARTITION BY area) AS area_avg,
  SUM(likes) OVER (PARTITION BY area) AS area_sum
FROM
  posts;