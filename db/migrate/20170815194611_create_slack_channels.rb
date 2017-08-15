class CreateSlackChannels < ActiveRecord::Migration
  def change
    create_table :slack_channels do |t|
      t.string :slack_id, :index => true
      t.string :slack_name
      t.boolean :private
      t.string :topic
      t.string :purpose
      t.boolean :closed, :default => false
      t.boolean :official, :default => false
    end
  end
end
