# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Showcase.Repo.insert!(%Showcase.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Showcase.{Repo, User}

users = [
  %User{name: "Mark S", email: "mark@liveviewshowcase.com"},
  %User{name: "Sam T", email: "sam@liveviewshowcase.com"},
  %User{name: "Rebbie M", email: "rebbie@liveviewshowcase.com"},
  %User{name: "Jack P", email: "jack@liveviewshowcase.com"},
]

users |> Enum.each(&Repo.insert!/1)
