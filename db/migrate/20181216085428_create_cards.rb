class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :role
      t.string :company_name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
