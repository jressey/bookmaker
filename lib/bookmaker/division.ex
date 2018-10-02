defmodule Bookmaker.Division do
  use Ecto.Schema
  import Ecto.Changeset


  schema "divisions" do
    field :alias, :string
    field :api_id, :string
    field :name, :string

    belongs_to :conference, Bookmaker.Conference

    has_many :teams, EctoAssoc.Team

    timestamps()
  end

  @doc false
  def changeset(division, attrs) do
    division
    |> cast(attrs, [:api_id, :name, :alias])
    |> validate_required([:api_id, :name, :alias])
  end
end
