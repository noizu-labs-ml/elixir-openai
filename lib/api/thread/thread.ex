defmodule Noizu.OpenAI.Api.Threads do
  require Noizu.OpenAI
  import Noizu.OpenAI

  @openai_base "https://api.openai.com/v1"

  def list_threads() do
    url = "#{@openai_base}/threads"
    api_call(:get, url, nil, Noizu.OpenAI.ThreadList)
  end

  def get_thread(thread_id) do
    url = "#{@openai_base}/threads/#{thread_id}"
    api_call(:get, url, nil, Noizu.OpenAI.Thread)
  end

  def create_thread(attrs) do
    url = "#{@openai_base}/threads"
    api_call(:post, url, attrs, Noizu.OpenAI.Thread)
  end

  def modify_thread(thread_id, attrs) do
    url = "#{@openai_base}/threads/#{thread_id}"
    api_call(:post, url, attrs, Noizu.OpenAI.Thread)
  end

  def delete_thread(thread_id) do
    url = "#{@openai_base}/threads/#{thread_id}"
    api_call(:delete, url, nil, Noizu.OpenAI.Thread)
  end
end
