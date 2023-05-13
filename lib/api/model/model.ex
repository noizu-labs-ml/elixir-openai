defmodule Noizu.OpenAI.Api.Model do
  @moduledoc """
  Noizu.OpenAI.Api.Model is a module that provides functionality for managing models using OpenAI's API.

  This module offers two main functions:

    1. `list/0` - Lists all the available models.
    2. `fetch/1` - Retrieves information about a specific model.

  ## Usage

      {:ok, models} = Noizu.OpenAI.Api.Model.list()
      {:ok, model_info} = Noizu.OpenAI.Api.Model.fetch(model)
  """

  require Noizu.OpenAI
  import Noizu.OpenAI
  #-------------------------------
  #
  #-------------------------------
  @doc """
  Retrieves the list of available models from the OpenAI API.

  ## Returns

  Returns a tuple {:ok, models} on successful API call, where models is a list of available models.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      {:ok, models} = Noizu.OpenAI.Api.Model.list()
  """
  def list() do
    url = openai_base() <> "models"
    api_call(:get, url, nil, Noizu.OpenAI.Models)
  end

  #-------------------------------
  #
  #-------------------------------
  @doc """
  Retrieves the details of a specific model from the OpenAI API.

  ## Parameters

  - model: The name of the model for which to retrieve details

  ## Returns

  Returns a tuple {:ok, model} on successful API call, where model is a map containing the details of the specified model.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      {:ok, model} = Noizu.OpenAI.model("text-davinci-003")
  """
  def fetch(model) do
    url = openai_base() <> "models/#{model}"
    api_call(:get, url, nil, Noizu.OpenAI.Model)
  end

end
