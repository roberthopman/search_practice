class AddGroupsToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :group_id, :integer
  end
end
