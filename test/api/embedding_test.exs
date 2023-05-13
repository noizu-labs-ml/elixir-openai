defmodule Noizu.OpenAI.Api.EmbeddingTest do
  use ExUnit.Case
  @moduletag :embedding

  describe "create/2" do
    test "successful embedding creation" do
      input = ["apple", "orange", "banana"]
      response = %Noizu.OpenAI.Embeddings{
        object: "list",
        embeddings: [
          %Noizu.OpenAI.Embeddings.Embedding{object: "embedding", embedding: [1, 2, 3], index: 0},
          %Noizu.OpenAI.Embeddings.Embedding{object: "embedding", embedding: [4, 5, 6], index: 1},
          %Noizu.OpenAI.Embeddings.Embedding{object: "embedding", embedding: [7, 8, 9], index: 2}
        ],
        model: "text-embedding-ada-002",
        usage: %{prompt_tokens: 10, completion_tokens: 20, total_tokens: 30}
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"object\": \"list\", \"data\": [{\"object\": \"embedding\", \"embedding\": [1, 2, 3], \"index\": 0}, {\"object\": \"embedding\", \"embedding\": [4, 5, 6], \"index\": 1}, {\"object\": \"embedding\", \"embedding\": [7, 8, 9], \"index\": 2}], \"model\": \"text-embedding-ada-002\", \"usage\": {\"prompt_tokens\": 10, \"completion_tokens\": 20, \"total_tokens\": 30}}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Embedding.create(input)

      assert response == result
    end
  end
end