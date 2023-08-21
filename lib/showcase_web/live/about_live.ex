defmodule ShowcaseWeb.AboutLive do
  use ShowcaseWeb, :live_view

  import ShowcaseWeb.TabsComponent

  def render(assigns) do
    ~H"""
    <div class="min-h-full">
      <.tabs active={:about} />
      <div class="py-10">
        <header>
          <div class="px-4 mx-auto max-w-7xl sm:px-6 lg:px-8">
            <h1 class="text-3xl font-bold leading-tight tracking-tight text-zinc-900">About</h1>
            <div class="flex gap-12">
              <div class="basis-1/2">
                Topic: <code>Tabs</code>
              </div>
              <div class="basis-1/2">
                Testing with functions:
                <ul>
                  <li><code>assert_redirect()</code></li>
                  <li><code>follow_redirect()</code></li>
                  <li><code>html_response()</code></li>
                </ul>
              </div>
            </div>
          </div>
        </header>
      </div>
    </div>
    """
  end
end
