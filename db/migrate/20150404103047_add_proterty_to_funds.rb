class AddProtertyToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :code, :int
    add_index :funds, :code
    add_column :funds, :name, :string
    add_column :funds, :newnet, :decimal
    add_column :funds, :totalnet, :decimal
    add_column :funds, :dayincrease, :decimal
    add_column :funds, :daygrowrate, :decimal
    add_column :funds, :weekgrowrate, :decimal
    add_column :funds, :monthgrowrate, :decimal
    add_column :funds, :annualincome, :decimal
    add_column :funds, :time, :date
  end
end
