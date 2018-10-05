defmodule Bookmaker.Repo.Migrations.RenameAliasFields do
  use Ecto.Migration

  def change do
    rename table(:conferences), :alias, to: :abbreviation
    rename table(:divisions), :alias, to: :abbreviation
    rename table(:teams), :alias, to: :abbreviation
  end
end
