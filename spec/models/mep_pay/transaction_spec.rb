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
      it { should belong_to(:typable) }
    end
  end
end
