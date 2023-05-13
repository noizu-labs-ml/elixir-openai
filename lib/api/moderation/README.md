# Noizu.OpenAI.Api.Moderation

`Noizu.OpenAI.Api.Moderation` is a module that provides functionality to classify text based on whether it violates OpenAI's Content Policy. It returns a list of categories with flags indicating whether the input text violates any specific category.

A moderation is a classification of input text to determine if it violates any guidelines or content policies. This can be useful for filtering out harmful, offensive, or inappropriate content from user-generated inputs, ensuring a safe and friendly environment for your application.

Related guide: [Moderations](https://platform.openai.com/docs/guides/moderations)

## Moderations

Use the `Noizu.OpenAI.Api.Moderation` module to classify text based on whether it violates OpenAI's Content Policy.

### Create moderation

The `create/2` function sends a POST request to `https://api.openai.com/v1/moderations` and classifies the input text based on whether it violates any specific category in OpenAI's Content Policy.

```elixir
Noizu.OpenAI.Api.Moderation.create(input, options)
```

#### Parameters

- `input`: A string or array representing the input text to classify. The input text should be a valid string.

- `options`: An optional keyword list or map containing additional parameters.

    - `:model`: The ID of the model to use. Default is `"text-moderation-latest"`. Two content moderation models are available: `text-moderation-stable` and `text-moderation-latest`. The default is `text-moderation-latest` which will be automatically upgraded over time. This ensures you are always using our most accurate model. If you use `text-moderation-stable`, we will provide advanced notice before updating the model. Accuracy of `text-moderation-stable` may be slightly lower than for `text-moderation-latest`.

#### Examples

```elixir
input = "I want to kill them."
options = [model: "text-moderation-latest"]
{:ok, response} = Noizu.OpenAI.Api.Moderation.create(input, options)
```

For more details on the `Noizu.OpenAI.Api.Moderation` module and its functions, refer to the source code and documentation.