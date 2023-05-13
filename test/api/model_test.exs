defmodule Noizu.OpenAI.Api.ModelTest do
  use ExUnit.Case
  @moduletag :model

  describe "list/0" do
    test "successful list models" do
      response = %Noizu.OpenAI.Models{
        models: [
          %Noizu.OpenAI.Model{
            id: "text-davinci-003",
            object: "model",
            owned_by: "openai",
            permission: []
          }
        ],
        object: "list"
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"data\": [{\"id\": \"text-davinci-003\", \"object\": \"model\", \"owned_by\": \"openai\", \"permission\": []}], \"object\": \"list\"}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Model.list()

      assert response == result
    end
  end

  describe "fetch/1" do
    test "successful fetch model" do
      model_name = "text-davinci-003"
      response = %Noizu.OpenAI.Model{
        id: "text-davinci-003",
        object: "model",
        owned_by: "openai",
        permission: []
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"id\": \"text-davinci-003\", \"object\": \"model\", \"owned_by\": \"openai\", \"permission\": []}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Model.fetch(model_name)

      assert response == result
    end
  end
end