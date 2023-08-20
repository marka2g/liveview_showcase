defmodule ShowcaseWeb.RadioLive do
  use ShowcaseWeb, :live_view

  alias Showcase.Radio.Mixes

  def render(assigns) do
    ~H"""
    <div class="flex h-full">
      <div class="flex flex-col flex-1 min-w-0 overflow-hidden">
        <div class="flex flex-1 overflow-hidden">
          <aside class="flex flex-col flex-shrink-0 border-r w-96 border-neutral-200">
            <div class="px-6 pt-6 pb-4">
              <h2 class="text-lg font-medium text-neutral-900">Mark's Dj Mixes</h2>
            </div>
            <nav class="flex-1 min-h-0 overflow-y-auto" aria-label="All Mixes">
              <div class="relative">
                <div class="sticky top-0 px-6 py-1 border-b border-neutral-200 bg-neutral-50"></div>
                <ul role="list" class="relative divide-y divide-neutral-200">
                  <li :for={mix <- @mixes}>
                    <div class="relative flex items-center px-6 py-5 space-x-3 focus-within:ring-2 focus-within:ring-inset focus-within:ring-sky-500 hover:bg-neutral-50">
                      <div class="flex-shrink-0">
                        <img class="w-10 h-10 rounded-full" src={mix.image_url} alt="" />
                      </div>
                      <div class="flex-1 min-w-0">
                        <.link data-role="mix" patch={~p"/radio/#{mix.id}"} class="focus:outline-none">
                          <span class="absolute inset-0" aria-hidden="true"></span>
                          <p class="text-sm font-medium text-neutral-900"><%= mix.title %></p>
                          <p class="text-sm truncate text-neutral-500"><%= mix.release_date %></p>
                        </.link>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </nav>
          </aside>

          <main>
            <article id="active-mix">
              <div>
                <div class="max-w-5xl px-4 mx-auto sm:px-6 lg:px-8">
                  <div class="mt-10">
                    <div class="flex">
                      <img
                        class="w-24 h-24 rounded-full ring-4 ring-white sm:h-32 sm:w-32"
                        src={@active_mix.image_url}
                        alt=""
                      />
                    </div>
                  </div>
                  <div class="flex-1 min-w-0 mt-6 sm:block">
                    <h1 class="text-2xl font-bold truncate text-neutral-900">
                      <%= @active_mix.title %>
                    </h1>
                  </div>
                </div>
                <div class="p-4">
                  <audio controls src={@active_mix.url}>
                    <%= @active_mix.title %>
                  </audio>
                </div>
              </div>
            </article>
          </main>
        </div>
      </div>
    </div>
    """
  end

  def mount(_, _, socket) do
    mixes = Mixes.all()
    active_mix = hd(mixes)

    {:ok, assign(socket, mixes: mixes, active_mix: active_mix)}
  end

  def handle_params(%{"id" => id}, _, socket) do
    mix = Mixes.get_by(id: String.to_integer(id))

    {:noreply, assign(socket, :active_mix, mix)}
  end

  def handle_params(_, _, socket) do
    {:noreply, socket}
  end
end
