#テーブル設計

#users

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false | #ユニーク制約
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |


#prototypes

 
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| title              | string    | null: false                    |
| catch_copy         | text      | null: false                    |
| concept            | text      | null: false                    |
| user               | reference | null: false , foreign_key: true|

#comments


| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| content            | text      | null: false                    |
| prototype          | reference | null: false ,foreign_key: true |
| user               | reference | null: false ,foreign_key: true |