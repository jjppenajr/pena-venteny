class CreateBusinessLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :business_loans, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.decimal :entry, precision: 6, scale: 0

      t.timestamps
    end
  end
end
