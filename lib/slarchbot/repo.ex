defmodule Slarchbot.Repo do
  use Ecto.Repo, otp_app: :slarchbot
  import Ecto.Query
  alias Slarchbot.Character
  alias Slarchbot.Quote
  alias Slarchbot.Repo

  def quote_query do
   quotes = Repo.get(Quote, Repo.random(688))
   quotes.content
  end

  def random(number) do
   :random.seed(:erlang.now())
   :random.uniform(number)
  end

  def find_character_by_query(character) do
    if Repo.get_by(Character, name: character) do
      char = Repo.get_by(Character, name: character)
        |> IO.inspect
      id = get_random_quote_id(char)
      the_quote = get_random_quote(id)
      the_quote.content
    end
  end

  def get_random_quote_id(character) do
    quote_query = Ecto.assoc(character, :quotes)
    Enum.random(Repo.all(select(Quote, [quote_query], quote_query.id)))
  end

  def get_random_quote(id) do
    Repo.get(Quote, id)
  end

# a = Repo.get_by(Character, name: "archer")
# q = Ecto.assoc(a, :quotes)
# Enum.random Slarchbot.Repo.all(Ecto.Query.select(q, [q], q.id))
# Enum.random Slarchbot.Repo.all(Ecto.Query.select(Slarchbot.Quote, [q], q.id))
# Repo.get(Quote, Enum.random(Repo.all(select(q, [q], q.id))))

end
