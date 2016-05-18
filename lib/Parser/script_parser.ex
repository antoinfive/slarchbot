defmodule ScriptParser do
  require IEx


  # @path "/Users/SophieDeBenedetto/Dev/archer-bot/archer/data/text/s1e1-Pilot-Mole-Hunt.txt"
  @path "/Users/flatironschool/Development/code/Elixir/archer/data/text/s1e1-Pilot-Mole-Hunt.txt"
  @dir "/Users/flatironschool/Development/code/Elixir/archer/data/text/"

  def start_parse do
    # open_files
    collect_script_files(@dir)
    # |> Enum.map(fn x -> String.split(x, ":") end)
    # |> parse_and_insert
      # |> String.split("\n")

    # script = File.read(@path)
    # {:ok, text} = script
    # list = String.split(text, "\n")
    # Enum.map(list, fn x -> String.split(x, ":") end)
    # |> get_list
  end

  def parse_and_insert(list) do
    IEx.pry
    Enum.map(list, fn(items) -> insert_into_repo(items) end)
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

  # def read_and_split({:error, _}), do: nil

  def open_files(path) do
    File.read(path)
  end

  def insert_into_repo([character, quote_content]) do
    Slarchbot.Character.find_or_create(character)
      |> Ecto.build_assoc(:quotes, content: quote_content)
      |> Slarchbot.Repo.insert
  end

  def insert_into_repo(_), do: nil

  def parse_and_get_title(dir) do
    IEx.pry
    File.ls!(dir)
  end
end
