# Noizu.OpenAI.Api.Embedding

`Noizu.OpenAI.Api.Embedding` is a module that provides functionality to create embeddings for a given input text. These embeddings are vector representations of the input text that can be easily consumed by machine learning models and algorithms, such as vector databases, cosine similarity measures, and other distance metrics.

An embedding is a fixed-size numerical vector that represents the input text. It captures the semantic meaning of the text, allowing for efficient comparisons and processing. This is useful for tasks like text classification, clustering, similarity searching, and more.

## Embeddings

Use the `Noizu.OpenAI.Api.Embedding` module to get a vector representation of a given input that can be easily consumed by machine learning models and algorithms.

Related guide: [Embeddings](https://platform.openai.com/docs/guides/embeddings)

### Create embeddings

The `create/2` function sends a POST request to `https://api.openai.com/v1/embeddings` and creates an embedding vector representing the input text.

```elixir
Noizu.OpenAI.Api.Embedding.create(input, options)
```

#### Parameters

- `input`: A string or array representing the input text to get embeddings for. To get embeddings for multiple inputs in a single request, pass an array of strings or array of token arrays. Each input must not exceed 8192 tokens in length.

- `options`: An optional keyword list or map containing additional parameters.

    - `:model`: The ID of the model to use. Default is `"text-embedding-ada-002"`. You can use the List models API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models/overview) for descriptions of them.

    - `:user`: A unique identifier representing your end-user, which can help OpenAI monitor and detect abuse. Learn more [here](https://platform.openai.com/docs/data-usage-policies).

#### Examples

```elixir
input = "The quick brown fox jumps over the lazy dog"
options = [model: "text-embedding-ada-002"]
{:ok, response} = Noizu.OpenAI.Api.Embedding.create(input, options)
```

For multiple inputs:

```elixir
inputs = ["The quick brown fox jumps over the lazy dog", "The slow yellow dog sleeps under the wise fox"]
options = [model: "text-embedding-ada-002"]
{:ok, response} = Noizu.OpenAI.Api.Embedding.create(inputs, options)
```

For more details on the `Noizu.OpenAI.Api.Embedding` module and its functions, refer to the source code and documentation.