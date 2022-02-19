defmodule Viable.Registry do
  use Ash.Registry,
    extensions: [Ash.Registry.ResourceValidations]

  entries do
    entry Viable.System
    entry Viable.Environment
    entry Viable.Channel
  end
end
