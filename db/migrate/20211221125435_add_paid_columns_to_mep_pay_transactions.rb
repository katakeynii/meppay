class AddPaidColumnsToMepPayTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :mep_pay_transactions, :paid, :boolean
    add_column :mep_pay_transactions, :paid_at, :datetime
  end
end
