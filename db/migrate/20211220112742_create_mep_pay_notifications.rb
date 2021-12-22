class CreateMepPayNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :mep_pay_notifications do |t|
      t.string :ref_operation
      t.decimal :montant
      t.string :status
      t.string :ref_ordre
      t.datetime :paid_at
      t.string :ref_payment
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
