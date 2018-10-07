defmodule Bookmaker.Game do
  use Bookmaker.Web, :model

  schema "games" do
    field :away_team_id, :integer
    field :home_team_id, :integer
    field :scheduled, :naive_datetime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:away_team_id, :home_team_id, :scheduled])
    |> validate_required([:away_team_id, :home_team_id, :scheduled])
  end
end
