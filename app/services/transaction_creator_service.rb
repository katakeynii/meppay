
class TransactionCreatorService < ApplicationService
    def initialize params
        data = params.to_h.deep_symbolize_keys
        @recettes = data[:recettes]
        @montant = data[:montant].to_i
        @purchase_type = data[:purchase_type]
        @purchase_id = data[:purchase_id]
        @references = data[:references]
    end

    def call
        purchase_klass = @purchase_type.constantize
        raise UnknownModelError unless purchase_klass.is_a?(Class)
        purchasable = purchase_klass.find(@purchase_id)
    
        unless @recettes.nil?
            total = @recettes.inject(0) do |sum, recette| 
                sum + recette[:montant].to_i
            end
            raise TransactionError unless total.eql?(@montant)
        end
        ActiveRecord::Base.transaction do
            transaction = MepPay::Transaction.create! typable: purchasable, montant: @montant
            @recettes.each { |recette| transaction.transaction_lines.create! recette }
            unless @references.nil?
                codes = @references.map { |ref| ref[:code] }
                refs = MepPay::Reference.where(code: codes)
                @references.each do |ref_kv| 
                    ref_record = refs.find {|ref| ref.code.eql?(ref_kv[:code])}
                    transaction.reference_values.create! mep_pay_reference: ref_record, value: ref_kv[:value]
                end
            end
            transaction
        end
    end
end