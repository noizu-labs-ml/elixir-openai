# Noizu.OpenAI.Api.FineTune

`Noizu.OpenAI.Api.FineTune` is a module within the Noizu.OpenAI library that provides a simple wrapper for OpenAI's FineTune API. It includes functions for creating, listing, fetching, canceling, and deleting fine-tuned models.

## Usage

### 1. Create a FineTuned Model

To create a fine-tuned model, you need to provide the options for the model, dataset, steps, and metadata.

```elixir
Noizu.OpenAI.Api.FineTune.create(options)
```

### 2. List FineTuned Models

To list all the fine-tuned models, use the following function:

```elixir
Noizu.OpenAI.Api.FineTune.list(options)
```

### 3. Fetch a FineTuned Model

To fetch a specific fine-tuned model by its ID, use the following function:

```elixir
Noizu.OpenAI.Api.FineTune.fetch(fine_tune_id, options)
```

### 4. Cancel a FineTuned Model

To cancel the creation of a fine-tuned model, use the following function:

```elixir
Noizu.OpenAI.Api.FineTune.cancel(fine_tune_id, options)
```

### 5. Fetch FineTune Events

To fetch the events of a specific fine-tuned model by its ID, use the following function:

```elixir
Noizu.OpenAI.Api.FineTune.events(fine_tune_id, options)
```

### 6. Delete a FineTuned Model

To delete a fine-tuned model, use the following function:

```elixir
Noizu.OpenAI.Api.FineTune.delete(model, options)
```

## OpenAI Notes

- FineTune API allows you to create custom models based on OpenAI's base models.
- Fine-tuning can improve the performance and usefulness of the models.
- Fine-tuned models can be used for specific tasks or domains.
- Fine-tuning requires a dataset for training along with other parameters such as the number of steps, metadata, and more.
- Fine-tuning is a resource-intensive process and may take a long time to complete.
- You can fetch the status, details, and events of a fine-tuned model using the provided functions.

For more details on the FineTune API, please refer to the official OpenAI documentation: https://beta.openai.com/docs/guides/fine-tuning

## License

This library is released under the MIT License.