defmodule Bookmaker.Division do
  use Ecto.Schema
  import Ecto.Changeset


  schema "divisions" do
    field :alias, :string
    field :api_id, :string
    field :name, :string

    belongs_to :conference, Bookmaker.Conference

    has_many :teams, Bookmaker.Team

    timestamps()
  end

  @doc false
  def changeset(division, attrs) do
    division
    |> cast(attrs, [:api_id, :name, :alias, :conference_id])
    |> validate_required([:api_id, :name, :alias, :conference_id])
  end
end
