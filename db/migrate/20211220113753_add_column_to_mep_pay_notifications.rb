class AddColumnToMepPayNotifications < ActiveRecord::Migration[6.1]
  def change
    add_reference :mep_pay_notifications, :mep_pay_transaction, null: true, foreign_key: true
  end
end
