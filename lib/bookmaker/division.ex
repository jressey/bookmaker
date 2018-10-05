defmodule Bookmaker.Division do
  use Ecto.Schema
  import Ecto.Changeset


  schema "divisions" do
    field :abbreviation, :string
    field :api_id, :string
    field :name, :string

    belongs_to :conference, Bookmaker.Conference

    has_many :teams, Bookmaker.Team

    timestamps()
  end

  @doc false
  def changeset(division, attrs) do
    division
    |> cast(attrs, [:api_id, :name, :abbreviation, :conference_id])
    |> unique_constraint(:api_id)
    |> validate_required([:api_id, :name, :abbreviation, :conference_id])
  end
end
