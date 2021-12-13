defmodule TestDeploy.Repo.Migrations.CreateStockAccountBalanceTable do
  use Ecto.Migration

  def change do
    create table("stock_account_balance") do
      add :account_id, :string, null: false
      add :cash_bal, :decimal, default: 0.0
      add :cash_on_hold, :decimal, default: 0.0
      add :secure_amout, :integer, default: 0
      add :withdrawable, :decimal, default: 0.0
      add :receiving_cash_t1, :decimal, default: 0.0
      add :receiving_cash_t2, :decimal, default: 0.0
      add :matched_buy_volumn, :integer, default: 0
      add :matched_sell_volumn, :integer, default: 0
      add :unmatched_buy_volumn, :integer, default: 0
      add :unmatched_sell_volumn, :integer, default: 0
      add :paid_cash_t1, :decimal, default: 0.0
      add :paid_cash_t2, :decimal, default: 0.0
      add :cia, :integer, default: 0
      add :debt, :integer, default: 0
      add :purchaing_power, :decimal, default: 0.0
      add :total_asset, :decimal, default: 0.0
      add :status, :string, size: 1, default: "n"
      add :deleted, :smallint, null: false

      add :tse_client_id, references(:client, on_delete: :delete_all)
      add :tse_account_id, references(:stock_account, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:stock_account_balance, [:account_id])

    execute "CREATE SEQUENCE stock_account_balance_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE stock_account_balance MODIFY id NUMBER DEFAULT stock_account_balance_seq.nextval"

    alter table("stock_account_balance") do
      modify :id, :integer
    end
  end
end
