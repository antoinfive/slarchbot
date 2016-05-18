defmodule Archer.Slack do
  use Slack
  require IEx
  @token Application.get_env(:slarchbot, __MODULE__)[:token]

  def start_link, do: start_link(@token, [])

  def handle_info({:msg, msg}, slack, state) do
    IEx.pry
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: "Quote"}, slack, state) do
    Slack.send_message(Slarchbot.Repo.quote_query, message.channel, slack)
    {:ok, state}
  end

  def handle_message(_message, _slack, state), do: {:ok, state}


end
