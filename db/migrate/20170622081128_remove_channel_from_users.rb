class RemoveChannelFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :channel, foreign_key: true
  end
end
