class Question < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates_uniqueness_of :user_id, scope: :test_id
  validates_uniqueness_of :test_id, scope: :user_id
end
