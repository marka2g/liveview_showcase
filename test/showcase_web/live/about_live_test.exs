defmodule ShowcaseWeb.AboutLiveTest do
  use ShowcaseWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "Navigates outside of live_session" do
    test "when clicking on LiveView Showcase (error tuple)", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/about")

      {:error, {:redirect, %{to: path}}} =
        view
        |> element("#top-logo")
        |> render_click()

      assert path == ~p"/"
    end

    test "when clicking on LiveView Showcase (assert_redirect)", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/about")

      view
      |> element("#top-logo")
      |> render_click()

      {path, _flash} = assert_redirect(view)
      assert path == ~p"/"
    end

    test "when clicking on LiveView Showcase (follow_redirect)", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/about")

      {:ok, conn} =
        view
        |> element("#top-logo")
        |> render_click()
        |> follow_redirect(conn, ~p"/")

      html = html_response(conn, 200)
      assert html =~ "LiveView"
      assert html =~ "Showcase"
    end
  end

  describe "Navigates within the live_session" do
    test "when clicking on Awards (error tuple)", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/about")

      {:error, {:live_redirect, %{to: path}}} =
        view
        |> element("[data-role=tab-link]", "Awards")
        |> render_click()

      assert path == ~p"/awards"
    end

    test "when clicking on Awards (assert_redirect)", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/about")

      view
      |> element("[data-role=tab-link]", "Awards")
      |> render_click()

      {path, _flash} = assert_redirect(view)
      assert path == ~p"/awards"
    end

    test "when clicking on Awards (follow_redirect)", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/about")

      {:ok, _awards_view, awards_html} =
        view
        |> element("[data-role=tab-link]", "Awards")
        |> render_click()
        |> follow_redirect(conn, ~p"/awards")

      assert awards_html =~ "Awards"
    end
  end
end
