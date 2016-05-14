defmodule Slarchbot.Character do
  use Slarchbot.Web, :model
  alias Slarchbot.Repo
  schema "characters" do
    field :name, :string
    has_many :quotes, Slarchbot.Quote

    timestamps
  end

  @allowed_fields ~w(name)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, @allowed_fields)
    |> validate_required [:name]
    |> unique_constraint [:name]
  end

  def find_or_create(character) do
    query = from c in Slarchbot.Character,
            where: c.name == ^character
    if !Repo.one(query)  do
      Repo.insert(character)
    end
    Repo.one(query)
  end
end
