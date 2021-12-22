class CreateMepPayRequestEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :mep_pay_request_events do |t|
      t.string :request_id
      t.string :user_agent
      t.string :ip_address
      t.text :event_detail
      t.string :path
      t.string :remote_ip
      t.string :request_method

      t.timestamps
    end
  end
end
