# == Schema Information
#
# Table name: mep_pay_dummy_declarations
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module MepPay
  class Dummy::Declaration < ApplicationRecord
    validates :title, presence: true
  end
end
