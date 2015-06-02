class RemoveFieldsFromMembers < ActiveRecord::Migration
  def self.up
    remove_column :members, :sash_id
    remove_column :members, :level
  end
end
