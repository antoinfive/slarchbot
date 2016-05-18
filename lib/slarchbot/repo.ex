defmodule Slarchbot.Repo do
  use Ecto.Repo, otp_app: :slarchbot

  def quote_query do
   quotes = Slarchbot.Repo.get(Slarchbot.Quote, Slarchbot.Repo.random(688))
    quotes.content
  end


   def random(number) do
     :random.seed(:erlang.now())
     :random.uniform(number)
   end

end
