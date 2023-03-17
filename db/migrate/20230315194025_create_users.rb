class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :cpf, null: false
      t.string :cns, null: false
      t.string :email, null: false
      t.date :birth_date, null: false
      t.string :phone_number, null: false
      t.string :image, null: false
      t.boolean :status, null: false

      t.timestamps
    end
  end
end
