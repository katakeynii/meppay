class AddColumnToMepPayTransactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :mep_pay_transactions, :typable, polymorphic: true, null: false
  end
end
