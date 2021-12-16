class CreateMepPayReferenceValues < ActiveRecord::Migration[6.1]
  def change
    create_table :mep_pay_reference_values do |t|
      t.references :mep_pay_reference, null: false, foreign_key: true
      t.references :mep_pay_transaction, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
