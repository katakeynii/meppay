require_dependency "mep_pay/application_controller"

module MepPay
  class TransactionsController < ApplicationController
    def create
      transaction = ::TransactionCreatorService.call(transaction_params)
      sutpayin_param = PaymentPayloadBuilder.call transaction
      redirect_to "#{ENV["SUT_URL"]}#{ENV["SUT_PATH"]}#{sutpayin_param}"
      
    rescue => e
        @error = e
        render "error", status: :bad_request
    end

    private 
      def transaction_params
        params.require(:montant)
        params.require(:purchase_type)
        params.require(:purchase_id)
        params.permit(:montant, 
          :purchase_type, 
          :purchase_id, 
          recettes: [:code, :montant],
          references: [:code, :value]
        )
      end
      
  end
end
