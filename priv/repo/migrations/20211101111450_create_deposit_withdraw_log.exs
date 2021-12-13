defmodule TestDeploy.Repo.Migrations.CreateDepositWithdrawLog do
  use Ecto.Migration

  def change do
    create table("log_deposit_stock_account") do
      add :client_id, :string
      add :num_deposit, :int
      timestamps()
    end

    create index(:log_deposit_stock_account, [:client_id])

    execute "CREATE SEQUENCE log_deposit_stock_account_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE log_deposit_stock_account MODIFY id NUMBER DEFAULT log_deposit_stock_account_seq.nextval"

    alter table("log_deposit_stock_account") do
      modify :id, :integer
    end

    create table("log_withdraw_stock_account") do
      add :client_id, :string
      add :num_withdraw, :int
      timestamps()
    end

    create index(:log_withdraw_stock_account, [:client_id])

    execute "CREATE SEQUENCE log_withdraw_stock_account_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE log_withdraw_stock_account MODIFY id NUMBER DEFAULT log_withdraw_stock_account_seq.nextval"

    alter table("log_withdraw_stock_account") do
      modify :id, :integer
    end

    create table("log_deposit_derivative_account") do
      add :client_id, :string
      add :num_deposit, :int
      timestamps()
    end

    create index(:log_deposit_derivative_account, [:client_id])

    execute "CREATE SEQUENCE log_deposit_derivative_account_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE log_deposit_derivative_account MODIFY id NUMBER DEFAULT log_deposit_derivative_account_seq.nextval"

    alter table("log_deposit_derivative_account") do
      modify :id, :integer
    end

    create table("log_withdraw_derivative_account") do
      add :client_id, :string
      add :num_withdraw, :int
      timestamps()
    end

    create index(:log_withdraw_derivative_account, [:client_id])

    execute "CREATE SEQUENCE log_withdraw_derivative_account_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE log_withdraw_derivative_account MODIFY id NUMBER DEFAULT log_withdraw_derivative_account_seq.nextval"

    alter table("log_withdraw_derivative_account") do
      modify :id, :integer
    end
  end
end
