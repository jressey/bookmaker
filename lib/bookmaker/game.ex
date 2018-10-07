defmodule Bookmaker.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :scheduled, :naive_datetime
    field :week, :integer
    belongs_to :away_team, Bookmaker.Team, foreign_key: :away_team_id
    belongs_to :home_team, Bookmaker.Team, foreign_key: :home_team_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:scheduled, :week, :away_team_id, :home_team_id])
    |> validate_required([:scheduled, :week, :away_team_id, :home_team_id])
  end
end
