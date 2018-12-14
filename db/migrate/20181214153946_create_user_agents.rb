class CreateUserAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_agents do |t|
      t.integer :counter, default: 0
      t.string :user_agent_string, index: true, null: false

      t.timestamps
    end
  end
end
