class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :title, null: false, minimum: 1
    	t.string :description, null: false, minimum: 50
    	t.string :url, null: false

    	t.timestamps
    end
  end
end
