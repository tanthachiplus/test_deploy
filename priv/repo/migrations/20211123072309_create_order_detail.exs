defmodule TestDeploy.Repo.Migrations.CreateOrderDetail do
  use Ecto.Migration

  def change do
    create table("order_detail") do
      add :tse_order_id, references(:orders, on_delete: :delete_all)
      add :quantity, :integer, default: 0
      add :price, :integer, default: 0
      add :action, :string, size: 1
      add :channel, :string
      add :session_flag, :string, null: false

      timestamps()
    end

    execute "CREATE SEQUENCE order_detail_seq
    START WITH     1
    INCREMENT BY   1"

    execute "ALTER TABLE order_detail MODIFY id NUMBER DEFAULT order_detail_seq.nextval"

    alter table("order_detail") do
      modify :id, :integer
    end
  end
end
