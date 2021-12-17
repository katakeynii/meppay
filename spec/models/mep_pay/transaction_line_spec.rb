# == Schema Information
#
# Table name: mep_pay_transaction_lines
#
#  id                     :integer          not null, primary key
#  code                   :string
#  montant                :decimal(, )
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  mep_pay_transaction_id :integer          not null
#
# Indexes
#
#  index_mep_pay_transaction_lines_on_mep_pay_transaction_id  (mep_pay_transaction_id)
#
# Foreign Keys
#
#  mep_pay_transaction_id  (mep_pay_transaction_id => mep_pay_transactions.id)
#
require 'rails_helper'

module MepPay
  RSpec.describe TransactionLine, type: :model do

    it 'should not created without a transaction' do
      expect {
        MepPay::TransactionLine.create!(code: "REF_CODE_TRANSACTION_LINE_1")
      }.to raise_error(ActiveRecord::RecordInvalid, /Mep pay transaction must exist/)
    end
    describe "When transaction is defined" do 
      let(:transaction_type)	{ create(:"mep_pay/reference", code: "REF_CODE_TRANSACTION_LINE_1") }
      let(:transaction_line)	{ create(:"mep_pay/transaction_line",
        mep_pay_transaction: create(:"mep_pay/transaction", typable: transaction_type)
      ) }
      subject { transaction_line }

      describe "Validations" do 
        it { should validate_presence_of(:code) }
        it { should validate_uniqueness_of(:code) }
        it { should validate_presence_of(:montant) }
        it do
          is_expected.to validate_numericality_of(:montant)
            .is_greater_than_or_equal_to(0)
        end
      end

      describe "Association" do
        it { should belong_to(:"mep_pay_transaction") } 
      end
    end
    
  end
end
