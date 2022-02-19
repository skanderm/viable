[
  import_deps: [
    :ash_json_api,
    :ash_postgres,
    :ecto,
    :phoenix
  ],
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{ex,exs}"],
  subdirectories: ["priv/*/migrations"]
]
