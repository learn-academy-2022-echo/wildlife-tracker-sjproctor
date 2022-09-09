class Animal < ApplicationRecord
  has_many :sightings
  accepts_nested_attributes_for :sightings
  
  validates :common_name, :scientific_binomial, presence: true
  validates :common_name, :scientific_binomial, uniqueness: true

  validate :check_common_name_and_scientific_binomial
  def check_common_name_and_scientific_binomial
    if common_name == scientific_binomial
      errors.add(:common_name, "The names cannot be equal.")
      errors.add(:scientific_binomial, "The names cannot be equal.")
    end
  end
end
