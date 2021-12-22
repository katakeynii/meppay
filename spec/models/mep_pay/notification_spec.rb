# == Schema Information
#
# Table name: mep_pay_notifications
#
#  id                     :integer          not null, primary key
#  montant                :decimal(, )
#  paid_at                :datetime
#  ref_operation          :string
#  ref_ordre              :string
#  ref_payment            :string
#  status                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  mep_pay_transaction_id :integer
#
# Indexes
#
#  index_mep_pay_notifications_on_mep_pay_transaction_id  (mep_pay_transaction_id)
#
# Foreign Keys
#
#  mep_pay_transaction_id  (mep_pay_transaction_id => mep_pay_transactions.id)
#
require 'rails_helper'

module MepPay
  RSpec.describe Notification, type: :model do
    describe "Validations" do
      it { should validate_presence_of(:ref_ordre) }
      it { should validate_presence_of(:ref_operation) }
      it { should validate_presence_of(:ref_payment) }
      it { should validate_presence_of(:status) }
      it { should validate_presence_of(:paid_at) }
      it { should validate_presence_of(:montant) }
      it do
        should validate_numericality_of(:montant)
          .is_greater_than_or_equal_to(0)
      end
    end
  
    describe "Associations" do
      it { should belong_to(:mep_pay_transaction) }
    end
  end
end
