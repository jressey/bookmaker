defmodule Bookmaker.StartupService do

  def go() do
    Bookmaker.NflStructureCoordinator.process()
    :timer.sleep(1001)
    Bookmaker.NflScheduleCoordinator.process()
  end
end
