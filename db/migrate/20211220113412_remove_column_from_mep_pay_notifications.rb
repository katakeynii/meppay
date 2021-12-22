class RemoveColumnFromMepPayNotifications < ActiveRecord::Migration[6.1]
  def change
    remove_reference :mep_pay_notifications, :transaction, null: false, foreign_key: true
  end
end
