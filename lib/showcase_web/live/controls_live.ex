defmodule ShowcaseWeb.ControlsLive do
  use ShowcaseWeb, :live_view

  alias Showcase.{Repo, User}
  alias ShowcaseWeb.ControlsLive.EditInputInPlaceComponent

  def render(assigns) do
    ~H"""
    <div class="space-y-4">
      <.live_component module={EditInputInPlaceComponent} id="name" field={:name} user={@user} />

      <.live_component module={EditInputInPlaceComponent} id="email" field={:email} user={@user} />
    </div>
    """
  end

  def mount(params, _, socket) do
    user = get_user(params["user_id"])

    {:ok, assign(socket, user: user)}
  end

  def handle_info({:updated_user, user}, socket) do
    {:noreply, assign(socket, user: user)}
  end

  defp get_user(user_id), do: Repo.get(User, user_id)
end
