Q1
CREATE TABLE departments (
    -> department_id INT unsigned auto_increment,
    -> name VARCHAR(20) NOT NULL,
    -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    -> PRIMARY KEY (department_id)
    -> );

Q2
    ALTER TABLE people ADD department_id INT unsigned AFTER email;

Q3
    INSERT INTO departments (name)
    -> VALUES
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');

INSERT INTO reports (person_id, content) 
    -> VALUES
    -> ('1', '営業の業務進捗について日報を報告します。'),
    -> ('2', '開発の進捗について詳細を記載しました。'),
    -> ('3', '経理業務が順調に進んでいます。'),
    -> ('4', '人事面接の結果をまとめた日報です。'),
    -> ('5', '情報システムのトラブルシューティングを行いました。')
    -> ('1', '営業で新規顧客の対応を行いました。'),
    -> ('2', '開発で新機能のテストを実施しました。'),
    -> ('3', '経理部門で財務報告書の作成を行いました。'),
    -> ('4', '人事部門で面接のスケジュール調整を行いました。'),
    -> ('5', '情報システムのシステム更新作業を実施しました。');

INSERT INTO people (name, department_id, email, age, gender)
    -> VALUES
    -> ('源頼朝', '1', 'yoritomo@gizumo.jp', '20', '1'),
    -> ('源頼家', '1', 'yoriie@gizumo.jp', '24', '1'),
    -> ('源実朝', '1', 'sanetomo@gizumo.jp', '25', '1'),
    -> ('北条時頼', '2', 'tokiyori@gizumo.jp', '26', '1'),
    -> ('北条義時', '2', 'yoshitoki@gizumo.jp', '34', '1'),
    -> ('北条泰時', '2', 'yasutoki@gizumo.jp', '33', '1'),
    -> ('北条時宗', '2', 'tokimune@gizumo.jp', '38', '1'),
    -> ('北条貞時', '3', 'sadatoki@gizumo.jp', '30', '1'),
    -> ('後醍醐天皇', '4', 'godaigo@gizumo.jp', '29', '1'),
    -> ('源義経', '5', 'yoshitsune@gizumo.jp', '39', '1');

Q4
UPDATE people SET department_id = '1' WHERE person_id = 27;
UPDATE people SET department_id = '2' WHERE person_id = 28;
UPDATE people SET department_id = '3' WHERE person_id = 29;
UPDATE people SET department_id = '4' WHERE person_id = 31;

Q5
SELECT name, age FROM people where gender = 1 ORDER BY age DESC; 

Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

SELECTには'name'と'email'と'age'のカラムを選択し、
FROMには上記のカラムがある`people`のテーブルを選択し、
WHEREには`department_id`というレコードに記載されているdepartment_idが１の値を選択し、
ORDER BYでは `created_at`を指定してレコードが作成された日時順に並べて表記します。

Q7
SELECT
  name
FROM
  `people`
WHERE
  (`age` BETWEEN 20 AND 29 AND `gender` = 2)
  OR (`age` BETWEEN 40 AND 49 AND `gender` = 1)
ORDER BY
  `age` DESC;

Q8
SELECT
  age
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `age` DESC;

Q9
SELECT 
AVG(age) AS average_age 
FROM 
people 
GROUP BY 
gender = 2 
AND department_id = 2;

Q10
SELECT people.name, reports.content
    FROM people 
    INNER JOIN reports 
    ON people.person_id = reports.person_id;


update reports set person_id = 36 where report_id = 31;

SELECT people.name, departments.name
    FROM people 
    INNER JOIN departments 
    ON people.department_id = departments.department_id;

SELECT 
name, department_id, content
FROM 
people INNER JOIN reports ON people.person_id = reports.person_id;

Q11
SELECT name
FROM people LEFT OUTER JOIN reports ON people.person_id = reports.person_id
WHERE content is NULL;

SELECT name FROM people AS p LEFT OUTER JOIN reports AS r ON p.person_id = r.person_id WHERE content is NULL;