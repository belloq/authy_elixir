defmodule Authy.UserTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "user#create" do
    use_cassette "user/create" do
      {:ok, response} = Authy.User.create("test@example.org", "3173389302", "42")
      assert %{"user" => %{"id" => 42}} = response
    end
  end

  test "user#status" do
    use_cassette "user/status" do
      {:ok, response} = Authy.User.status("42")
      assert %{"success" => true} = response
    end
  end

  test "user#remove" do
    use_cassette "user/remove" do
      {:ok, response} = Authy.User.remove("42")
      assert %{"success" => true} = response
    end
  end
end
