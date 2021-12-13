defmodule TestDeploy.Repo.Migrations.CreateClientTable do
  use Ecto.Migration

  def change do
    create table("client") do
      add :client_id, :string, null: false
      add :previous_client_id, :string
      add :client_name, :string
      add :phone_number, :string, size: 15, null: false
      add :email, :string
      add :address, :string
      add :gender, :string, size: 1, null: false, default: "n"
      add :open_date, :naive_datetime
      add :close_date, :naive_datetime
      add :core_active_date, :naive_datetime
      add :core_linked, :smallint, null: false, default: 0
      add :status, :string, size: 1, null: false, default: "n"
      add :channel, :string, size: 10
      add :deleted, :smallint, null: false, default: 0

      timestamps()
    end

    create unique_index(:client, [:client_id])
    create unique_index(:client, [:phone_number])

    execute "CREATE SEQUENCE client_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE client MODIFY id NUMBER DEFAULT client_seq.nextval"

    alter table("client") do
      modify :id, :integer
    end
  end
end
