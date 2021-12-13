defmodule TestDeploy.Repo.Migrations.CashMoverment do
  use Ecto.Migration

  def change do
    create table("cash_moverment_stock_account") do
      add :account_id, :string
      add :tse_account_id, references(:stock_account, on_delete: :delete_all)
      add :from_account_id, :string
      add :tse_from_account_id, references(:stock_account, on_delete: :delete_all)
      add :amount, :decimal, default: 0.0
      add :trans_date, :date
      add :trans_type, :string, size: 1, null: false
      add :channel, :string, size: 3, null: false
      add :remark, :string
      add :create_by, :string
      add :create_by_id, :integer
      add :create_time, :time
      add :deleted, :smallint, null: false

      timestamps()
    end

    create index(:cash_moverment_stock_account, [:account_id])

    execute "CREATE SEQUENCE cash_moverment_stock_account
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE cash_moverment_stock_account MODIFY id NUMBER DEFAULT cash_moverment_stock_account_seq.nextval"

    alter table("cash_moverment_stock_account") do
      modify :id, :integer
    end

    create table("cash_moverment_derivative_account") do
      add :account_id, :string
      add :tse_account_id, references(:derivative_account, on_delete: :delete_all)
      add :from_account_id, :string
      add :tse_from_account_id, references(:derivative_account, on_delete: :delete_all)
      add :amount, :decimal, default: 0.0
      add :trans_date, :date
      add :trans_type, :string, size: 1, null: false
      add :channel, :string, size: 3, null: false
      add :remark, :string
      add :create_by, :string
      add :create_by_id, :integer
      add :create_time, :time
      add :deleted, :smallint, null: false

      timestamps()
    end

    create index(:cash_moverment_derivative_account, [:account_id])

    execute "CREATE SEQUENCE cash_moverment_derivative_account
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE cash_moverment_derivative_account MODIFY id NUMBER DEFAULT cash_moverment_derivative_account_seq.nextval"

    alter table("cash_moverment_derivative_account") do
      modify :id, :integer
    end
  end
end
