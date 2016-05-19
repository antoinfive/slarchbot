# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Slarchbot.Repo.insert!(%Slarchbot.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# import Parser
# alias Parser.ScriptParser
require IEx
Code.load_file("./lib/Parser/script_parser.ex")

# Slarchbot.Repo.insert! %Slarchbot.Character{name: "Archer"}
# Slarchbot.Repo.insert! %Slarchbot.Character{name: "Lana"}
# Slarchbot.Repo.insert! %Slarchbot.Character{name: "Malory"}
# Slarchbot.Repo.insert! %Slarchbot.Character{name: "Cyril"}
# Slarchbot.Repo.insert! %Slarchbot.Character{name: "Cheryl"}
# Slarchbot.Repo.insert! %Slarchbot.Character{name: "Pam"}
# Slarchbot.Repo.insert! %Slarchbot.Character{name: "Woodhouse"}
# Slarchbot.Repo.insert! %Slarchbot.Character{name: "Crenshaw"}




ScriptParser.start_parse
