defmodule Noizu.OpenAI.Message do
  @moduledoc """
  Represents a single message within a thread.
  """
  @derive Jason.Encoder
  defstruct [:id, :object, :created_at, :thread_id, :role, :content, :assistant_id, :run_id, :file_ids, :metadata]

  @type t :: %__MODULE__{
               id: String.t(),
               object: String.t(),
               created_at: integer(),
               thread_id: String.t(),
               role: String.t(),
               content: any(), # Replace with more specific type if needed
               assistant_id: String.t() | nil,
               run_id: String.t() | nil,
               file_ids: list(String.t()) | nil,
               metadata: map() | nil
             }

  def from_json(%{
    :id => id,
    :object => object,
    :created_at => created_at,
    :thread_id => thread_id,
    :role => role,
    :content => content,
    :assistant_id => assistant_id,
    :run_id => run_id,
    :file_ids => file_ids,
    :metadata => metadata
  }) do
    %__MODULE__{
      id: id,
      object: object,
      created_at: created_at,
      thread_id: thread_id,
      role: role,
      content: content,
      assistant_id: assistant_id,
      run_id: run_id,
      file_ids: file_ids || [],
      metadata: metadata || %{}
    }
  end
end
