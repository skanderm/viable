defmodule Viable.Api do
  use Ash.Api, extensions: [AshJsonApi.Api]

  json_api do
    log_errors? true
  end


  resources do
    registry Viable.Registry
  end
end
