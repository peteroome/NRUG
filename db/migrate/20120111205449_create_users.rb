class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :medium
      t.timestamps
    end
  end
end