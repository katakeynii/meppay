# == Schema Information
#
# Table name: mep_pay_transactions
#
#  id           :integer          not null, primary key
#  montant      :decimal(, )
#  paid         :boolean
#  paid_at      :datetime
#  typable_type :string           not null
#  uuid         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  typable_id   :integer          not null
#
# Indexes
#
#  index_mep_pay_transactions_on_typable  (typable_type,typable_id)
#  index_mep_pay_transactions_on_uuid     (uuid) UNIQUE
#
require 'rails_helper'

module MepPay
  RSpec.describe Transaction, type: :model do
    it 'should not created without a transaction type' do
      expect {
        MepPay::Transaction.create!
      }.to raise_error(ActiveRecord::RecordInvalid, /Typable must exist/)
    end
    describe "Validations when transactions type set" do 
      let(:transaction_type)	{ create(:"mep_pay/reference") }
      let(:transaction)	{ create(:"mep_pay/transaction", typable: transaction_type) }
      subject { transaction }
      it { should validate_presence_of(:uuid) }
      it { should validate_uniqueness_of(:uuid) }
      it { should validate_presence_of(:montant) }
      it do
        should validate_numericality_of(:montant)
          .is_greater_than_or_equal_to(0)
      end
    end

    describe "Association" do
      it { should have_many(:references).through(:reference_values) }
      it { should have_many(:reference_values) }
      it { should have_many(:transaction_lines) }
      it { should belong_to(:typable) }
    end
  end
end
