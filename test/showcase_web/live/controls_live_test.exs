defmodule ShowcaseWeb.ControlsLiveTest do
  use ShowcaseWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  alias Showcase.{Repo, User}

  test "renders user's attributes", %{conn: conn} do
    user = create_user()
    {:ok, _view, html} = live(conn, ~p"/users/#{user.id}/controls")
    assert html =~ user.name
    assert html =~ user.email
  end

  test "user can edit their name", %{conn: conn} do
    user = create_user(%{name: "layla"})
    {:ok, view, _html} = live(conn, ~p"/users/#{user.id}/controls")

    view
    |> element("#name")
    |> render_click()

    view
    |> form("#name-form", %{name: "jill"})
    |> render_submit()

    assert has_element?(view, "#name", "jill")
  end

  test "user can edit their email", %{conn: conn} do
    user = create_user(%{email: "layla@liveviewshowcase.com"})
    {:ok, view, _html} = live(conn, ~p"/users/#{user.id}/controls")

    view
    |> element("#email")
    |> render_click()

    view
    |> form("#email-form", %{email: "jill@liveviewshowcase.com"})
    |> render_submit()

    assert has_element?(view, "#email", "jill@liveviewshowcase.com")
  end

  defp create_user(params \\ %{}) do
    %{name: "sample user", email: "sampleuser@example.com"}
    |> Map.merge(params)
    |> User.changeset()
    |> Repo.insert!()
  end
end
