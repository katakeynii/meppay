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
module MepPay
  class TransactionLine < ApplicationRecord
    belongs_to :mep_pay_transaction, class_name: "MepPay::Transaction"
    validates :code, presence: true, uniqueness: true
    validates :montant, 
      presence: true,
      numericality: { 
        greater_than_or_equal_to: 0
      }
  end
end
