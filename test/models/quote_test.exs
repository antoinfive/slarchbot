defmodule Slarchbot.QuoteTest do
  use Slarchbot.ModelCase

  alias Slarchbot.Quote

  @valid_attrs %{content: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Quote.changeset(%Quote{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Quote.changeset(%Quote{}, @invalid_attrs)
    refute changeset.valid?
  end
end
