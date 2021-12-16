class CreateMepPayReferences < ActiveRecord::Migration[6.1]
  def change
    create_table :mep_pay_references do |t|
      t.string :code
      t.string :libelle

      t.timestamps
    end
  end
end
