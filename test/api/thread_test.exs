defmodule Noizu.OpenAI.Api.ThreadTest do
  use ExUnit.Case, async: true
  alias Noizu.OpenAI.Api.Thread, as: Api
  alias Noizu.OpenAI.Thread
  alias Noizu.OpenAI.Threads

  @valid_thread_attrs %{
    "id" => "thread_123",
    "object" => "thread",
    "created_at" => 1_662_622_251,
    "metadata" => %{}
  }

  @valid_thread_list %{
    "object" => "list",
    "data" => [@valid_thread_attrs],
    "first_id" => "thread_123",
    "last_id" => "thread_123",
    "has_more" => false
  }

  describe "happy path" do
    test "successfully creates a thread" do
      response_json = @valid_thread_attrs
                      |> Jason.encode!()
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: response_json}}
      end)
      assert {:ok, %Thread{}} = Api.create(%{})
    end

    test "lists threads successfully" do
      response_json = @valid_thread_list
                      |> Jason.encode!()
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: response_json}}
      end)
      assert {:ok, %Threads{}} = Api.list()
    end

    test "retrieves a thread by ID successfully" do
      response_json = @valid_thread_attrs
                      |> Jason.encode!()
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: response_json}}
      end)
      assert {:ok, %Thread{}} = Api.get("thread_123")
    end

    test "successfully updates a thread" do
      response_json = Map.put(@valid_thread_attrs, "metadata", %{"updated" => true})
                      |> Jason.encode!()
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: response_json}}
      end)
      assert {:ok, %Thread{metadata: %{updated: true}}} = Api.update("thread_123", %{"metadata" => %{"updated" => true}})
    end

    test "successfully deletes a thread" do
      response_json = %{"id" => "thread_123", "object" => "thread.deleted", "deleted" => true}
                      |> Jason.encode!()
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: response_json}}
      end)
      assert {:ok, response} = Api.delete("thread_123")
      assert response.deleted == true
    end
  end
end
