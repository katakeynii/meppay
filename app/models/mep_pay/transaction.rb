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
module MepPay
  class Transaction < ApplicationRecord
    belongs_to :typable, polymorphic: true
    has_many :reference_values, class_name: 'MepPay::ReferenceValue', foreign_key: "mep_pay_transaction_id"
    has_many :references, through: :reference_values, class_name: 'MepPay::Reference', source: "mep_pay_reference"
    attribute :uuid, :string, default: -> { SecureRandom.uuid }
    validates :uuid, 
      uniqueness: true,
      presence: true

    validates :montant, 
      presence: true,
      numericality: { 
        greater_than_or_equal_to: 0
      }
  end
end
