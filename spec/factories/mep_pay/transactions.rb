FactoryBot.define do
  factory :"mep_pay/transaction" do
    uuid { "MyString" }
    montant { "9.99" }
    typable { create(:"mep_pay/reference") }
  end
end
