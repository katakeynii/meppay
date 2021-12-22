module MepPay
  class ApplicationController < ActionController::Base
    include SetCurrentRequestDetails
    rescue_from StandardError do |error|
      @error = error
      render template: "mep_pay/error/error", status: :bad_request
    end
  end

end
