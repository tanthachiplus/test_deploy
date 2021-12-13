defmodule TestDeploy.Repo.Migrations.CreateClientAccountAssocTable do
  use Ecto.Migration

  def change do
    create table("client_account") do
      add :tse_client_id, references(:client, on_delete: :delete_all)
      add :tse_account_id, :integer
      add :account_type, :string, size: 2, null: false
      add :open_date, :naive_datetime
      add :close_date, :naive_datetime
      add :status, :string, size: 1, default: "n"

      timestamps()
    end

    create index(:client_account, [:tse_client_id])

    execute "CREATE SEQUENCE client_account_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE client_account MODIFY id NUMBER DEFAULT client_account_seq.nextval"

    alter table("client_account") do
      modify :id, :integer
    end
  end
end
