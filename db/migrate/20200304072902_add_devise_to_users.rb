# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  def self.up
    create_table :users, id: :uuid do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
    end

    add_index :users, :email,                unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
