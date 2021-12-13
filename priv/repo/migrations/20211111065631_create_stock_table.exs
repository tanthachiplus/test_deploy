defmodule TestDeploy.Repo.Migrations.CreateStockTable do
  use Ecto.Migration

  def change do
    create table("stock") do
      add :exchng, :string, size: 10, null: false
      add :no, :string, size: 10, null: false
      add :price, :integer, null: false
      add :ceiling_price, :integer, null: false
      add :floor_price, :integer, null: false
      add :session_id, :string, size: 3, null: false
      add :market_id, :string, size: 4, null: false
      add :deleted, :smallint, null: false

      timestamps()
    end

    create unique_index(:stock, [:no])

    execute "CREATE SEQUENCE stock_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE stock MODIFY id NUMBER DEFAULT stock_seq.nextval"

    alter table("stock") do
      modify :id, :integer
    end
  end
end
