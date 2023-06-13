

defmodule Noizu.OpenAI.Api.FineTune do
  @moduledoc """
  Noizu.OpenAI.Api.FineTune is a module that provides functionality for managing fine-tuning of models using OpenAI's API.

  This module offers several functions for fine-tuning management:

    1. `create/1` - Creates a new fine-tuning job using the specified options.
    2. `list/1` - Lists all the fine-tuning jobs.
    3. `fetch/2` - Retrieves information about a specific fine-tuning job.
    4. `cancel/2` - Cancels a specific fine-tuning job.
    5. `events/2` - Retrieves events of a specific fine-tuning job.
    6. `delete/2` - Deletes a specific model.

  ## Usage

      {:ok, fine_tune} = Noizu.OpenAI.Api.FineTune.create(options)
      {:ok, fine_tunes} = Noizu.OpenAI.Api.FineTune.list(options)
      {:ok, fine_tune_info} = Noizu.OpenAI.Api.FineTune.fetch(fine_tune_id, options)
      {:ok, canceled_fine_tune} = Noizu.OpenAI.Api.FineTune.cancel(fine_tune_id, options)
      {:ok, fine_tune_events} = Noizu.OpenAI.Api.FineTune.events(fine_tune_id, options)
      {:ok, deleted_model} = Noizu.OpenAI.Api.FineTune.delete(model, options)
  """

  require Noizu.OpenAI
  import Noizu.OpenAI

  # Fine-tune endpoints
  def create(options \\ nil) do
    url = openai_base() <> "fine-tunes"
    body = %{}
           |> put_field(:model, options)
           |> put_field(:dataset, options)
           |> put_field(:steps, options)
           |> put_field(:metadata, options)
    api_call(:post, url, body, Noizu.OpenAI.FineTune, options)
  end

  def list(options \\ nil) do
    url = openai_base() <> "fine-tunes"
    api_call(:get, url, nil, Noizu.OpenAI.FineTunes, options)
  end

  def fetch(fine_tune_id, options \\ nil) do
    url = openai_base() <> "fine-tunes/#{fine_tune_id}"
    api_call(:get, url, nil, Noizu.OpenAI.FineTune, options)
  end

  def cancel(fine_tune_id, options \\ nil) do
    url = openai_base() <> "fine-tunes/#{fine_tune_id}/cancel"
    api_call(:post, url, nil, Noizu.OpenAI.FineTune, options)
  end

  def events(fine_tune_id, options \\ nil) do
    url = openai_base() <> "fine-tunes/#{fine_tune_id}/events"
    api_call(:get, url, nil, Noizu.OpenAI.FineTune.Events, options)
  end

  def delete(model, options \\ nil) do
    url = openai_base() <> "models/#{model}"
    api_call(:delete, url, nil, Noizu.OpenAI.FineTune.Delete, options)
  end
  
end