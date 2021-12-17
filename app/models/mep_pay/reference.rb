# == Schema Information
#
# Table name: mep_pay_references
#
#  id         :integer          not null, primary key
#  code       :string
#  libelle    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module MepPay
  class Reference < ApplicationRecord
    has_many :reference_values, class_name: 'MepPay::ReferenceValue', foreign_key: "mep_pay_reference_id"
    has_many :transactions, through: :reference_values, class_name: 'MepPay::Transaction', source: "mep_pay_transaction"
    validates :code, presence: true, uniqueness: true
    validates :libelle, presence: true
  end
end
