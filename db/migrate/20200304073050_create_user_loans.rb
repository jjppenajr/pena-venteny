class CreateUserLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :user_loans, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.uuid :loan_id, index: true
      t.string :loan_type, index: true

      t.timestamps
    end
  end
end
