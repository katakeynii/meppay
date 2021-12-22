class PaymentPayloadBuilder < ApplicationService
    def initialize transaction
        @transaction = transaction
    end

    def call 
        payload = {
            "refOperation": @transaction.uuid,
            "refApp": "002", #to change by env config value
            "montantTotal": @transaction.montant,
            "natureOperation": "0",
            "natureTransaction": "0",
            "recettes": get_recettes,
            "references": get_references
        }.to_json
        encrypted = CipherService.call method: :encrypt, payload: payload
        CGI.escape(encrypted.value)
    end

    private
        def get_recettes
            @transaction.transaction_lines.each do |recette| 
                {"codeRecette": recette.code, "montantRecette": recette.montant}
            end
        end

        def get_references
            @transaction.reference_values.each do |ref| 
                {"code": ref.mep_pay_reference.code, "value": ref.value}
            end
        end

end