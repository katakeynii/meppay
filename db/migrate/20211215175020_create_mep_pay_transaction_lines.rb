class CreateMepPayTransactionLines < ActiveRecord::Migration[6.1]
  def change
    create_table :mep_pay_transaction_lines do |t|
      t.string :code
      t.decimal :montant

      t.timestamps
    end
  end
end
