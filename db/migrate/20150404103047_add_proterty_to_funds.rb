class AddProtertyToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :code, :int
    add_index :funds, :code
    add_column :funds, :name, :string
    add_column :funds, :newnet, :decimal, precision:5, scale:4
    add_column :funds, :totalnet, :decimal, precision:5, scale:4
    add_column :funds, :dayincrease, :decimal, precision:5, scale:4
    add_column :funds, :daygrowrate, :decimal, precision:5, scale:4
    add_column :funds, :weekgrowrate, :decimal, precision:3, scale:2
    add_column :funds, :monthgrowrate, :decimal, precision:3, scale:2
    add_column :funds, :annualincome, :decimal, precision:3, scale:2
    add_column :funds, :time, :date
  end
end
