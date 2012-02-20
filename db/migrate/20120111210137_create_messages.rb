class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, :null => false
      t.string :body, :null => false
      t.timestamps
    end
    add_index :messages, :user_id
  end
end