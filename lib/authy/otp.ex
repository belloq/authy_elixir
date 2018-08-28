defmodule Authy.OTP do
  @module "protected"

  @doc """
  alias create(:sms, id)
  """
  def create(id), do: create(:sms, id)

  def create(type, id, options \\ [])

  @doc """
  Request an OTP via SMS

  ## Example
  ```
    Authy.OTP.create(:sms, "AUTHY_ID")
  ```
  """
  def create(:sms, id, options) do
    Authy.make_request(:get, @module, "sms/#{id}", "", [], params: options)
  end

  @doc """
  Request an OTP via voice

  ## Example
  ```
    Authy.OTP.create(:call, "AUTHY_ID")
  ```
  """
  def create(:call, id, options) do
    Authy.make_request(:get, @module, "call/#{id}", "", [], params: options)
  end

  @doc """
  Verify an OTP

  ## Example
  ```
    Authy.OTP.verify("AUTHY_ID", "CODE")
  ```
  """
  def verify(id, code) do
    Authy.make_request(:get, @module, "verify/#{code}/#{id}")
  end
end
