# Noizu.OpenAI.Api.FineTuning

The `Noizu.OpenAI.Api.FineTuning` module is part of the Noizu.OpenAI Elixir library. It provides a convenient interface to interact with OpenAI's FineTuning capabilities. Fine-tuning allows developers to train custom versions of GPT models on their own datasets, creating specialized models tailored to particular tasks or domains.

## Usage

### Fine-Tuning Jobs

#### List Fine-Tuning Jobs

```elixir
Noizu.OpenAI.Api.FineTuning.list(params)
```

List all fine-tuning jobs along with associated metadata. The `params` can include pagination or filtering options.

#### Create Fine-Tuning Job

```elixir
Noizu.OpenAI.Api.FineTuning.create(attrs)
```

Initiate a fine-tuning process with specified attributes. These attributes might include the dataset to use, model parameters, and other fine-tuning configurations.

#### Retrieve Fine-Tuning Job

```elixir
Noizu.OpenAI.Api.FineTuning.get(fine_tuning_job_id)
```

Fetch details and status of a specific fine-tuning job by its ID. Useful for tracking the progress of a fine-tuning job or retrieving its results.

## Examples

To begin fine-tuning a model:

```elixir
attributes = %{
  "training_file" => "file-Xyabcdef",
  "validation_file" => "file-Xabcdefg",
  "model" => "curie",
  "n_epochs" => 4
  # additional parameters as required
}
Noizu.OpenAI.Api.FineTuning.create(attributes)
```

To list the fine-tuning jobs:

```elixir
params = %{ "limit" => 5 } # for limiting the number of jobs returned
Noizu.OpenAI.Api.FineTuning.list(params)
```

To retrieve a specific fine-tuning job's details:

```elixir
job_id = "ft-job-id123"
Noizu.OpenAI.Api.FineTuning.get(job_id)
```

## Additional Information

Fine-tuning jobs can take significant time to complete, depending on the dataset size and model complexity. It is important to monitor job progress and potentially make use of results with callback functions or scheduled checks.

Please refer to the Noizu.OpenAI documentation and the OpenAI API official docs for further guidance on input attributes, response formats, and best practices when fine-tuning models.

## License

This library is released under the MIT License.
