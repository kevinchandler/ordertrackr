class RenameUserIdOnOrdersToAgentId < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :user_id, :agent_id
  end
end
