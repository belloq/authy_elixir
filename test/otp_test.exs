defmodule Authy.OTPTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "otp#create" do
    use_cassette "otp/create" do
      {:ok, response} = Authy.OTP.create(:sms, "0000042", force: true)
      assert %{"success" => true} = response
    end
  end

  test "otp#verify" do
    use_cassette "otp/verify" do
      {:ok, response} = Authy.OTP.verify("0000042", "5030592")
      assert %{"token" => "is valid"} = response
    end
  end
end
