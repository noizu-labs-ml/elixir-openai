
defmodule Noizu.OpenAI.Api.Engine do
  @moduledoc """
    Noizu.OpenAI.Api.Engine provides a wrapper around OpenAI's deprecated Engines API.
    The Engines API has been replaced by the Models API, so it's recommended to use the Models API instead.

    **Note: The Engines endpoints are deprecated. Please use their replacement, Models, instead.**

    ## Usage

    ### List Engines

    To list the currently available (non-finetuned) models, and provide basic information about each one such as
    the owner and availability, you can use the `engines/0` function.

        Noizu.OpenAI.Api.Engine.engines()

    ### Retrieve Engine

    To retrieve a specific engine and get basic information about it such as the owner and availability,
    you can use the `engine/1` function. Pass the engine ID as an argument.

        Noizu.OpenAI.Api.Engine.engine("engine-id")

    ## OpenAI API Notes

    The Engines endpoints are deprecated. Please use their replacement, Models, instead.

    These endpoints describe and provide access to the various engines available in the API.
  """
  require Noizu.OpenAI
  import Noizu.OpenAI


  # Engine endpoints
  def engine(engine_id, options \\ nil) do
    url = openai_base() <> "engines/#{engine_id}"
    api_call(:get, url, nil, Noizu.OpenAI.Engine, options[:stream])
  end

  def engines(options \\ nil) do
    url = openai_base() <> "engines"
    api_call(:get, url, nil, Noizu.OpenAI.Engines, options[:stream])
  end

end