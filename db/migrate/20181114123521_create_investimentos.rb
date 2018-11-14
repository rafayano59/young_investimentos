class CreateInvestimentos < ActiveRecord::Migration[5.0]
  def change
    create_table :investimentos do |t|
      t.string :titulo
      t.integer :nivel
      t.decimal :valor
      t.decimal :lucroporcentagem
      t.decimal :lucrovalor
      t.datetime :dataretirada

      t.timestamps
    end
  end
end
