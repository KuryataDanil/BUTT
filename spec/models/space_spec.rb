require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe Space, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:opening_time) }
    it { should validate_presence_of(:closing_time) }
  end

  describe 'associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:space_objects) }
    it { should have_many(:spots) }
  end
end
