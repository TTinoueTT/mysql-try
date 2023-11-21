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

SELECT * FROM posts;
(SELECT * FROM posts ORDER BY likes DESC LIMIT 3)
UNION ALL
(SELECT * FROM posts ORDER BY likes LIMIT 1);

SELECT 
  *,
  -- likesの平均を出す
  (SELECT AVG(likes) FROM posts) AS avg,
  -- likesの平均を出す(areaの値が一致した時)
  -- 大元のテーブルと関連づけられたサブクエリのことを相関サブクエリという
  (SELECT AVG(likes) FROM posts AS t2 WHERE t1.area = t2.area) AS area_avg
FROM 
  posts AS t1;

-- areaカラムとareaごとのレコードの数をカウントしたカラムを呼び出す
SELECT area, COUNT(*) AS n FROM posts GROUP BY area;

-- n(areaごとのレコードの数をカウントした値)の平均したカラムを呼び出す
SELECT
  AVG(n)
FROM
  (SELECT area, COUNT(*) AS n FROM posts GROUP BY area) AS t; -- 最後に別名をつける