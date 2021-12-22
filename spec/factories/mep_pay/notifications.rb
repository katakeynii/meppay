# == Schema Information
#
# Table name: mep_pay_notifications
#
#  id                     :integer          not null, primary key
#  montant                :decimal(, )
#  paid_at                :datetime
#  ref_operation          :string
#  ref_ordre              :string
#  ref_payment            :string
#  status                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  mep_pay_transaction_id :integer
#
# Indexes
#
#  index_mep_pay_notifications_on_mep_pay_transaction_id  (mep_pay_transaction_id)
#
# Foreign Keys
#
#  mep_pay_transaction_id  (mep_pay_transaction_id => mep_pay_transactions.id)
#
FactoryBot.define do
  factory :notification do
    ref_operation { "MyString" }
    montant { "9.99" }
    status { "MyString" }
    ref_ordre { "MyString" }
    paid_at { "2021-12-20 11:27:42" }
    ref_payment { "MyString" }
    transaction { nil }
  end
end
