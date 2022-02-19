defmodule ViableWeb.PageController do
  use ViableWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
