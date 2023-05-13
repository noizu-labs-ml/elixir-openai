defmodule Noizu.OpenAI.Api.FineTuneTest do
  use ExUnit.Case
  @moduletag :finetune

  describe "create/1" do
    test "successful fine-tune creation" do
      options = %{model: "base_model", dataset: "dataset_id", steps: 100, metadata: %{key: "value"}}
      response = %Noizu.OpenAI.FineTune{
        created_at: ~U[2021-03-03 21:35:52Z],
        events: %Noizu.OpenAI.FineTune.Events{
          list: [
            %Noizu.OpenAI.FineTune.Event{object: "fine-tune-event", created_at: ~U[2021-03-03 21:35:52Z], level: "info", message: "Job enqueued. Waiting for jobs ahead to complete. Queue number: 0."}
          ],
          object: "fine-tune"
        },
        fine_tuned_model: nil,
        hyper_params: %{batch_size: 4, learning_rate_multiplier: 0.1, n_epochs: 4, prompt_loss_weight: 0.1},
        id: "ft-AF1WoRqd3aJAHsqc9NY7iL8F",
        model: "curie",
        object: "fine-tune",
        organization_id: "org-...",
        result_files: %Noizu.OpenAI.Files{list: [], object: "fine-tune"},
        status: "pending",
        training_files: %Noizu.OpenAI.Files{
          list: [
            %Noizu.OpenAI.File{id: "file-XGinujblHPwGLSztz8cPS8XY", object: "file", bytes: 1547276, created_at: ~U[2021-01-07 23:31:21Z], filename: "my-data-train.jsonl", purpose: "fine-tune-train"}
          ],
          object: "fine-tune"
        },
        updated_at: ~U[2021-03-03 21:35:52Z],
        validation_files: %Noizu.OpenAI.Files{list: [], object: "fine-tune"}
      }
      payload = """
      {
        "id": "ft-AF1WoRqd3aJAHsqc9NY7iL8F",
        "object": "fine-tune",
        "model": "curie",
        "created_at": 1614807352,
        "events": [
          {
            "object": "fine-tune-event",
            "created_at": 1614807352,
            "level": "info",
            "message": "Job enqueued. Waiting for jobs ahead to complete. Queue number: 0."
          }
        ],
        "fine_tuned_model": null,
        "hyperparams": {
          "batch_size": 4,
          "learning_rate_multiplier": 0.1,
          "n_epochs": 4,
          "prompt_loss_weight": 0.1
        },
        "organization_id": "org-...",
        "result_files": [],
        "status": "pending",
        "validation_files": [],
        "training_files": [
          {
            "id": "file-XGinujblHPwGLSztz8cPS8XY",
            "object": "file",
            "bytes": 1547276,
            "created_at": 1610062281,
            "filename": "my-data-train.jsonl",
            "purpose": "fine-tune-train"
          }
        ],
        "updated_at": 1614807352
      }
    """

      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: payload}} end)

      {:ok, result} = Noizu.OpenAI.Api.FineTune.create(options)

      assert response == result
    end
  end

  describe "list/1" do
    test "successful fine-tune listing" do
      options = %{stream: false}
      response = %Noizu.OpenAI.FineTunes{object: "list", list: [
                                                           %Noizu.OpenAI.FineTune{
                                                             id: "finetune_id",
                                                             events: %Noizu.OpenAI.FineTune.Events{list: [], object: nil},
                                                             result_files: %Noizu.OpenAI.Files{list: [], object: nil},
                                                             training_files: %Noizu.OpenAI.Files{list: [], object: nil},
                                                             validation_files: %Noizu.OpenAI.Files{list: [], object: nil},
                                                           }
      ]
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"object\": \"list\", \"data\": [{\"id\": \"finetune_id\"}]}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.FineTune.list(options)

      assert response == result
    end
  end

  describe "fetch/2" do
    test "successful fine-tune fetching" do
      fine_tune_id = "finetune_id"
      options = %{stream: false}
      response = %Noizu.OpenAI.FineTune{
        id: "finetune_id",
        events: %Noizu.OpenAI.FineTune.Events{list: [], object: nil},
        result_files: %Noizu.OpenAI.Files{list: [], object: nil},
        training_files: %Noizu.OpenAI.Files{list: [], object: nil},
        validation_files: %Noizu.OpenAI.Files{list: [], object: nil},
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"id\": \"finetune_id\"}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.FineTune.fetch(fine_tune_id, options)

      assert response == result
    end
  end

  describe "cancel/2" do
    test "successful fine-tune cancellation" do
      fine_tune_id = "finetune_id"
      options = %{stream: false}
      response = %Noizu.OpenAI.FineTune{
        id: "finetune_id",
        events: %Noizu.OpenAI.FineTune.Events{list: [], object: nil},
        result_files: %Noizu.OpenAI.Files{list: [], object: nil},
        training_files: %Noizu.OpenAI.Files{list: [], object: nil},
        validation_files: %Noizu.OpenAI.Files{list: [], object: nil},
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"id\": \"finetune_id\"}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.FineTune.cancel(fine_tune_id, options)

      assert response == result
    end
  end

  describe "events/2" do
    test "successful fine-tune events fetching" do
      fine_tune_id = "finetune_id"
      options = %{stream: false}
      response = %Noizu.OpenAI.FineTune.Events{object: "list", list: [%Noizu.OpenAI.FineTune.Event{object: "event", created_at: ~U[1973-11-29 21:33:09Z], level: "info", message: "Test event"}]}
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"object\": \"list\", \"data\": [{\"object\": \"event\", \"created_at\": 123456789, \"level\": \"info\", \"message\": \"Test event\"}]}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.FineTune.events(fine_tune_id, options)

      assert response == result
    end
  end

  describe "delete/2" do
    test "successful fine-tune model deletion" do
      model = "model_id"
      options = %{stream: false}
      response = %Noizu.OpenAI.FineTune.Delete{id: "model_id", object: "delete", deleted: true}
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"id\": \"model_id\", \"object\": \"delete\", \"deleted\": true}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.FineTune.delete(model, options)

      assert response == result
    end
  end
end