class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      t.integer :user_one_id
      t.integer :user_two_id
      t.boolean :approval

      t.timestamps
    end
  end
end
