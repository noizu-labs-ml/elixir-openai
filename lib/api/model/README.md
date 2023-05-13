# Noizu.OpenAI.Api.Model

Noizu.OpenAI.Api.Model is a module that provides a simple wrapper around OpenAI's API calls to interact with models. It allows you to list the available models and fetch detailed information about a specific model.

## Usage

To use the Noizu.OpenAI.Api.Model, you need to call the appropriate functions provided by the module.

### List models

To list the available models, use the `list()` function:

```elixir
Noizu.OpenAI.Api.Model.list()
```

This function will return a list of models with basic information such as the owner and availability of each model.

### Retrieve model

To retrieve detailed information about a specific model, use the `fetch(model)` function:

```elixir
Noizu.OpenAI.Api.Model.fetch("text-davinci-003")
```

This function will return a map containing information about the requested model, such as the owner and permissioning.

_NOTE: Replace "text-davinci-003" with the desired model ID in your use case._

## Models

Refer to the OpenAI Models documentation to understand the available models and their differences. The models have different capabilities, such as text completion, translation, or fine-tuning, and it's essential to choose the right model for your specific use case.

## API endpoints

The module uses the following API endpoints:

- List models: `https://api.openai.com/v1/models`
- Retrieve model: `https://api.openai.com/v1/models/{model}`

For more information on the API calls and their parameters, please refer to the OpenAI API documentation.

## Examples

Here are some examples of using the Noizu.OpenAI.Api.Model module:

```elixir
# List available models
{:ok, models} = Noizu.OpenAI.Api.Model.list()

# Fetch details for a specific model
{:ok, model} = Noizu.OpenAI.Api.Model.fetch("text-davinci-003")
```

For more examples and usage details, please refer to the module documentation and the OpenAI API documentation.