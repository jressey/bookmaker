defmodule Bookmaker.Game do
  use Ecto.Schema
  use Timex.Ecto.Timestamps
  import Ecto.Changeset

  @timestamps_opts [type: Timex.Ecto.DateTime,
                    autogenerate: {Timex.Ecto.DateTime, :autogenerate, []}]

  schema "games" do
    field :scheduled, :utc_datetime
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
    |> unique_constraint(:week_team_constraint, name: :week_team_index)
    |> validate_required([:scheduled, :week, :away_team_id, :home_team_id])
  end
end
