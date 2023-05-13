defmodule Noizu.OpenAI.Api.ChatTest do
  use ExUnit.Case
  @moduletag :chat

  describe "chat/2" do
    test "successful chat" do
      messages = [
        %{:role => "system", :content => "You are a helpful assistant."},
        %{:role => "user",  :content => "Who won the world series in 2020?"}
      ]
      response = %Noizu.OpenAI.Chat{
        id: "chat_id",
        object: "chat.completion",
        created: ~U[1973-11-29 21:33:09Z],
        choices: [
          %Noizu.OpenAI.Chat.Choice{
            index: 0,
            message: %{:role => "assistant",  :content => "The Los Angeles Dodgers won the World Series in 2020."},
            finish_reason: "stop"
          }
        ],
        usage: %{prompt_tokens: 10, completion_tokens: 20, total_tokens: 30}
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"id\": \"chat_id\", \"object\": \"chat.completion\", \"created\": 123456789, \"choices\": [{\"index\": 0, \"message\": {\"role\": \"assistant\", \"content\": \"The Los Angeles Dodgers won the World Series in 2020.\"}, \"finish_reason\": \"stop\"}], \"usage\": {\"prompt_tokens\": 10, \"completion_tokens\": 20, \"total_tokens\": 30}}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Chat.chat(messages)

      assert response == result
    end
  end
end