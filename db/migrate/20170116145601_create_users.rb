class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password_digest
      t.string :name
    end
  end
end