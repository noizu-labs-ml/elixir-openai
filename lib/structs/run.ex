defmodule Noizu.OpenAI.Run do
  @moduledoc """
  Represents an execution run on a thread.
  """
  defstruct [
    :id,
    :object,
    :created_at,
    :assistant_id,
    :thread_id,
    :status,
    :required_action,
    :last_error,
    :expires_at,
    :started_at,
    :cancelled_at,
    :failed_at,
    :completed_at,
    :model,
    :instructions,
    :tools,
    :file_ids,
    :metadata
  ]

  @type t :: %__MODULE__{
               id: String.t(),
               object: String.t(),
               created_at: integer(),
               assistant_id: String.t(),
               thread_id: String.t(),
               status: String.t(),
               required_action: map() | nil,
               last_error: map() | nil,
               expires_at: integer(),
               started_at: integer() | nil,
               cancelled_at: integer() | nil,
               failed_at: integer() | nil,
               completed_at: integer() | nil,
               model: String.t(),
               instructions: String.t() | nil,
               tools: list(map()),
               file_ids: list(String.t()),
               metadata: map()
             }

  def from_json(%{
    "id" => id,
    "object" => object,
    "created_at" => created_at,
    "assistant_id" => assistant_id,
    "thread_id" => thread_id,
    "status" => status,
    "required_action" => required_action,
    "last_error" => last_error,
    "expires_at" => expires_at,
    "started_at" => started_at,
    "cancelled_at" => cancelled_at,
    "failed_at" => failed_at,
    "completed_at" => completed_at,
    "model" => model,
    "instructions" => instructions,
    "tools" => tools,
    "file_ids" => file_ids,
    "metadata" => metadata
  }) do
    %__MODULE__{
      id: id,
      object: object,
      created_at: created_at,
      assistant_id: assistant_id,
      thread_id: thread_id,
      status: status,
      required_action: required_action,
      last_error: last_error,
      expires_at: expires_at,
      started_at: started_at,
      cancelled_at: cancelled_at,
      failed_at: failed_at,
      completed_at: completed_at,
      model: model,
      instructions: instructions,
      tools: tools,
      file_ids: file_ids,
      metadata: metadata
    }
  end
end
