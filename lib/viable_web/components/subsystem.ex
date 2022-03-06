defmodule ViableWeb.Subsystem do
  use ViableWeb, :component

  def box(assigns) do
    assigns =
      assigns
      |> assign(:level_number, Viable.System.level_number(assigns.system.level))
      |> assign(:classes, Map.get(assigns, :classes, ""))

    ~H"""
    <div class={"w-80 p-4 border border-2 border-slate-300 rounded " <> @classes}>
      <div class="flex justify-between mb-3">
        <div>
          <h3 class="font-semibold text-lg mr-5"><%= @system.name %></h3>
          <%= if @system.parent do %> <div class="text-sm text-neutral-500"><%= "<#{@system.parent.name}>" %></div> <% end %>
        </div>
        <span class="text-3xl font-bold text-slate-500"><%= @level_number %></span>
      </div>
      <p class="text-stone-600">
        <%= @system.description %>
      </p>
    </div>
    """
  end

  def triangle(assigns) do
    assigns =
      assigns
      |> assign(:level_number, Viable.System.level_number(assigns.system.level))
      |> assign(:classes, Map.get(assigns, :classes, ""))

    ~H"""
    <div class={"w-40 p-4 border border-2 border-slate-300 rounded " <> @classes}>
      <div class="flex justify-between mb-3">
        <div>
          <h3 class="font-semibold text-lg mr-5"><%= @system.name %></h3>
          <%= if @system.parent do %> <div class="text-sm text-neutral-500"><%= "<#{@system.parent.name}>" %></div> <% end %>
        </div>
        <span class="text-3xl font-bold text-slate-500"><%= @level_number %></span>
      </div>
      <p class="text-stone-600">
        <%= @system.description %>
      </p>
    </div>
    """
  end
end
