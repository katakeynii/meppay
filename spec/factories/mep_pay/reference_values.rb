FactoryBot.define do
  factory :"mep_pay/reference_value" do
    mep_pay_reference { nil }
    mep_pay_transaction { nil }
    value { "MyString" }
  end
end
