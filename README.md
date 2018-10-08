s# Bookmaker

## Seeding Data:
* Run interactive elixer console with `iex -S mix`
* Get a key from SportRadar for the NFL v5 API and NHL v6 API
* Create an .env file and add the following:
  ```
  export SPORTRADAR_ROOT_NFL_URL=https://api.sportradar.us/nfl/official/trial/v5/es/
  export SPORTRADAR_ROOT_NHL_URL=https://api.sportradar.us/nhl/trial/v6/en/
  export SPORTRADAR_NFL_KEY=<your_key>
  export SPORTRADAR_NHL_KEY=<your_key>
  ```
* Run `source .env` from your project directory
* Run `Bookmaker.StartupService.go()`


### To get the app going:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`
  * Start console with `iex -S mix`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).


## Notes

* NFL inbound data service runs every midnight
* NFL Current week starts Tuesday @ Midnight