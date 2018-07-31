require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Relationships' do
    it {should have_many(:comments)}
  end

  describe 'Validation' do
    it {should validate_presence_of(:title)}
    it {should validate_length_of(:title).is_at_least(5)}
  end

  describe 'Columns' do
    it{should have_db_column(:body)}
    it{should have_db_column(:title)}
  end

end