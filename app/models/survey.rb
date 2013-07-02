class Survey < ActiveRecord::Base
  attr_accessible :name, :year, :questions_attributes
  
  has_many :questions, dependent: :destroy
  has_many :options, through: :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, :allow_destroy => true

  validates :name, :year, presence: true  
  validates :name, length: { minimum: 6 }
end
