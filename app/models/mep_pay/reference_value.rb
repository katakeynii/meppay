module MepPay
  class ReferenceValue < ApplicationRecord
    belongs_to :mep_pay_reference, class_name: 'MepPay::Reference'
    belongs_to :mep_pay_transaction, class_name: 'MepPay::Transaction'
  end
end
