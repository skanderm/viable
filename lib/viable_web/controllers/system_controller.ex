defmodule ViableWeb.SystemController do
  use ViableWeb, :controller

  require Ash.Query

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
