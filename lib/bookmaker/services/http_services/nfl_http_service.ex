defmodule Bookmaker.NflHttpService do
  alias Bookmaker.HttpClient, as: HttpClient

  def root_url() do
    Application.get_env(:bookmaker, Bookmaker.Env.Http.SportRadar)[:root_url]
  end

  def auth_key() do
    Application.get_env(:bookmaker, Bookmaker.Env.Http.SportRadar)[:auth_key]
  end

  def getStandings() do
    url = "#{root_url()}seasons/2018/standings.json?api_key=#{auth_key()}"
    getBody(url)
  end

  @spec getSchedule(any()) :: any()
  def getSchedule(week) do
    url = "#{root_url()}games/2018/REG/#{week}/schedule.json?api_key=#{auth_key()}"
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
