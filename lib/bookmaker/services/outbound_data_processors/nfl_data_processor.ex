defmodule Bookmaker.NflDataProcessor do
  alias Bookmaker.NflRepository, as: NflRepository
  def get_best_game(week) do
    List.first(games_by_win_pct_dif(week))
  end

  def games_by_win_pct_dif(week) do
    NflRepository.gamesInWeek(week)
    |> Enum.map(fn game ->
      Map.merge(game, %{win_pct_dif: abs(game.home_team.win_pct - game.away_team.win_pct)})
    end)
    |> Enum.sort(&(&1.win_pct_dif < &2.win_pct_dif))
  end
end
