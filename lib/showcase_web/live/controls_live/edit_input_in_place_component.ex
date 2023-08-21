defmodule ShowcaseWeb.ControlsLive.EditInputInPlaceComponent do
  use ShowcaseWeb, :live_component

  alias Showcase.{Repo, User}

  def render(assigns) do
    ~H"""
    <div class="max-w-md mx-auto">
      <%= if @editing do %>
        <.simple_form
          :let={f}
          id={"#{@field}-form"}
          for={@form}
          phx-click-away="cancel"
          phx-submit="save"
          phx-target={@myself}
        >
          <.input field={{f, @field}} name={@field} value={Map.get(@user, @field)} />
        </.simple_form>
      <% else %>
        <div class="mt-10 space-y-8 bg-zinc-50">
          <div
            id={@field}
            phx-click="edit"
            phx-target={@myself}
            class="flex items-center justify-between gap-6 p-2 mt-2 text-sm rounded-lg bg-zinc-100 border-1 hover:cursor-pointer"
          >
            <%= Map.get(@user, @field) %>
            <.icon name="hero-pencil-solid" class="inline w-4 h-4 stroke-current" />
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  def mount(socket) do
    socket =
      assign(socket,
        form: to_form(%{}),
        editing: false
      )

    {:ok, socket}
  end

  def handle_event("edit", _, socket) do
    {:noreply, assign(socket, editing: true)}
  end

  def handle_event("cancel", _, socket) do
    {:noreply, assign(socket, editing: false)}
  end

  def handle_event("save", params, socket) do
    user = socket.assigns.user
    updated_user = update_user(user, params)

    send(self(), {:updated_user, updated_user})

    {:noreply, assign(socket, editing: false)}
  end

  defp update_user(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update!()
  end
end
