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

ScriptParser.read_file
