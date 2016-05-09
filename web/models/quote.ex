defmodule Slarchbot.Quote do
  use Slarchbot.Web, :model

  schema "quotes" do
    field :content, :string
    belongs_to :character, Slarchbot.Character

    timestamps
  end

  @required_fields ~w(content)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
