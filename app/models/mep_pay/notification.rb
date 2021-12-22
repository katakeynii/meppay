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
module MepPay
  class Notification < ApplicationRecord
    belongs_to :mep_pay_transaction, class_name: 'MepPay::Transaction'

    validates :ref_ordre, :ref_operation,
    :ref_payment,
    :status,
    :paid_at,
    :montant,
    presence: true
    validates :montant, 
      presence: true,
      numericality: { 
        greater_than_or_equal_to: 0
      }
  end
end
