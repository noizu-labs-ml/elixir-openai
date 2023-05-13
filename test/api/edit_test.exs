defmodule Noizu.OpenAI.Api.EditTest do
  use ExUnit.Case
  @moduletag :edit

  describe "edit/3" do
    test "successful edit" do
      input = "The sun rises in the est."
      instruction = "Fix the typo in this sentence."
      response = %Noizu.OpenAI.Edit{
        object: "edit.completion",
        created: ~U[1973-11-29 21:33:09Z],
        choices: [
          %Noizu.OpenAI.Edit.Choice{
            text: "The sun rises in the east.",
            index: 0
          }
        ],
        usage: %{prompt_tokens: 10, completion_tokens: 20, total_tokens: 30}
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"object\": \"edit.completion\", \"created\": 123456789, \"choices\": [{\"text\": \"The sun rises in the east.\", \"index\": 0}], \"usage\": {\"prompt_tokens\": 10, \"completion_tokens\": 20, \"total_tokens\": 30}}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Edit.edit(input, instruction)

      assert response == result
    end
  end
end