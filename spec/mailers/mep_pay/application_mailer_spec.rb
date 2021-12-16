require "rails_helper"

module MepPay
  RSpec.describe ApplicationMailer, type: :mailer do
    it { expect(described_class.superclass).to be  ActionMailer::Base }
  end
end
