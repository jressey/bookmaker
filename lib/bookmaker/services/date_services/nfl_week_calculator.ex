defmodule Bookmaker.NflWeekCalculator do

  # TODO: make this an initialized value
  def calculate_week_for_date() do
    moment = Timex.to_date(Timex.now())
    day_1 = Timex.to_date({2018, 9, 6})
    day_2 = Timex.shift(day_1, days: 7)
    day_3 = Timex.shift(day_2, days: 7)
    day_4 = Timex.shift(day_3, days: 7)
    day_5 = Timex.shift(day_4, days: 7)
    day_6 = Timex.shift(day_5, days: 7)
    day_7 = Timex.shift(day_6, days: 7)
    day_8 = Timex.shift(day_7, days: 7)
    day_9 = Timex.shift(day_8, days: 7)
    day_10 = Timex.shift(day_9, days: 7)
    day_11 = Timex.shift(day_10, days: 7)
    day_12 = Timex.shift(day_11, days: 7)
    day_13 = Timex.shift(day_12, days: 7)
    day_14 = Timex.shift(day_13, days: 7)
    day_15 = Timex.shift(day_14, days: 7)
    day_16 = Timex.shift(day_15, days: 7)
    day_17 = Timex.shift(day_16, days: 7)

    cond do
      Timex.before?(moment, day_2) -> 1
      Timex.after?(moment, day_2) && Timex.before?(moment, day_3) -> 2
      Timex.after?(moment, day_3) && Timex.before?(moment, day_4) -> 3
      Timex.after?(moment, day_4) && Timex.before?(moment, day_5) -> 4
      Timex.after?(moment, day_5) && Timex.before?(moment, day_6) -> 5
      Timex.after?(moment, day_6) && Timex.before?(moment, day_7) -> 6
      Timex.after?(moment, day_7) && Timex.before?(moment, day_8) -> 7
      Timex.after?(moment, day_8) && Timex.before?(moment, day_9) -> 8
      Timex.after?(moment, day_9) && Timex.before?(moment, day_10) -> 9
      Timex.after?(moment, day_10) && Timex.before?(moment, day_11) -> 10
      Timex.after?(moment, day_11) && Timex.before?(moment, day_12) -> 11
      Timex.after?(moment, day_12) && Timex.before?(moment, day_13) -> 12
      Timex.after?(moment, day_13) && Timex.before?(moment, day_14) -> 13
      Timex.after?(moment, day_14) && Timex.before?(moment, day_15) -> 14
      Timex.after?(moment, day_15) && Timex.before?(moment, day_16) -> 15
      Timex.after?(moment, day_16) && Timex.before?(moment, day_17) -> 16
      Timex.after?(moment, day_17) -> 17
    end
  end
end
