class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    change_table :orders do |t|
      t.index :delivery_address_id
      t.index :complete
      t.index :guid
    end
  end
end
