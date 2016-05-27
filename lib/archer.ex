defmodule Archer.Slack do
  use Slack
  require IEx
  @token Application.get_env(:slarchbot, __MODULE__)[:token]

  def start_link, do: start_link(@token, [])

  # def start_link(token, []) do
  #   IEx.pry
  # end

  def handle_info({:msg, msg}, slack, state) do
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: "quote"}, slack, state) do
    Slack.send_message(Slarchbot.Repo.quote_query, message.channel, slack)
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: "can't or won't?"}, slack, state) do
    Slack.send_message("Either", message.channel, slack)
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: "phrasing"}, slack, state) do
    message_to_send = "http://gph.is/1aRSYmf"
    Slack.send_message(message_to_send, message.channel, slack)
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: "die"}, slack, state) do
    Slack.send_message("You're not my Supervisor!", message.channel, slack)
    5/0
    {:ok, state}
  end

  def handle_message(message = %{type: "message", text: character}, slack, state) do
    message_to_send = Slarchbot.Repo.find_character_by_query(String.downcase(character))
    Slack.send_message(message_to_send, message.channel, slack)
    {:ok, state}
  end


  def handle_message(_message, _slack, state), do: {:ok, state}


end
