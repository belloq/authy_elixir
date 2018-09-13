defmodule Authy.User do
  @module "protected"

  @doc """
  Create a new User

  ## Example
  ```
    Authy.User.create("test@example.org", "3173389302", "54")
  ```
  """
  def create(email, phone, country_code) do
    Authy.make_request(
      :post,
      @module,
      "users/new",
      "",
      [],
      params: %{
        "user[email]" => email,
        "user[cellphone]" => phone,
        "user[country_code]" => country_code
      }
    )
  end

  @doc """
  Request User status

  ## Example
  ```
    Authy.User.status("AUTHY_ID")
  ```
  """
  def status(id) do
    Authy.make_request(:get, @module, "users/#{id}/status")
  end


  @doc """
  Remove a User

  ## Example
  ```
    Authy.User.remove("AUTHY_ID")
  ```
  """
  def remove(id) do
    Authy.make_request(:post, @module, "users/#{id}/remove")
  end
end
