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
