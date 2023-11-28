/* 存在している DB を選択して、SQL 文を実行する

    --table オプションで、罫線を表示させる
 */

DROP TABLE IF EXISTS user1;
DROP TABLE IF EXISTS user2;

CREATE TABLE user1 (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    age INT
);

INSERT INTO user1 (`name`, `age`) VALUES
    ("山田太郎", 30),
    ("山田花子", 25),
    ("鈴木二郎", 20);

SELECT * FROM user1;


CREATE TABLE user2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    age INT
);

INSERT INTO user2 (`name`, `age`) VALUES
    ("山田太郎", 30),
    ("鈴木次郎", 22),
    ("田中あきら", 40);

SELECT * FROM user2;

# MERGE INTO は MySQL ではサポートしていない
/* MERGE INTO user1 a
    USING (
        SELECT id, name, age
        FROM user2
    ) b
ON (a.id = b.id)
WHEN MATCHED THEN
    UPDATE SET
        a.name = b.name,
        a.age  = b.age
WHEN NOT MATCHED THEN
    INSERT
    (id, name, age)
    VALUES
    (b.id, b.name, b.age) */

/*
+----+--------------+------+
| id | name         | age  |
+----+--------------+------+
|  1 | 山田太郎     |   30 |
|  2 | 山田花子     |   25 |
|  3 | 鈴木二郎     |   20 |
+----+--------------+------+
+----+-----------------+------+
| id | name            | age  |
+----+-----------------+------+
|  1 | 山田太郎        |   30 |
|  2 | 鈴木次郎        |   22 |
|  3 | 田中あきら      |   40 |
+----+-----------------+------+
+----+-----------------+------+
| id | name            | age  |
+----+-----------------+------+
|  1 | 山田太郎        |   30 |
|  2 | 鈴木次郎        |   22 |
|  3 | 田中あきら      |   40 |
+----+-----------------+------+
user1 と user2 を比較して、更新するメソッド
*/


MERGE INTO user1 a
USING (
    SELECT id, name, age
    FROM user2
) b
ON (a.id = b.id)
WHEN MATCHED THEN
    UPDATE SET
        a.name = b.name,
        a.age  = b.age
WHEN NOT MATCHED BY TARGET THEN
    INSERT
    (id, name, age)
    VALUES
    (b.id, b.name, b.age)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

SELECT * FROM user1;

/* SHOW TABLES; */