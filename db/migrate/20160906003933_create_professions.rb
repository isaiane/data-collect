class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
    	t.string :name
    	t.integer :row_order
    	t.integer :records_count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
