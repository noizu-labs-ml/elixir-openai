defmodule Noizu.OpenAI.Api.Assistant do
  require Noizu.OpenAI
  import Noizu.OpenAI

  @base_uri "https://api.openai.com/v1/assistants"

  def list(options \\ []) do
    url = "#{@base_uri}"
    api_call(:get, url, nil, Noizu.OpenAI.Assistant, options)
  end

  def create(params, options \\ []) do
    url = "#{@base_uri}"
    api_call(:post, url, params, Noizu.OpenAI.Assistant, options)
  end

  def retrieve(id, options \\ []) do
    url = "#{@base_uri}/#{id}"
    api_call(:get, url, nil, Noizu.OpenAI.Assistant, options)
  end

  def update(id, params, options \\ []) do
    url = "#{@base_uri}/#{id}"
    api_call(:post, url, params, Noizu.OpenAI.Assistant, options)
  end

  def delete(id, options \\ []) do
    url = "#{@base_uri}/#{id}"
    api_call(:delete, url, nil, Noizu.OpenAI.Assistant, options)
  end
end
