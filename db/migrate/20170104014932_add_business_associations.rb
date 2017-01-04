class AddBusinessAssociations < ActiveRecord::Migration[5.0]
  def change
    add_reference :agents, :business, foreign_key: true, index: true
    add_reference :customers, :business, foreign_key: true, index: true
    add_reference :drivers, :business, foreign_key: true, index: true
    add_reference :orders, :business, foreign_key: true, index: true
  end
end
