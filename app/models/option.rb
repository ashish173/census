class Option < ActiveRecord::Base
  attr_accessible :desc, :question_id
  has_one :option
  belongs_to :question
  belongs_to :survey
  belongs_to :answer


  validates :desc, presence: true, length: { minimum: 5 }
  #validates :question_id, presence: true
end
