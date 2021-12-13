defmodule TestDeploy.Repo.Migrations.CreateStockInstrumentAsset do
  use Ecto.Migration

  def change do
    create table("stock_instrument_assets") do
      add :symbol, :string, size: 10, null: false
      add :on_hold, :integer, null: false, default: 0
      add :buy_t, :integer, null: false, default: 0
      add :buy_t1, :integer, null: false, default: 0
      add :buy_t2, :integer, null: false, default: 0
      add :sell_t, :integer, null: false, default: 0
      add :sell_t1, :integer, null: false, default: 0
      add :sell_t2, :integer, null: false, default: 0
      add :deleted, :smallint, null: false

      add :tse_account_id, references(:stock_account, on_delete: :delete_all)

      timestamps()
    end

    create index(:stock_instrument_assets, [:tse_account_id, :symbol])

    execute "CREATE SEQUENCE stock_instrument_assets_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE stock_instrument_assets MODIFY id NUMBER DEFAULT stock_instrument_assets_seq.nextval"

    alter table("stock_instrument_assets") do
      modify :id, :integer
    end
  end
end
