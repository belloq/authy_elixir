defmodule Authy.PushTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "push#create" do
    use_cassette "push/create" do
      {:ok, response} = Authy.Push.create("0000042", "Test message")
      assert %{"success" => true} = response
    end
  end

  test "push#check" do
    use_cassette "push/check" do
      {:ok, response} = Authy.Push.check("0d60540f-f7e8-49db-81ff-c41ccb6725c8")
      assert %{"success" => true} = response
    end
  end
end
