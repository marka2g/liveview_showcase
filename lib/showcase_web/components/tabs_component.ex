defmodule ShowcaseWeb.TabsComponent do
  use Phoenix.Component

  use Phoenix.VerifiedRoutes,
    endpoint: ShowcaseWeb.Endpoint,
    router: ShowcaseWeb.Router,
    statics: ShowcaseWeb.static_paths()

  attr :active, :atom, required: true, values: [:about, :awards]

  def tabs(assigns) do
    ~H"""
    <nav class="bg-white border-b border-zinc-200">
      <div class="px-4 mx-auto max-w-7xl sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
          <div class="flex">
            <div class="sm:-my-px sm:flex sm:space-x-8">
              <.link
                navigate={~p"/about"}
                class={[
                  "inline-flex items-center border-b-2 px-1 pt-1 text-sm font-medium",
                  color_css(@active == :about)
                ]}
                data-role="tab-link"
              >
                About
              </.link>
              <.link
                navigate={~p"/awards"}
                class={[
                  "inline-flex items-center border-b-2 px-1 pt-1 text-sm font-medium",
                  color_css(@active == :awards)
                ]}
                data-role="tab-link"
              >
                Awards
              </.link>
            </div>
          </div>
        </div>
      </div>
    </nav>
    """
  end

  defp color_css(active) do
    if active do
      "border-sky-500 text-zinc-900"
    else
      "border-transparent text-zinc-500 hover:border-zinc-300 hover:text-zinc-700"
    end
  end
end
