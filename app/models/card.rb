class Card < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :stacks
  # There needs to be a table called cards_stacks with a card_id and a stack_id
end
