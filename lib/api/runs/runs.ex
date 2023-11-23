defmodule Noizu.OpenAI.Api.Runs do
  @moduledoc """
  Provides functions to interact with Runs within the OpenAI API.
  """
  require Noizu.OpenAI
  import Noizu.OpenAI

  @openai_base "https://api.openai.com/v1"

  # Lists runs belonging to a thread.
  def list_runs(thread_id, _params \\ %{}) do
    url = "#{@openai_base}/threads/#{thread_id}/runs"
    api_call(:get, url, nil, Noizu.OpenAI.RunList)
  end

  # Creates a new run for a thread.
  def create_run(thread_id, attrs) do
    url = "#{@openai_base}/threads/#{thread_id}/runs"
    api_call(:post, url, attrs, Noizu.OpenAI.Run)
  end

  # Retrieves a specific run by its ID.
  def get_run(thread_id, run_id) do
    url = "#{@openai_base}/threads/#{thread_id}/runs/#{run_id}"
    api_call(:get, url, nil, Noizu.OpenAI.Run)
  end

  # Modifies a specific run by its ID.
  def modify_run(thread_id, run_id, attrs) do
    url = "#{@openai_base}/threads/#{thread_id}/runs/#{run_id}"
    api_call(:post, url, attrs, Noizu.OpenAI.Run)
  end

  # Cancels a run that is in progress.
  def cancel_run(thread_id, run_id) do
    url = "#{@openai_base}/threads/#{thread_id}/runs/#{run_id}/cancel"
    api_call(:post, url, nil, Noizu.OpenAI.Run)
  end

  # Submits tool outputs to a run that requires action.
  def submit_tool_outputs(thread_id, run_id, outputs) do
    url = "#{@openai_base}/threads/#{thread_id}/runs/#{run_id}/submit_tool_outputs"
    api_call(:post, url, outputs, Noizu.OpenAI.Run)
  end

end
