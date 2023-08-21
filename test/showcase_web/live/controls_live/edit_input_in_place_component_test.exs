defmodule ShowcaseWeb.ControlsLive.EditInputInPlaceComponentTest do
  use ShowcaseWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  alias Showcase.User
  alias ShowcaseWeb.ControlsLive.EditInputInPlaceComponent, as: Input

  test "renders field's correct text" do
    user = %User{name: "Ricky", email: "some@example.com"}

    html = render_component(Input, id: "name", field: :name, user: user)

    assert html =~ "Ricky"
  end
end
