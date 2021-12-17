# == Schema Information
#
# Table name: mep_pay_transactions
#
#  id           :integer          not null, primary key
#  montant      :decimal(, )
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
FactoryBot.define do
  factory :"mep_pay/transaction" do
    uuid { "MyString" }
    montant { "9.99" }
    typable { create(:"mep_pay/reference") }
  end
end
