defmodule ShowcaseWeb.PageController do
  use ShowcaseWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end
