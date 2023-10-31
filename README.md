#テーブル設計

#users
| email              | string | null: false | 
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

#items
| item_name                   | string     | null: false             |
| item_info                   | text       | null: false             |
| item_category               | integer    | null: false             |
| item_sales_status           | integer    | null: false             |
| item_shipping_fee_stats     | integer    | null: false             |
| item_prefecture             | integer    | null: false             |
| item_scheduled_delivery     | integer    | null: false             |  
| item_price                  | integer    | null: false             |
| user_id                     | references | null: false ,foreign_key|

//item_imageはActiveStorageで実装する

#bought_records
| user_id     | references | null: false , foreign_key|
| item_id     | references | null: false , foreign_key|

#shipping_address 
| postal_code     | integer    | null: false             |
| prefecture      | integer    | null: false             |
| city            | string     | null: false             |
| addresses       | string     | null: false             |
| building        | string     |                         |
| phone_number    | integer    | null: false             |
| bought_id       | references | null: false ,foreign_key|

