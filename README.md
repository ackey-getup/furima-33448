# テーブル設計

## usersテーブル

|  Cplumn  |  Type   |   Options   |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| name     | string  | null: false |
| birthday | integer | null: false |

### Association

- has_many :comments
- has_many :items, through :comments

## itemsテーブル

|  Column  |     Type   |              Options            |
| -------- | ---------- | ------------------------------- |
| title    | string     | null: false                     |
| price    | integer    | null: false                     |
| user     | references | null: false, foreign_keys: true |
| category | text       | null: false                     |
| status   | text       | null: false                     |
| delivery | text       | null: false                     |
| region   | text       | null: false                     |
| mean     | text       | null: false                     |
| image    | ActiveStorage, null: false                   |

### Association

- has_many :comments
- belongs_to :user, through :comments

## purchasesテーブル

|   Column    |     Type      |   Options   |
| ----------- | ------------- | ----------- |
| cre_number  | integer       | null: false |
| deadline    | integer       | null: false |
| sec_code    | integer       | null: false |
| pos_code    | integer       | null: false |
| prefectures | text          | null: false |
| city        | text          | null: false |
| numbering   | text, integer | null: false |
| building    | text          |             |
| tel_number  | integer       | null: false |

### Association

- belongs_to :item

## commentsテーブル

| Column |    Type    |              Options            |
| ------ | ---------- | ------------------------------- |
| text   | text       | null: false                     |
| user   | references | null: false, foreign_keys: true |
| items  | references | null: false, foreign_keys: true |

### Association

- belongs_to :user
- belongs_to :item