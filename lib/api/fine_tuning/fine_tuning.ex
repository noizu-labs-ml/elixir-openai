defmodule Noizu.OpenAI.Api.FineTuning do
  @moduledoc """
  Provides functions to interact with FineTuning within the OpenAI API.
  """
  require Noizu.OpenAI
  import Noizu.OpenAI

  @openai_base "https://api.openai.com/v1"

  # Lists fine-tuning jobs.
  def list_jobs(_params \\ %{}) do
    url = "#{@openai_base}/fine_tuning/jobs"
    api_call(:get, url, nil, Noizu.OpenAI.FineTuningJobList)
  end

  # Creates a new fine-tuning job.
  def create_job(attrs) do
    url = "#{@openai_base}/fine_tuning/jobs"
    api_call(:post, url, attrs, Noizu.OpenAI.FineTuningJob)
  end

  # Retrieves details of a specific fine-tuning job by its ID.
  def get_job(fine_tuning_job_id) do
    url = "#{@openai_base}/fine_tuning/jobs/#{fine_tuning_job_id}"
    api_call(:get, url, nil, Noizu.OpenAI.FineTuningJob)
  end
end
