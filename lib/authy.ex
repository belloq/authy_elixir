defmodule Authy do
  use HTTPoison.Base

  @base_url "https://api.authy.com/"
  @format Application.get_env(:authy_elixir, :format, "json")

  def process_url(path) do
    @base_url <> path
  end

  def process_request_headers(headers \\ []) do
    [
      {"X-Authy-API-Key",
       Application.get_env(:authy_elixir, :api_key, System.get_env("AUTHY_API_KEY"))}
    ] ++ headers
  end

  def process_request_body(body) do
    if @format == "json" do
      Poison.encode!(body)
    else
      body
    end
  end

  def process_response_body(body) do
    if @format == "json" do
      if String.length(body) > 0 do
        body
        |> Poison.decode!()
      else
        %{}
      end
    else
      body
    end
  end

  def make_request(method, module, endpoint, body \\ "", headers \\ [], options \\ []) do
    {:ok, response} = request(method, endpoint(module, endpoint), body, headers, options)

    case response.status_code do
      200 -> {:ok, response.body}
      400 -> {:error, response.body}
      401 -> {:error, :unauthorized}
      404 -> {:error, :not_found}
    end
  end

  defp endpoint(module, path) do
    "#{module}/#{@format}/#{path}"
  end

  def format, do: @format
end
