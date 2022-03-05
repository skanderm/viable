defmodule ViableWeb.SystemLive.New do
  use ViableWeb, :live_view

  require Ash.Query

  alias ViableWeb.SystemLive

  def render(assigns) do
    Phoenix.View.render(ViableWeb.SystemView, "new.html", assigns)
  end

  def mount(_params, context, socket) do
    parent_id = Map.get(context, "parent_id")

    assigns =
      socket
      |> assign(:form, new_form(parent_id))
      |> assign(:parent_id, parent_id)

    {:ok, assigns}
  end

  def new_form(parent_id) do
    Viable.System
    |> AshPhoenix.Form.for_create(:create,
      api: Viable.Api
    )
  end

  # In order to use the `add_form` and `remove_form` helpers, you
  #
  # need to make sure that you are validating the form on change
  def handle_event("validate", %{"form" => params}, socket) do
    form = AshPhoenix.Form.validate(socket.assigns.form, params)
    # You can also skip errors by setting `errors: false` if you only want to show errors on submit
    # form = AshPhoenix.Form.validate(socket.assigns.form, params, errors: false)
    {:noreply, assign(socket, :form, form)}
  end

  def handle_event("save", params, socket) do
    case AshPhoenix.Form.submit(socket.assigns.form) do
      {:ok, result} ->
        with %{parent_id: parent_id} when not is_nil(parent_id) <- socket.assigns do
          :ok = Phoenix.PubSub.broadcast(Viable.PubSub, socket.assigns.parent_id, :update)
        end

        {:noreply, assign(socket, :form, new_form(socket.assigns.parent_id))}

      {:error, form} ->
        {:noreply, assign(socket, :form, form)}
    end
  end
end
