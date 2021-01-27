class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string     :pos_code,   null: false
      t.integer    :region_id,  null: false
      t.string     :city,       null: false
      t.string     :numbering,  null: false
      t.string     :building
      t.string     :tel_number, null: false
      t.references :purchase_histories, null: false, foreign_keys: true
      t.timestamps
    end
  end
end
