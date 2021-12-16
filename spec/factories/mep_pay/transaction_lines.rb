FactoryBot.define do
  factory :"mep_pay/transaction_line" do
    code { "MyString" }
    montant { "9.99" }
    mep_pay_transaction {nil}
  end
end
