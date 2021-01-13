# テーブル設計

## usersテーブル

|       Column       |  Type   |          Options          |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :comments
- has_many :items, through :comments
- has_many :purchase_history

## itemsテーブル

|    Column   |     Type   |              Options            |
| ----------- | ---------- | ------------------------------- |
| title       | string     | null: false                     |
| price       | integer    | null: false                     |
| explanation | text       | null: false                     |
| user        | references | null: false, foreign_keys: true |
| category_id | integer    | null: false                     |
| status_id   | integer    | null: false                     |
| delivery_id | integer    | null: false                     |
| region_id   | integer    | null: false                     |
| mean_id     | integer    | null: false                     |

### Association

- has_many :comments
- belongs_to :user, through :comments
- has_one :purchase_history

## purchasesテーブル

|       Column       |    Type    |   Options          |
| ------------------ | ---------- | ------------------ |
| pos_code           | string     | null: false        |
| prefecture_id      | integer    | null: false        |
| city               | string     | null: false        |
| numbering          | string     | null: false        |
| building           | string     |                    |
| tel_number         | string     | null: false        |
| purchase_histories | references | foreign_keys: true |

### Association

- belongs_to :purchase_history

## purchase_historiesテーブル

| Column |    Type    |             Options             |
| ------ | -----------|-------------------------------- |
| user   | references | null: false, foreign_keys: true |
| item   | references | null: false, foreign_keys: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase

## commentsテーブル

| Column |    Type    |              Options            |
| ------ | ---------- | ------------------------------- |
| text   | text       | null: false                     |
| user   | references | null: false, foreign_keys: true |
| items  | references | null: false, foreign_keys: true |

### Association

- belongs_to :user
- belongs_to :item