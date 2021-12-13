defmodule TestDeploy.Repo.Migrations.CreateDerivativeAccountBalanceTable do
  use Ecto.Migration

  def change do
    create table("derivative_account_balance") do
      add :account_id, :string, null: false
      add :cash_bal, :decimal, default: 0.0
      add :cash_on_hold, :decimal, default: 0.0
      add :status, :string, size: 1, default: "n"
      add :fee, :integer, default: 0
      add :commission, :integer, default: 0
      add :interest, :integer, default: 0
      add :loan, :integer, default: 0
      add :delivery_amount, :integer, default: 0
      add :floating_pl, :integer, default: 0
      add :total_pl, :integer, default: 0
      add :marginable, :integer, default: 0
      add :depositable, :integer
      add :rc_call, :integer, default: 0
      add :withdrawable, :decimal, default: 0.0
      add :non_cash_drawable_rc_call, :integer, default: 0
      add :nav, :integer, default: 0
      add :ext_interest, :integer, default: 0
      add :deleted, :smallint, null: false
      add :tse_client_id, references(:client, on_delete: :delete_all)
      add :tse_account_id, references(:derivative_account, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:derivative_account_balance, [:account_id])

    execute "CREATE SEQUENCE derivative_account_balance_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE derivative_account_balance MODIFY id NUMBER DEFAULT derivative_account_balance_seq.nextval"

    alter table("derivative_account_balance") do
      modify :id, :integer
    end
  end
end
