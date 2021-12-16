class AddColumnToMepPayTransactionLines < ActiveRecord::Migration[6.1]
  def change
    add_reference :mep_pay_transaction_lines, :mep_pay_transaction, null: false, foreign_key: true
  end
end
