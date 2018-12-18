class CreateJoinTableCardsStacks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cards, :stacks do |t|
      # t.index [:card_id, :stack_id]
      # t.index [:stack_id, :card_id]
    end
  end
end
