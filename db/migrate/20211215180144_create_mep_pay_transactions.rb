class CreateMepPayTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :mep_pay_transactions do |t|
      t.string :uuid
      t.decimal :montant
      t.references :nature, null: false, foreign_key: true

      t.timestamps
    end
    add_index :mep_pay_transactions, :uuid, unique: true
  end
end
