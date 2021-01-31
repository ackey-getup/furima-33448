class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text       :text, null: false, foreign_keys: true
      t.references :user, null: false, foreign_keys: true
      t.references :item, null: false, foreign_keys: true
      t.timestamps
    end
  end
end
