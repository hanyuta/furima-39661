#テーブル設計

#users
| email              | string | null: false ,unique:true| 
| password           | string | null: false             |
| nickname           | string | null: false             |
| first_name         | string | null: false             |
| last_name          | string | null: false             |
| first_name_kana    | string | null: false             |
| last_name_kana     | string | null: false             |
| birthday           | date   | null: false             |

#items
| item_name                   | string     | null: false             |
| item_info                   | text       | null: false             |
| item_category_id            | integer    | null: false             |
| item_sales_status_id        | integer    | null: false             |
| item_shipping_fee_stats_id  | integer    | null: false             |
| prefecture_id               | integer    | null: false             |
| item_scheduled_delivery_id  | integer    | null: false             |  
| item_price                  | integer    | null: false             |
| user                        | references | null: false ,foreign_key|

//item_imageはActiveStorageで実装する

#bought_records
| user        | references | null: false , foreign_key|
| item        | references | null: false , foreign_key|

#shipping_address 
| postal_code     | string     | null: false             |
| prefecture_id   | integer    | null: false             |
| city            | string     | null: false             |
| addresses       | string     | null: false             |
| building        | string     |                         |
| phone_number    | string     | null: false             |
| bought_record   | references | null: false ,foreign_key|

