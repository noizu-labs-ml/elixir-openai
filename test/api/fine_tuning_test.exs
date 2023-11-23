defmodule Noizu.OpenAI.Api.FineTuningTest do
  use ExUnit.Case, async: true
  alias Noizu.OpenAI.Api.FineTuning, as: Api
  alias Noizu.OpenAI.FineTuning.Job
  alias Noizu.OpenAI.FineTuning.Jobs

  @fine_tuning_job %Job{
    id: "ft-job-id",
    object: "fine_tuning.job",
    created_at: 1_661_234_567,
    model: "text-davinci-002",
    status: "succeeded",
    organization_id: "org-123",
    trained_tokens: 1000,
    result_files: [],
    training_file: "file-train-id",
    validation_file: "file-validation-id"
  }

  describe "FineTuning API" do
    test "lists fine-tuning jobs" do
      # Define response attributes based on the API documentation
      fine_tuning_job_list = %Jobs{
        object: "list",
        data: [@fine_tuning_job],
        first_id: @fine_tuning_job.id,
        last_id: @fine_tuning_job.id,
        has_more: false
      }
                             |> Jason.encode!()

      # Stub HTTP request and response using Mimic or another mocking library
      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: fine_tuning_job_list}}
      end)

      assert {:ok, result} = Api.list()
      assert length(result.data) == 1
      assert result.object == "list"
      refute result.has_more
    end

    test "creates a new fine-tuning job" do
      # Define request and response attributes based on the API documentation
      request_attributes = %{
        model: "text-davinci-002",
        training_file: "file-train-id"
      }

      fine_tuning_job = @fine_tuning_job
                        |> Jason.encode!()

      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: fine_tuning_job}}
      end)

      assert {:ok, result} = Api.create(request_attributes)
      assert result.id == "ft-job-id"
      assert result.object == "fine_tuning.job"
      assert result.status == "succeeded"
    end

    test "retrieves a specific fine-tuning job by ID" do
      # Define response attributes based on the API documentation
      fine_tuning_job = @fine_tuning_job
                        |> Jason.encode!()

      Mimic.expect(Finch, :request, fn(_, _, _) ->
        {:ok, %Finch.Response{status: 200, body: fine_tuning_job}}
      end)

      job_id = "ft-job-id"
      assert {:ok, result} = Api.get(job_id)
      assert result.id == job_id
    end

    # Add more tests as needed for update, delete, and other fine-tuning operations
  end
end
