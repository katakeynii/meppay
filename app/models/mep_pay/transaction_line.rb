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
