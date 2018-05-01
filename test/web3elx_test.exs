defmodule Web3elxTest do
  use ExUnit.Case
  doctest Web3elx

  test "web3elx encode returns jsonrpc version" do
    assert Web3elx.client_version() |> Map.get("jsonrpc") == "2.0"
  end
end
