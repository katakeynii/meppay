require 'rails_helper'
module MepPay
  RSpec.describe ApplicationController, type: :request do
    describe "GET /index" do
      it { expect(described_class.superclass).to be  ActionController::Base }
    end
  end
end
