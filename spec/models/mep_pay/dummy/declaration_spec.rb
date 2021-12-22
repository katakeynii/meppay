# == Schema Information
#
# Table name: mep_pay_dummy_declarations
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

module MepPay
  RSpec.describe Dummy::Declaration, type: :model do
    describe "Validations" do 
      it { should validate_presence_of(:title) }
    end

  end
end
