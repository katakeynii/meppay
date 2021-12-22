class CreateMepPayDummyDeclarations < ActiveRecord::Migration[6.1]
  def change
    create_table :mep_pay_dummy_declarations do |t|
      t.string :title

      t.timestamps
    end
  end
end
