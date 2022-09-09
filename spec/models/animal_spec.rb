require 'rails_helper'

RSpec.describe Animal, type: :model do
  
  it 'is valid with valid attributes' do
    expect(Animal.create(common_name: 'Mule Deer', scientific_binomial: 'Odocoileus hemionus')).to be_valid
  end

  it 'is not valid without a common name' do
    animal = Animal.create(common_name: nil, scientific_binomial: 'Odocoileus hemionus')
    expect(animal).to_not be_valid
  end

  it 'is not valid without a scientific binomial' do
    animal = Animal.create(common_name: 'Mule Deer', scientific_binomial: nil)
    expect(animal).to_not be_valid
  end

  it 'is not valid if common name exactly matches scientific binomial' do
    animal = Animal.create(common_name: 'Mule Deer', scientific_binomial: 'Mule Deer')
    expect(animal.errors[:common_name].first).to eq('The names cannot be equal.')
  end

  it 'must have a unique common name' do
    animal1 = Animal.create(common_name: 'Mule Deer', scientific_binomial: 'Odocoileus hemionus')
    animal2 = Animal.create(common_name: 'Mule Deer', scientific_binomial: 'Odocoileus')
    expect(animal2.errors[:common_name].first).to eq('has already been taken')
  end

  it 'must have a unique scientific binomial' do
    animal1 = Animal.create(common_name: 'Mule Deer', scientific_binomial: 'Odocoileus hemionus')
    animal2 = Animal.create(common_name: 'Mule', scientific_binomial: 'Odocoileus hemionus')
    expect(animal2.errors[:scientific_binomial].first).to eq('has already been taken')
  end
  
end
