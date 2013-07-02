class Question < ActiveRecord::Base
  attr_accessible :desc, :survey_id, :options_attributes

  #association
  belongs_to :survey
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, :allow_destroy => true
  #validation
  validates :desc, uniqueness: true, presence: true, length: { minimum: 5 }
  #validates :survey_id, presence: true 

end
