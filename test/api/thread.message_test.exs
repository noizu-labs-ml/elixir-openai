defmodule Noizu.OpenAI.Api.Thread.MessageTest do
  use ExUnit.Case, async: true
  alias Noizu.OpenAI.Api.Thread.Message, as: Api
  alias Noizu.OpenAI.Message

  @thread_id "thread_123"
  @message_id "message_123"

  @valid_message %Message{
    id: @message_id,
    object: "thread.message",
    created_at: 1_662_622_251,
    thread_id: @thread_id,
    role: "user",
    content: "Hello, world!",
    assistant_id: nil,
    run_id: nil,
    file_ids: [],
    metadata: %{}
  }

  describe "Thread.Message API" do
    test "lists messages" do
      json_response = Jason.encode!(%{object: "list", data: [@valid_message], last_id: @valid_message.id, first_id: @valid_message.id, has_more: false})
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: json_response}}
      end)

      assert {:ok, %{data: [@valid_message]}} = Api.list(@thread_id)
    end

    test "creates a message" do
      create_attrs = %{"content" => "Hello, world!", "role" => "user"}
      json_response = Jason.encode!(@valid_message)
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: json_response}}
      end)

      assert {:ok, @valid_message} = Api.create(@thread_id, create_attrs)
    end

    test "gets a specific message" do
      json_response = Jason.encode!(@valid_message)
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: json_response}}
      end)

      assert {:ok, @valid_message} = Api.get(@thread_id, @message_id)
    end

    test "updates a message" do
      update_attrs = %{"content" => "Updated message"}
      updated_message = Map.put(@valid_message, :content, "Updated message")
      json_response = Jason.encode!(updated_message)
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: json_response}}
      end)

      assert {:ok, %{content: "Updated message"}} = Api.update(@thread_id, @message_id, update_attrs)
    end

    test "deletes a message" do
      json_response = %{"id" => @message_id, "object" => "thread.message.deleted", "deleted" => true}
                      |> Jason.encode!
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: json_response}}
      end)

      assert {:ok, %{:deleted => true}} = Api.delete(@thread_id, @message_id)
    end
  end
end
