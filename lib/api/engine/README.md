# Noizu.OpenAI.Api.Engine

`Noizu.OpenAI.Api.Engine` provides a wrapper around OpenAI's deprecated Engines API. The Engines API has been replaced by the Models API, so it's recommended to use the Models API instead.

**Note: The Engines endpoints are deprecated. Please use their replacement, Models, instead.**

## Usage

### List Engines

To list the currently available (non-finetuned) models, and provide basic information about each one such as the owner and availability, you can use the `engines/0` function.

```elixir
Noizu.OpenAI.Api.Engine.engines()
```

### Retrieve Engine

To retrieve a specific engine and get basic information about it such as the owner and availability, you can use the `engine/1` function. Pass the engine ID as an argument.

```elixir
Noizu.OpenAI.Api.Engine.engine("engine-id")
```

## OpenAI API Notes

The Engines endpoints are deprecated. Please use their replacement, Models, instead.

These endpoints describe and provide access to the various engines available in the API.

### List engines

GET: `https://api.openai.com/v1/engines`

Lists the currently available (non-finetuned) models, and provides basic information about each one such as the owner and availability.

### Retrieve engine

GET: `https://api.openai.com/v1/engines/{engine_id}`

Retrieves a model instance, providing basic information about it such as the owner and availability.