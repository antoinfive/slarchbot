defmodule Slarchbot.PageController do
  use Slarchbot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
