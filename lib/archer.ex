defmodule Archer.Slack do
  use Slack
  require IEx
  alias Slarchbot.Repo
  @token Application.get_env(:slarchbot, __MODULE__)[:token]

  def start_link, do: start_link(@token, [])

  def handle_info({:msg, msg}, slack, state) do
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: "quote"}, slack, state) do
    send_message(Repo.quote_query, message.channel, slack)
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: "can't or won't?"}, slack, state) do
    send_message("Either", message.channel, slack)
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: "phrasing"}, slack, state) do
    message_to_send = "http://gph.is/1aRSYmf"
    send_message(message_to_send, message.channel, slack)
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: "die"}, slack, state) do
    send_message("You're not my Supervisor!", message.channel, slack)
    5/0
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: character}, slack, state) do
    message_to_send = Repo.find_character_by_query(String.downcase(character))
    send_message(message_to_send, message.channel, slack)
    {:ok, state}
  end


  def handle_message(_message, _slack, state), do: {:ok, state}


end
