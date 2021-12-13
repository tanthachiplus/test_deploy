defmodule TestDeploy.Repo.Migrations.CreateOrderTable do
  use Ecto.Migration

  def change do
    create table("orders") do
      add :account_id, :string
      add :instrument_id, :string, size: 10, null: false
      add :market_id, :string, size: 5
      add :notify_id, :string
      add :request_id, :string
      add :orig_request_id, :string
      add :unique_id, :string
      add :account_type, :string, size: 2, null: false
      add :order_type, :string, size: 3
      add :buy_sell, :string, size: 1
      add :price, :integer, default: 0
      add :avg_price, :integer, default: 0
      add :profit_price, :integer, default: 0
      add :quantity, :integer
      add :cancel_qty, :integer
      add :os_qty, :integer
      add :filled_qty, :integer
      add :reject_reason, :string
      add :status, :string
      add :order_status, :string
      add :channel, :string
      add :stop_order, :string
      add :stop_price, :integer
      add :stop_type, :string
      add :stop_step, :integer
      add :loss_step, :integer
      add :profit_step, :integer
      add :trade_date, :date
      add :deleted, :smallint, null: false
      add :tse_account_id, :integer
      add :msg_type, :string, size: 1, null: false, default: "N"
      add :exchng, :string, size: 10, null: false

      timestamps()
    end

    create index(:orders, [:account_id])
    create unique_index(:orders, [:request_id, :trade_date])

    execute "CREATE SEQUENCE orders_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE orders MODIFY id NUMBER DEFAULT orders_seq.nextval"

    alter table("orders") do
      modify :id, :integer
    end
  end
end
