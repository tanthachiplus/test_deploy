defmodule TestDeploy.Repo.Migrations.CreateDerivativeInstrumentAsset do
  use Ecto.Migration

  def change do
    create table("derivative_instrument_assets") do
      add :symbol, :string, size: 10, null: false
      add :on_hold, :integer, null: false, default: 0
      add :position, :string, size: 1, null: false
      add :deleted, :smallint, null: false

      add :tse_account_id, references(:derivative_account, on_delete: :delete_all)

      timestamps()
    end

    create index(:derivative_instrument_assets, [:tse_account_id, :symbol])

    execute "CREATE SEQUENCE derivative_instrument_assets_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE derivative_instrument_assets MODIFY id NUMBER DEFAULT derivative_instrument_assets_seq.nextval"

    alter table("derivative_instrument_assets") do
      modify :id, :integer
    end
  end
end
