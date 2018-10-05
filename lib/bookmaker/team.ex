defmodule Bookmaker.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field(:api_id, :string)
    field(:name, :string)
    field(:market, :string)
    field(:abbreviation, :string)
    field(:wins, :integer)
    field(:losses, :integer)
    field(:ties, :integer)
    field(:win_pct, :float)
    field(:points_for, :integer)
    field(:points_against, :integer)
    field(:points_rank, :integer)
    field(:touchdown_diff, :integer)
    field(:conf_h2h, :integer)

    belongs_to(:division, Bookmaker.Division)
    belongs_to(:conference, Bookmaker.Conference)

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(
      attrs,
      [
        :api_id,
        :name,
        :market,
        :abbreviation,
        :wins,
        :losses,
        :ties,
        :win_pct,
        :points_for,
        :points_against,
        :points_rank,
        :touchdown_diff,
        :conf_h2h,
        :division_id,
        :conference_id
      ]
    )
    |> unique_constraint(:api_id)
    |> validate_required([
      :api_id,
      :name,
      :market,
      :abbreviation,
      :wins,
      :losses,
      :ties,
      :win_pct,
      :points_for,
      :points_against,
      :points_rank,
      :touchdown_diff,
      :conf_h2h,
      :division_id,
      :conference_id
    ])
  end
end
