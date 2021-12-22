# == Schema Information
#
# Table name: mep_pay_dummy_declarations
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :dummy_declaration, class: 'Dummy::Declaration' do
    title { "MyString" }
  end
end
