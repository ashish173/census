class Answer < ActiveRecord::Base
  attr_accessible :user_id, :survey_id, :option_id

  has_many :surveys
  has_many :users
  validates :user_id, :option_id, presence: true
end
