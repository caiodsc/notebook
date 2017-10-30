class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.references :kind, index: true, foreign_key: true
      t.text :rmk

      t.timestamps null: false
    end
  end
end
