class AddUserIdToTransports < ActiveRecord::Migration[7.1]
  def change
    add_reference :transports, :user, null: false, foreign_key: true
  end
end
