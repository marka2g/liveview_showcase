defmodule ShowcaseWeb.PageHTML do
  use ShowcaseWeb, :html

  embed_templates "page_html/*"

  attr :icon, :string, required: true
  attr :navigate, :string, required: true
  slot :inner_block, required: true

  def link_item(assigns) do
    ~H"""
    <.link navigate={@navigate}>
      <li class="relative flex items-center justify-between px-2 py-5 text-lg rounded-md text-sky-600 hover:text-sky-700 hover:bg-zinc-100">
        <div>
          <.icon name={@icon} class="mb-1" />
          <%= render_slot(@inner_block) %>
        </div>
        <svg
          class="flex-none w-5 h-5 text-zinc-400"
          viewBox="0 0 20 20"
          fill="currentColor"
          aria-hidden="true"
        >
          <path
            fill-rule="evenodd"
            d="M7.21 14.77a.75.75 0 01.02-1.06L11.168 10 7.23 6.29a.75.75 0 111.04-1.08l4.5 4.25a.75.75 0 010 1.08l-4.5 4.25a.75.75 0 01-1.06-.02z"
            clip-rule="evenodd"
          />
        </svg>
      </li>
    </.link>
    """
  end
end
