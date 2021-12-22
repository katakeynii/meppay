require 'rails_helper'

RSpec.describe "PaymentNotifications", type: :request do
  describe "POST /mep_pay/payment-notifications" do
    let(:base_error_message)	{ "param is missing or the value is empty:" }
    it "require presence of param montant" do
      post "/mep_pay/payment-notifications"
      expect(response.body).to include("#{base_error_message} sutpayin") 
    end
    
    context "a context" do
      before do
        create(:"mep_pay/transaction")
      end
      let(:sutpayin) { "OxyEQ8Sq9FXGjqqMfPEfYnLH7JZ0ihAKK+9bPdFYxZwSD1+mihdmCXx8TeqZ\n9E9+uH09nXXZee3bv+/IXiCny3kim/FsbpLLLAIDjgQZ9dRA1ItSIs93z1Iv\ns131Xg/UUdzEEQt0OGvrFeDwfFx6+JMxPrD9rz6siOIphDvjokdcg7dqjzQf\nR7Hc1GFXSSKkj12AoPQ5pi9+GaKJ7/eiMwc2Niz2961rKuz3lWNdEMSYqMFS\nOl4ymYANRNlhBSizvTgbSpiqEAO1s3qoYoYKcQ==\n" }
      it "should update the transaction corecords" do
        post "/mep_pay/payment-notifications", params: { 
          sutpayin: CGI.escape(sutpayin)
        }
        notification = MepPay::Notification.last
        expect(notification.mep_pay_transaction.paid).to be true
        expect(notification.mep_pay_transaction.paid_at).to_not be_nil 
        expect(response.status).to eq(200)
        # byebug
      end
    end
    
    # it "returns http success" do
    #   post "/payment_notifications/create"
    #   expect(response).to have_http_status(:success)
    # end
  end
end
