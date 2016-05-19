defmodule ScriptParser do
  require IEx



  @dir "/Users/sophiedebenedetto/Desktop/Dev/archer-bot/archer/data/text/"

  def start_parse do
    collect_script_files(@dir)
  end


  def collect_script_files(dir) do
    File.ls!(dir)
      |> Enum.map(fn(extension) -> Path.join(dir, extension) end)
      |> Enum.map(fn(file) -> read_and_split(file) end)
  end


  def read_and_split(file) do
    data = File.read(file)
    {:ok, raw_script} = data
    String.split(raw_script, "\n")
      |> Enum.map(fn x -> String.split(x, ":") end)
      |> parse_and_insert
  end

  def parse_and_insert(list) do
    Enum.map(list, fn(items) -> insert_into_repo(items) end)
  end

  def open_files(path) do
    File.read(path)
  end

  def insert_into_repo([character, quote_content]) do
    #refactor find_or_create into Repo function
    Slarchbot.Character.find_or_create(character)
      |> Ecto.build_assoc(:quotes, content: quote_content)
      |> Slarchbot.Repo.insert
  end

  def insert_into_repo(_), do: nil

  def parse_and_get_title(dir) do
    File.ls!(dir)
  end
end
