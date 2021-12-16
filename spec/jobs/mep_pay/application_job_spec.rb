require 'rails_helper'

module MepPay
  RSpec.describe ApplicationJob, type: :job do
    it { expect(described_class.superclass).to be  ActiveJob::Base }
  end
end
