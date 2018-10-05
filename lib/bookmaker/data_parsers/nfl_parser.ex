defmodule Bookmaker.NflParser do
  alias Bookmaker.NflRepository, as: NflRepository

  @spec conferences(any()) :: [any()]
  def conferences(body) do
    get_in(body, [:conferences])
    |> Enum.map(fn x ->
      Map.delete(x, :divisions)
    end)
    |> Enum.map(fn x ->
      NflRepository.saveConference(x)
    end)
  end

  def divisions(body) do
    get_in(body, [:conferences, :divisions])
  end

  def teams(body) do
    get_in(body, [:conferences, :divisions, :teams])
  end
end
