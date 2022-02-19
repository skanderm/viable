defmodule Viable.Api do
  use Ash.Api

  resources do
    registry Viable.Registery
  end
end
