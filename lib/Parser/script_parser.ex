defmodule ScriptParser do
  require IEx


  @path "/Users/SophieDeBenedetto/Dev/archer-bot/archer/data/text/s1e1-Pilot-Mole-Hunt.txt"

  def read_file do
    script = File.read(@path)
    {:ok, text} = script
    list = String.split(text, "\n")
    Enum.map(list, fn x -> String.split(x, ":") end)
    |> get_list
  end

  def get_list(list) do
    Enum.map(list, fn(items) -> insert_into_repo(items) end)
  end

  def insert_into_repo([character, quote_content]) do
    Slarchbot.Character.find_or_create(character)
    |> Ecto.build_assoc(:quotes, content: quote_content)
    |> Slarchbot.Repo.insert
  end

  def insert_into_repo(_), do: nil
end
