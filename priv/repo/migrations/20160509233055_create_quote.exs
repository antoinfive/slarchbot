defmodule Slarchbot.Repo.Migrations.CreateQuote do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :content, :string
      add :character_id, references(:characters, on_delete: :nothing)

      timestamps
    end
    create index(:quotes, [:character_id])
    
  end
end
