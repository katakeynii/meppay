# == Schema Information
#
# Table name: mep_pay_reference_values
#
#  id                     :integer          not null, primary key
#  value                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  mep_pay_reference_id   :integer          not null
#  mep_pay_transaction_id :integer          not null
#
# Indexes
#
#  index_mep_pay_reference_values_on_mep_pay_reference_id    (mep_pay_reference_id)
#  index_mep_pay_reference_values_on_mep_pay_transaction_id  (mep_pay_transaction_id)
#
# Foreign Keys
#
#  mep_pay_reference_id    (mep_pay_reference_id => mep_pay_references.id)
#  mep_pay_transaction_id  (mep_pay_transaction_id => mep_pay_transactions.id)
#
module MepPay
  class ReferenceValue < ApplicationRecord
    belongs_to :mep_pay_reference, class_name: 'MepPay::Reference'
    belongs_to :mep_pay_transaction, class_name: 'MepPay::Transaction'
  end
end
