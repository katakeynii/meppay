require_dependency "mep_pay/application_controller"

module MepPay
  class PaymentNotificationsController < ApplicationController
    def create
      sutpayin = CGI.unescape notification_params[:sutpayin]
      decrypted = CipherService.call(method: :decrypt, payload: sutpayin).to_hash
      transaction = MepPay::Transaction.find_by(uuid: decrypted[:refOperation])
      notification = Notification.create! do |notif|
        notif.montant       = decrypted[:montantPaiement]
        notif.ref_ordre     = decrypted[:refOrdre]
        notif.ref_operation = decrypted[:refOperation]
        notif.ref_payment   = decrypted[:refPaiement]
        notif.status        = decrypted[:statutPaiement]
        notif.paid_at       = decrypted[:datePaiement]
        notif.mep_pay_transaction = transaction
      end

      transaction.update!(
        paid_at: decrypted[:datePaiement],
        paid: true
      )
      render json: notification, status: :ok
    end

    private 
      def notification_params
        params.require(:sutpayin)
        params.permit(:sutpayin)
      end
  end
end
