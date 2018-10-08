defmodule Bookmaker.NhlHttpService do
  alias Bookmaker.HttpClient, as: HttpClient

  def root_url() do
    Application.get_env(:bookmaker, Bookmaker.Env.Http.SportRadar)[:root_nhl_url]
  end

  def auth_key() do
    Application.get_env(:bookmaker, Bookmaker.Env.Http.SportRadar)[:nhl_auth_key]
  end

  def getStandings() do
    url = "#{root_url()}seasons/2018/REG/standings.json?api_key=#{auth_key()}"
    getBody(url)
  end

  def getBody(url) do
    parse_tuple(HttpClient.get(url))
  end

  def parse_tuple(tuple) do
    list = Tuple.to_list(tuple)
    List.last(list)
  end
end
