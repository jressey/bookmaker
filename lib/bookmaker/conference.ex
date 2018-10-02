defmodule Bookmaker.Conference do
  use Ecto.Schema
  import Ecto.Changeset


  schema "conferences" do
    field :alias, :string
    field :api_id, :string
    field :name, :string

    has_many :teams, Bookmaker.Team
    has_many :divisions, Bookmaker.Division

    timestamps()
  end

  @doc false
  def changeset(conference, attrs) do
    conference
    |> cast(attrs, [:api_id, :name, :alias])
    |> validate_required([:api_id, :name, :alias])
  end
end
