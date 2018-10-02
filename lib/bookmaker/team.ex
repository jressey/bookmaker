defmodule Bookmaker.Team do
  use Ecto.Schema
  import Ecto.Changeset


  schema "teams" do
    field :losses, :integer
    field :name, :string
    field :wins, :integer

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :wins, :losses])
    |> validate_required([:name, :wins, :losses])
  end
end
