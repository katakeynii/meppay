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
FactoryBot.define do
  factory :"mep_pay/transaction" do
    uuid { "4fa93662-c28c-45c2-be04-f4618f196912" }
    montant { 10_000 }
    typable { create(:"mep_pay/reference") }
  end
end
