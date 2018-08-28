# Authy for Elixir

An [Authy](https://authy.com) library for Elixir.

[Documentation](http://hexdocs.pm/authy_elixir)

## Installation

Add `authy_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:authy_elixir, "~> 1.0.0"}
  ]
end
```

## Configuration

To make API calls, it's necessary to configure your Authy.com API key.

Add to your config:
```elixir
config :authy_elixir,
  api_key: "my-secret-token"
```
or add to your environment:
```bash
export AUTY_API_KEY=my-secret-token
```

If you want to change the default response format (json):
```elixir
config :authy_elixir, format: "xml"
```
