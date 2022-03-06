defmodule ViableWeb.SystemLive.New do
  use ViableWeb, :live_component

  require Ash.Query

  alias ViableWeb.SystemLive

  def render(assigns) do
    Phoenix.View.render(ViableWeb.SystemView, "new.html", assigns)
  end

  def mount(socket) do
    {:ok, socket}
  end

  def new_form(parent) do
    Viable.System
    |> AshPhoenix.Form.for_create(:create,
      api: Viable.Api,
      forms: [parent: [resource: Viable.System, update_action: :update, data: parent]]
    )
  end

  def update(assigns, socket) do
    classes = assigns
    |> Map.get(:classes, " ")
    |> Kernel.<>(container_class(assigns.variant))
    assigns =
      socket
      |> assign(assigns)
      |> assign(:classes, classes)
      |> assign(:form, new_form(assigns.parent))

    {:ok, assigns}
  end

  def container_class(variant \\ :box) do
    case variant do
      :box -> " w-80 p-4 border border-2 border-slate-300 rounded "
      _ -> "  w-80 p-4 border border-2 border-slate-300 rounded "
    end
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
        with %{parent: parent} when not is_nil(parent) <- socket.assigns do
          :ok =
            Phoenix.PubSub.broadcast(
              Viable.PubSub,
              "system:#{socket.assigns.parent.id}",
              :update_list
            )
        end

        {:noreply, assign(socket, :form, new_form(socket.assigns.parent))}

      {:error, form} ->
        {:noreply, assign(socket, :form, form)}
    end
  end
end
