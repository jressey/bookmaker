defmodule Bookmaker.NflHttpService do
  alias Bookmaker.HttpClient, as: HttpClient

  def root_url() do
    "https://api.sportradar.us/nfl/official/trial/v5/es/"
  end

  def key() do
    "v63vdke86u7r2eh2fdgrz7v8"
  end

  def getStandings() do
    url = "#{root_url()}seasons/2018/standings.json?api_key=#{key()}"
    getBody(url)
  end

  def getSchedule() do
    url = "#{root_url()}games/2018/REG/4/schedule.json?api_key=#{key()}"
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
