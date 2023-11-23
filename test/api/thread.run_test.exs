defmodule Noizu.OpenAI.Api.Thread.RunTest do
  use ExUnit.Case, async: true
  alias Noizu.OpenAI.Api.Thread.Run, as: Api
  alias Noizu.OpenAI.Run
  alias Noizu.OpenAI.Runs

  @valid_run %Run{
    id: "run_123",
    object: "thread.run",
    created_at: 1_662_622_251,
    thread_id: "thread_123",
    assistant_id: "asst_123",
    status: "queued",
    required_action: nil,
    last_error: nil,
    expires_at: 1_662_628_251,
    started_at: nil,
    cancelled_at: nil,
    failed_at: nil,
    completed_at: nil,
    model: "gpt-3.5-turbo",
    instructions: "You are a helpful assistant.",
    tools: [],
    file_ids: [],
    metadata: %{}
  }

  @valid_run_list %Runs{
    object: "list",
    data: [@valid_run],
    first_id: @valid_run.id,
    last_id: @valid_run.id,
    has_more: false
  }

  describe "Happy Path" do
    test "successfully lists runs for a given thread" do
      # Assume the Finch HTTP client is used to make the actual API request.
      # Mimic is used to stub the Finch request response for this test.
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: Jason.encode!(@valid_run_list)}}
      end)

      # Call the list_runs function with the thread_id parameter.
      assert {:ok, run_list} = Api.list("thread_123")

      # Validate the response against the defined struct.
      assert %Runs{} = run_list
      assert length(run_list.data) == 1
    end

    test "successfully creates a run for a thread" do
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: Jason.encode!(@valid_run)}}
      end)

      assert {:ok, %Run{}} = Api.create("thread_123", %{})
    end

    test "successfully retrieves a run by thread and run ID" do
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: Jason.encode!(@valid_run)}}
      end)

      assert {:ok, %Run{}} = Api.get("thread_123", "run_123")
    end

    test "successfully modifies a run by thread and run ID" do
      update_attrs = %{"metadata" => %{"new_info" => "updated"}}
      updated_run = Map.put(@valid_run, :metadata, %{"new_info" => "updated"})

      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: Jason.encode!(updated_run)}}
      end)

      assert {:ok, %Run{}} = Api.update("thread_123", "run_123", update_attrs)
    end

    test "successfully cancels a run by thread and run ID" do
      canceled_run = Map.put(@valid_run, :status, "cancelled")

      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: Jason.encode!(canceled_run)}}
      end)

      assert {:ok, %Run{status: "cancelled"}} = Api.cancel("thread_123", "run_123")
    end

    test "successfully submits tool outputs for a run that requires action" do
      pending_run = Map.put(@valid_run, :required_action, %{submit_tool_outputs: %{}})
      submitted_run = Map.put(pending_run, :status, "completed")

      tool_outputs = %{"tool_outputs" => [%{"tool_call_id" => "tool_123", "output" => "result"}]}

      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: Jason.encode!(submitted_run)}}
      end)

      assert {:ok, %Run{}} = Api.submit_tool_outputs("thread_123", "run_123", tool_outputs)
    end
  end
end
