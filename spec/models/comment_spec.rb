require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Relationships' do
    it{ should belong_to(:post)  }
  end

  describe 'Columns' do
    it{should have_db_column(:body)}
    it{should have_db_column(:username)}
  end
end