class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body, :null => false
      t.timestamps
    end
  end
end
