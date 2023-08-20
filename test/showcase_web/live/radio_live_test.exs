defmodule ShowcaseWeb.RadioLiveTest do
  use ShowcaseWeb.ConnCase, asyns: true

  import Phoenix.LiveViewTest

  alias Showcase.Radio.Mixes

  test "user is directed to correct mix page with assert_patch()", %{conn: conn} do
    mix = Mixes.get_by(title: "Burning Man Mix")
    {:ok, view, _html} = live(conn, ~p"/radio")

    view
    |> element("[data-role=mix]", "Burning Man Mix")
    |> render_click()

    assert_patch(view, ~p"/radio/#{mix.id}")
  end

  test "user can see mix info upon selection (test click behavior)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/radio")

    view
    |> element("[data-role=mix]", "Burning Man Mix")
    |> render_click()

    assert has_element?(view, "#active-mix", "Burning Man Mix")
  end

  test "user can visit specific mix", %{conn: conn} do
    mix = Mixes.get_by(title: "Burning Man Mix")
    {:ok, view, _html} = live(conn, ~p"/radio/#{mix.id}")

    assert has_element?(view, "#active-mix", "Burning Man Mix")
  end

  test "combine assert_patch and behavior testing", %{conn: conn} do
    mix = Mixes.get_by(title: "Burning Man Mix")
    {:ok, view, _html} = live(conn, ~p"/radio")

    view
    |> element("[data-role=mix]", "Burning Man Mix")
    |> render_click()

    assert_patch(view, ~p"/radio/#{mix.id}")
    assert has_element?(view, "#active-mix", "Burning Man Mix")
  end
end
