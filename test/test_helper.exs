ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Slarchbot.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Slarchbot.Repo --quiet)
Ecto.Adapters.SQL.Sandbox.mode(Slarchbot.Repo, :manual)
