defmodule Slarchbot.Quote do
  use Slarchbot.Web, :model

  schema "quotes" do
    field :content, :text
    belongs_to :character, Slarchbot.Character

    timestamps
  end

  @allowed_fields ~w(content character_id)
  

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, @allowed_fields)
    |> validate_required [:content, :character_id]
  end
end
