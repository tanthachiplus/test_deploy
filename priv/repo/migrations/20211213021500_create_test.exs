defmodule TestDeploy.Repo.Migrations.CreateTest do
  use Ecto.Migration

  def change do
    create table(:test) do
      add :name, :string
    end
  end
end
