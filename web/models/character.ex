defmodule Slarchbot.Character do
  use Slarchbot.Web, :model
  alias Slarchbot.Repo
  require IEx
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
    character = String.downcase(character)
    query = from c in Slarchbot.Character,
            where: ilike(c.name, ^character)
    if !Repo.one(query)  do
      Repo.insert! %Slarchbot.Character{name: character}
    end
    Repo.one(query)
  end
end

# query = from u in User,
#     where: fragment("downcase(?)", u.username) == ^username
#     select: u

# from p in Post, where: ilike(p.body, "Chapter%")
