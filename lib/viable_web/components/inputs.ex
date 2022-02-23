defmodule ViableWeb.Inputs do
  use ViableWeb, :component

  # def formatted(assigns) do
  #   class = "focus:ring-teal-500 focus:border-teal-500 block w-full p-2 sm:text-sm border border-gray-300 rounded-md"
  #   assigns = assign_new(assigns, :class, class)

  #   ~H"""
  #   <%= label @f, @field, class: "block text-sm font-medium text-gray-700" %>
  #   <div class="mt-1 relative rounded-md shadow-sm max-w-sm">
  #   <%= render_slot(@inner_block, %{f: @f, class: "focus:ring-teal-500 focus:border-teal-500 block w-full p-2 sm:text-sm border border-gray-300 rounded-md"})
  #     <%= text_input @f, @field, class: @class %>
  #   </div>
  #   <%= error_tag @f, @field, class: "text-red-500" %>
  #   """
  # end

  def text(assigns) do
    ~H"""
    <%= label @f, @field, class: "block text-sm font-medium text-gray-700" %>
    <div class="mt-1 relative rounded-md shadow-sm max-w-sm">
      <%= text_input @f, @field, class: "focus:ring-teal-500 focus:border-teal-500 block w-full p-2 sm:text-sm border border-gray-300 rounded-md" %>
    </div>
    <%= error_tag @f, @field, class: "text-red-500" %>
    """
  end

  def select(assigns) do
    ~H"""
    <%= label @f, @field, class: "block text-sm font-medium text-gray-700" %>
    <div class="mt-1 relative rounded-md shadow-sm max-w-sm">
      <%= select @f, @field, @options, class: "focus:ring-teal-500 focus:border-teal-500 block w-full p-2 sm:text-sm border border-gray-300 rounded-md" %>
    </div>
    <%= error_tag @f, @field, class: "text-red-500" %>
    """
  end
end
