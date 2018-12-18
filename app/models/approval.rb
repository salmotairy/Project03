class Approval < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_one_id"
  belongs_to :requester, class_name: "User", foreign_key: "user_two_id"
end
