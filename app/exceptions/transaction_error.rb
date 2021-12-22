class TransactionError < StandardError
    def message
        "Le montant doit etre egal au total des recettes"
    end
end