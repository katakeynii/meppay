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
FactoryBot.define do
  factory :"mep_pay/reference" do
    sequence(:code) { |n| "0#{n}" }
    sequence(:libelle) { |n| "Title##{n}" }
  end
end
