# == Schema Information
#
# Table name: mep_pay_request_events
#
#  id             :integer          not null, primary key
#  event_detail   :text
#  ip_address     :string
#  path           :string
#  remote_ip      :string
#  request_method :string
#  user_agent     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  request_id     :string
#
module MepPay
  class RequestEvent < ApplicationRecord
  end
end
