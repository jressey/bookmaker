defmodule Bookmaker.Conference do
  use Ecto.Schema
  import Ecto.Changeset


  schema "conferences" do
    field :abbreviation, :string
    field :api_id, :string
    field :name, :string

    has_many :teams, Bookmaker.Team
    has_many :divisions, Bookmaker.Division

    timestamps()
  end

  @doc false
  def changeset(conference, attrs) do
    conference
    |> cast(attrs, [:api_id, :name, :abbreviation])
    |> unique_constraint(:api_id)
    |> validate_required([:api_id, :name, :abbreviation])
  end
end
