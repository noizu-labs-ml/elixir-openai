defmodule Noizu.OpenAI.Api.AssistantTest do
  use ExUnit.Case, async: false
  alias Noizu.OpenAI.Api.Assistant

  @assistant_entity %Noizu.OpenAI.Assistant{
    id: "asst_test123",
    object: "assistant",
    created_at: 1699009709,
    name: "Test Assistant",
    description: nil,
    model: "gpt-4",
    instructions: "You are a helpful assistant.",
    tools: [],
    file_ids: [],
    metadata: %{}
  }

  describe "Happy Path" do
    test "creates an assistant" do
      create_attrs = %{"model" => "gpt-4", "name" => "Test Assistant", "instructions" => "You are a helpful assistant."}
      expected_response = @assistant_entity
      response_json = Jason.encode!(@assistant_entity)

      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: response_json}}
      end)

      {:ok, result} = Assistant.create(create_attrs)

      assert expected_response == result
    end

    test "successfully lists assistants" do
      response_json = %{
        object: "list",
        data: [
          @assistant_entity
        ],
        first_id: @assistant_entity.id,
        last_id: @assistant_entity.id,
        has_more: false
      } |> Jason.encode!()

      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: response_json}}
      end)

      {:ok, assistants} = Assistant.list()

      assert length(assistants.data) == 1
    end

    test "successfully retrieves an assistant by ID" do
      response_json = Jason.encode!(@assistant_entity)

      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: response_json}}
      end)

      assistant_id = "asst_test123"

      {:ok, assistant} = Assistant.get(assistant_id)

      assert assistant.id == assistant_id
    end

    test "successfully updates an assistant by ID" do
      update_attrs = %{"instructions" => "Updated instructions"}
      response_json = Jason.encode!(
                        @assistant_entity
                        |> put_in([Access.key(:instructions)], "Updated instructions")
                      )


      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: response_json}}
      end)

      assistant_id = "asst_test123"

      {:ok, assistant} = Assistant.update(assistant_id, update_attrs)

      assert assistant.id == assistant_id
      assert assistant.instructions == "Updated instructions"
    end

    test "successfully deletes an assistant by ID" do
      response_json = Jason.encode!(%{
        "id" => "asst_test123",
        "object" => "assistant.deleted",
        "deleted" => true
      })

      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: response_json}}
      end)

      assistant_id = "asst_test123"

      {:ok, deletion_confirmation} = Assistant.delete(assistant_id)

      assert deletion_confirmation.deleted == true
    end
  end
end
