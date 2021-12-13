defmodule TestDeploy.Repo.Migrations.CreateDerivativesAccountTable do
  use Ecto.Migration

  def change do
    create table("derivative_account") do
      add :account_id, :string, null: false
      add :open_date, :naive_datetime
      add :close_date, :naive_datetime
      add :status, :string, size: 1, null: false, default: "n"
      add :deleted, :smallint, null: false
      add :prohibit_buy, :smallint, null: false, default: 0
      add :prohibit_sell, :smallint, null: false, default: 0
      add :block_cash_withdraw, :smallint, null: false, default: 0
      add :block_cash_deposit, :smallint, null: false, default: 0
      add :block_cash_transfer, :smallint, null: false, default: 0
      add :block_stock_withdraw, :smallint, null: false, default: 0
      add :block_stock_deposit, :smallint, null: false, default: 0
      add :block_stock_transfer, :smallint, null: false, default: 0
      add :tse_client_id, references(:client, on_delete: :delete_all)
      timestamps()
    end

    create unique_index(:derivative_account, [:account_id])

    execute "CREATE SEQUENCE derivative_account_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE derivative_account MODIFY id NUMBER DEFAULT derivative_account_seq.nextval"

    alter table("derivative_account") do
      modify :id, :integer
    end
  end
end
