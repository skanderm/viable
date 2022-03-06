defmodule ViableWeb.Subsystem do
  use ViableWeb, :component

  def box(assigns) do
    assigns =
      assigns
      |> assign(:classes, Map.get(assigns, :classes, ""))

    ~H"""
    <div class={"w-80 p-4 border border-2 border-slate-300 rounded " <> @classes}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  def triangle(assigns) do
    assigns =
      assigns
      |> assign(:classes, Map.get(assigns, :classes, ""))

    ~H"""
    <div class={"w-60 p-4 border border-2 border-slate-300 rounded " <> @classes}>
     <%= render_slot(@inner_block) %>
    </div>
    """
  end

  def circle(assigns) do
    assigns =
      assigns
      |> assign(:classes, Map.get(assigns, :classes, ""))

    ~H"""
    <div class={"w-60 h-60 p-4 border border-2 border-slate-300 rounded-full flex justify-center items-center " <> @classes}>
      <div class="w-40 h-30">
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  def display(assigns) do
    assigns =
      assigns
      |> assign(:level_number, Viable.System.level_number(assigns.system.level))

    ~H"""
    <div class="flex justify-between mb-3">
      <div>
        <h3 class="font-semibold text-md mr-5"><%= @system.name %></h3>
        <%= if @system.parent do %> <div class="text-sm text-neutral-500"><%= "<#{@system.parent.name}>" %></div> <% end %>
      </div>
      <span class="text-2xl font-bold text-slate-500"><%= @level_number %></span>
    </div>
    <p class="text-stone-600 text-sm">
      <%= @system.description %>
    </p>
    """
  end

  def skeleton(assigns) do
    ~H"""
    <div class={"w-80 p-4 border border-2 border-slate-300 rounded flex flex-column justify-center items-center" <> @classes}>
      <span class="text-3xl font-bold text-slate-500"><%= Viable.System.level_number(@level) %></span>
      <span class="text-6xl font-bold text-slate-500">+</span>
      <span class="text-md text-slate-500">Add system</span>
    </div>
    """
  end
end
