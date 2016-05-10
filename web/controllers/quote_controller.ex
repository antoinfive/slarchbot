defmodule Slarchbot.QuoteController do
  use Slarchbot.Web, :controller
  alias Slarchbot.Character
  alias Slarchbot.Quote
  require IEx


  def create(conn, %{"character_id" => character_id, "quote" => quote_params}) do
    # character = Repo.get(Character, character_id)
    {:ok, _quote_record } = Repo.get(Character, character_id)
                        |> Ecto.build_assoc(:quotes)
                        |> Quote.changeset(quote_params)
                        |> Repo.insert

    conn
    |> redirect(to: character_path(conn, :show, character_id))
  end
end
