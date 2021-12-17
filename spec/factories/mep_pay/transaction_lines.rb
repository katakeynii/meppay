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
FactoryBot.define do
  factory :"mep_pay/transaction_line" do
    code { "MyString" }
    montant { "9.99" }
    mep_pay_transaction {nil}
  end
end
