class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :twilio_api
    	t.string :twilio_secret
    	t.string :twilio_phone_number
    	t.string :email
    	t.string :password_digest

      t.timestamps
    end
  end
end
