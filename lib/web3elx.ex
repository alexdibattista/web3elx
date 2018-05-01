defmodule Web3elx do
  use HTTPoison.Base

  @moduledoc """
  Documentation for Web3elx.
  """

  @endpoint "http://localhost:8545"

  def process_url(url) do
    @endpoint <> url
  end

  def process_respsonse_body(body) do
    body
    |> Poison.decode!()
  end

  def client_version() do
    case Web3elx.post("/", encode!(%{method: "web3_clientVersion"})) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body |> Poison.decode!()
    end
  end

  def sha3(data) do
    {:ok, response} = Web3elx.post("/", encode!(%{method: "web3_sha3", params: data}))
    response
  end

  defp encode!(data) do
    # Merge standard json with data
    Map.merge(%{jsonrpc: "2.0"}, data)
    |> Poison.encode!()
  end
end
