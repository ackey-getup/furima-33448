class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,       null: false
      t.integer    :price,       null: false
      t.text       :explanation, null: false
      t.references :user,        null: false, foreign_keys: true
      t.integer    :category_id, null: false
      t.integer    :status_id,   null: false
      t.integer    :delivery_id, null: false
      t.integer    :region_id,   null: false
      t.integer    :mean_id,     null: false
      t.timestamps
    end
  end
end
