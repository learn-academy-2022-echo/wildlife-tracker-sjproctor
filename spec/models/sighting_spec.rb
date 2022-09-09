require 'rails_helper'

RSpec.describe Sighting, type: :model do

  let(:animal) {
  Animal.create(
      common_name: 'Mule Deer',
      scientific_binomial: 'Odocoileus hemionus'
    )
  }

  it 'is valid with valid attributes' do
    expect(Sighting.create(
      latitude: '45.5152° N', 
      longitude: '123.6794° W', 
      date: '2022-09-08',
      animal_id: animal.id
    )).to be_valid
  end

  it 'is not valid without a latitude' do
    sighting = Sighting.create(
      latitude: nil,
      longitude: '123.6794° W',
      date: '2022-09-08',
      animal_id: animal.id
    )
    expect(sighting).to_not be_valid
  end

  it 'is not valid without a longitude' do
    sighting = Sighting.create(
      latitude: '45.5152° N', 
      longitude: nil,
      date: '2022-09-08',
      animal_id: animal.id
    )
    expect(sighting).to_not be_valid
  end

  it 'is not valid without a date' do
    sighting = Sighting.create(
      latitude: '45.5152° N', 
      longitude: '123.6794° W',
      date: nil,
      animal_id: animal.id
    )
    expect(sighting).to_not be_valid
  end

end
