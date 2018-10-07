defmodule Bookmaker.GameTest do
  use Bookmaker.ModelCase

  alias Bookmaker.Game

  @valid_attrs %{away_team_id: 42, home_team_id: 42, scheduled: ~N[2010-04-17 14:00:00.000000]}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Game.changeset(%Game{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Game.changeset(%Game{}, @invalid_attrs)
    refute changeset.valid?
  end
end
