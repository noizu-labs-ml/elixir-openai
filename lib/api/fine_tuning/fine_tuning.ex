defmodule Noizu.OpenAI.Api.FineTuning do
  @moduledoc """
  Provides functions to interact with FineTuning within the OpenAI API.
  """
  require Noizu.OpenAI
  import Noizu.OpenAI

  @openai_base "https://api.openai.com/v1"

  # Lists fine-tuning jobs.
  def list(_params \\ %{}) do
    url = "#{@openai_base}/fine_tuning/jobs"
    api_call(:get, url, nil, Noizu.OpenAI.FineTuning.Jobs)
  end

  # Creates a new fine-tuning job.
  def create(attrs) do
    url = "#{@openai_base}/fine_tuning/jobs"
    api_call(:post, url, attrs, Noizu.OpenAI.FineTuning.Job)
  end

  # Retrieves details of a specific fine-tuning job by its ID.
  def get(fine_tuning_job_id) do
    url = "#{@openai_base}/fine_tuning/jobs/#{fine_tuning_job_id}"
    api_call(:get, url, nil, Noizu.OpenAI.FineTuning.Job)
  end
end
