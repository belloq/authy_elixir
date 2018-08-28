defmodule Authy.Push do
  @module "onetouch"

  @doc """
  Create a push authentication

  ## Example
  ```
    Authy.Push.create("AUTHY_ID", "message")
  ```
  """
  def create(id, message, options \\ []) do
    Authy.make_request(
      :post,
      @module,
      "users/#{id}/approval_requests",
      "",
      [],
      params: [message: message] ++ options
    )
  end

  @doc """
  Check push authentication status

  ## Example
  ```
    Authy.Push.check("UUID")
  ```
  """
  def check(uuid) do
    Authy.make_request(:get, @module, "approval_requests/#{uuid}")
  end
end
