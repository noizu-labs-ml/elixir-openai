defmodule Noizu.OpenAI.Api.EngineTest do
  use ExUnit.Case
  @moduletag :engine

  describe "engine/1" do
    test "successful engine retrieval" do
      engine_id = "text-davinci-002"
      response = %Noizu.OpenAI.Engine{
        id: "text-davinci-002",
        object: "engine",
        owner: "openai",
        ready: true
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"id\": \"text-davinci-002\", \"object\": \"engine\", \"owner\": \"openai\", \"ready\": true}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Engine.engine(engine_id)

      assert response == result
    end
  end

  describe "engines/0" do
    test "successful engines listing" do
      response = %Noizu.OpenAI.Engines{
        object: "list",
        list: [
          %Noizu.OpenAI.Engine{
            id: "text-davinci-001",
            object: "engine",
            owner: "openai",
            ready: true
          },
          %Noizu.OpenAI.Engine{
            id: "text-davinci-002",
            object: "engine",
            owner: "openai",
            ready: true
          }
        ]
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"object\": \"list\", \"data\": [{\"id\": \"text-davinci-001\", \"object\": \"engine\", \"owner\": \"openai\", \"ready\": true}, {\"id\": \"text-davinci-002\", \"object\": \"engine\", \"owner\": \"openai\", \"ready\": true}]}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Engine.engines()

      assert response == result
    end
  end
end