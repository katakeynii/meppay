require 'rails_helper'

module MepPay
  RSpec.describe ReferenceValue, type: :model do
    let(:ref_value)	{ 
      create(
        :"mep_pay/reference_value", 
        mep_pay_transaction: create(:"mep_pay/transaction"),
        mep_pay_reference: create(:"mep_pay/reference", code: "REF_VALUE_CODE_1"),
        value: "Mouss"
      ) 
    } 
    it "should return value created" do 
      expect(ref_value.value).to eq("Mouss")
    end
    describe "Association" do
      it { should belong_to(:"mep_pay_transaction") } 
      it { should belong_to(:"mep_pay_reference") } 
    end

  end
end
