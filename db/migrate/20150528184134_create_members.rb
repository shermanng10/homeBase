class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
    	t.string :role, null: false
    	t.string :name, null: false
    	t.integer :family_id, null: false
    	t.integer :points, default: 0
    	t.string :color, null: false
    	t.string :img_url, null: false

      t.timestamps null: false
    end
  end
end
