# == Schema Information
#
# Table name: mep_pay_references
#
#  id         :integer          not null, primary key
#  code       :string
#  libelle    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

module MepPay
  RSpec.describe Reference, type: :model do
    describe "Validations" do 
      it { should validate_presence_of(:code) }
      it { should validate_presence_of(:libelle) }
      it { should validate_uniqueness_of(:code) }
    end

    describe "Associations" do 
      it { should have_many :reference_values}
      it { should have_many(:transactions).through(:reference_values) }
    end
  end
end
