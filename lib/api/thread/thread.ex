defmodule Noizu.OpenAI.Api.Thread do
  require Noizu.OpenAI
  import Noizu.OpenAI

  @openai_base "https://api.openai.com/v1"

  def list() do
    url = "#{@openai_base}/threads"
    api_call(:get, url, nil, Noizu.OpenAI.Threads)
  end

  def get(thread_id) do
    url = "#{@openai_base}/threads/#{thread_id}"
    api_call(:get, url, nil, Noizu.OpenAI.Thread)
  end

  def create(attrs) do
    url = "#{@openai_base}/threads"
    api_call(:post, url, attrs, Noizu.OpenAI.Thread)
  end

  def update(thread_id, attrs) do
    url = "#{@openai_base}/threads/#{thread_id}"
    api_call(:post, url, attrs, Noizu.OpenAI.Thread)
  end

  def delete(thread_id) do
    url = "#{@openai_base}/threads/#{thread_id}"
    api_call(:delete, url, nil, Noizu.OpenAI.DeleteStatus)
  end

  defmodule Message do
    @moduledoc """
    Provides functions to interact with Messages within the OpenAI API's thread context.
    """
    require Noizu.OpenAI
    import Noizu.OpenAI

    @openai_base "https://api.openai.com/v1"

    # Lists messages belonging to a thread.
    def list(thread_id) do
      url = "#{@openai_base}/threads/#{thread_id}/messages"
      api_call(:get, url, nil, Noizu.OpenAI.Messages)
    end

    # Creates a new message for a thread.
    def create(thread_id, attrs) do
      url = "#{@openai_base}/threads/#{thread_id}/messages"
      api_call(:post, url, attrs, Noizu.OpenAI.Message)
    end

    # Retrieves a specific message by its ID.
    def get(thread_id, message_id) do
      url = "#{@openai_base}/threads/#{thread_id}/messages/#{message_id}"
      api_call(:get, url, nil, Noizu.OpenAI.Message)
    end

    # Updates a specific message by its ID.
    def update(thread_id, message_id, attrs) do
      url = "#{@openai_base}/threads/#{thread_id}/messages/#{message_id}"
      api_call(:patch, url, attrs, Noizu.OpenAI.Message)
    end

    # Deletes a message from a thread.
    def delete(thread_id, message_id) do
      url = "#{@openai_base}/threads/#{thread_id}/messages/#{message_id}"
      api_call(:delete, url, nil, Noizu.OpenAI.DeleteStatus)
    end
  end


  defmodule Run do
    @moduledoc """
    Provides functions to interact with Runs within the OpenAI API.
    """
    require Noizu.OpenAI
    import Noizu.OpenAI

    @openai_base "https://api.openai.com/v1"

    # Lists runs belonging to a thread.
    def list(thread_id, _params \\ %{}) do
      url = "#{@openai_base}/threads/#{thread_id}/runs"
      api_call(:get, url, nil, Noizu.OpenAI.Runs)
    end

    # Creates a new run for a thread.
    def create(thread_id, attrs) do
      url = "#{@openai_base}/threads/#{thread_id}/runs"
      api_call(:post, url, attrs, Noizu.OpenAI.Run)
    end

    # Retrieves a specific run by its ID.
    def get(thread_id, run_id) do
      url = "#{@openai_base}/threads/#{thread_id}/runs/#{run_id}"
      api_call(:get, url, nil, Noizu.OpenAI.Run)
    end

    # Modifies a specific run by its ID.
    def update(thread_id, run_id, attrs) do
      url = "#{@openai_base}/threads/#{thread_id}/runs/#{run_id}"
      api_call(:post, url, attrs, Noizu.OpenAI.Run)
    end

    # Cancels a run that is in progress.
    def cancel(thread_id, run_id) do
      url = "#{@openai_base}/threads/#{thread_id}/runs/#{run_id}/cancel"
      api_call(:post, url, nil, Noizu.OpenAI.Run)
    end

    # Submits tool outputs to a run that requires action.
    def submit_tool_outputs(thread_id, run_id, outputs) do
      url = "#{@openai_base}/threads/#{thread_id}/runs/#{run_id}/submit_tool_outputs"
      api_call(:post, url, outputs, Noizu.OpenAI.Run)
    end

  end
end
