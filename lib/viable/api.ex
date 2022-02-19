defmodule Viable.Api do
  use Ash.Api, extensions: [AshJsonApi.Api]

  resources do
    registry Viable.Registry
  end
end
