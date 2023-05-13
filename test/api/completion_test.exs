defmodule Noizu.OpenAI.Api.CompletionTest do
  use ExUnit.Case
  @moduletag :completion

  describe "completion/2" do
    test "successful completion" do
      prompt = "Once upon a time"
      options = %{max_tokens: 50, temperature: 0.7}
      response = %Noizu.OpenAI.Completion{
        id: "completion_id",
        object: "text.completion",
        created: ~U[1973-11-29 21:33:09Z],
        model: "text-davinci-003",
        choices: [
          %Noizu.OpenAI.Completion.Choice{
            text: "Once upon a time, in a land far, far away...",
            index: 0,
            logprobs: nil,
            finish_reason: "stop"
          }
        ],
        usage: %{prompt_tokens: 10, completion_tokens: 20, total_tokens: 30}
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"id\": \"completion_id\", \"object\": \"text.completion\", \"created\": 123456789, \"model\": \"text-davinci-003\", \"choices\": [{\"text\": \"Once upon a time, in a land far, far away...\", \"index\": 0, \"logprobs\": null, \"finish_reason\": \"stop\"}], \"usage\": {\"prompt_tokens\": 10, \"completion_tokens\": 20, \"total_tokens\": 30}}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Completion.completion(prompt, options)

      assert response == result
    end
  end
end