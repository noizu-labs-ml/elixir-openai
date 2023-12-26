defmodule Noizu.OpenAI.Api.Assistant do
  require Noizu.OpenAI
  import Noizu.OpenAI

  @base_uri "https://api.openai.com/v1/assistants"

  def add_beta_header(options) do
    update_in(options || [], [:headers], &[{"OpenAI-Beta", "assistants=v1"}| (&1 || [])])
  end

  def list(options \\ []) do
    url = "#{@base_uri}"
    api_call(:get, url, nil, Noizu.OpenAI.Assistants, add_beta_header(options))
  end

  def create(params, options \\ []) do
    url = "#{@base_uri}"
    api_call(:post, url, params, Noizu.OpenAI.Assistant, add_beta_header(options))
  end

  def get(id, options \\ []) do
    url = "#{@base_uri}/#{id}"
    api_call(:get, url, nil, Noizu.OpenAI.Assistant, add_beta_header(options))
  end

  def update(id, params, options \\ []) do
    url = "#{@base_uri}/#{id}"
    api_call(:post, url, params, Noizu.OpenAI.Assistant, add_beta_header(options))
  end

  def delete(id, options \\ []) do
    url = "#{@base_uri}/#{id}"
    api_call(:delete, url, nil, Noizu.OpenAI.DeleteStatus, add_beta_header(options))
  end
end
