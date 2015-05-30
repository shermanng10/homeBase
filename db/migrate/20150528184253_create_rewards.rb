class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
    	t.string :name, null: false
    	t.integer :cost, null: false
    	t.string :category
    	t.integer :family_id, null: false
    	t.integer :member_id

      t.timestamps null: false
    end
  end
end
