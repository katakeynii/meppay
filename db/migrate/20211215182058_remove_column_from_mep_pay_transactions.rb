class RemoveColumnFromMepPayTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_reference :mep_pay_transactions, :nature, null: false, foreign_key: true
  end
end
