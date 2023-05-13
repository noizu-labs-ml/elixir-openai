# Noizu.OpenAI.Api.Edit

`Noizu.OpenAI.Api.Edit` is a module that provides functionality to interact with the OpenAI API's edit feature. It allows you to create an edited version of a given prompt based on provided instructions.

## Usage

To create an edit, call the `Noizu.OpenAI.Api.Edit.edit/3` function with the input text, instruction, and any optional parameters:

```elixir
input = "What day of the wek is it?"
instruction = "Fix the spelling mistakes"
options = %{
  :model => "text-davinci-edit-001"
}

{:ok, response} = Noizu.OpenAI.Api.Edit.edit(input, instruction, options)
```

## API

### edit/3

Creates a new edit for the provided input, instruction, and parameters.

- `input`: (string) The input text to use as a starting point for the edit.
- `instruction`: (string) The instruction that tells the model how to edit the prompt.
- `options`: (map) A map of optional parameters.

Optional parameters:

- `:model`: (string) ID of the model to use. Defaults to "text-davinci-edit-001".
- `:n`: (integer) How many edits to generate for the input and instruction. Defaults to 1.
- `:temperature`: (number) What sampling temperature to use, between 0 and 2. Defaults to 1.
- `:top_p`: (number) An alternative to sampling with temperature, called nucleus sampling. Defaults to 1.

## Example

Request:

```elixir
input = "What day of the wek is it?"
instruction = "Fix the spelling mistakes"
options = %{
  :model => "text-davinci-edit-001"
}

{:ok, response} = Noizu.OpenAI.Api.Edit.edit(input, instruction, options)
```

Response:

```elixir
%{
  :object => "edit",
  :created => 1589478378,
  :choices => [
    %{
      :text => "What day of the week is it?",
      :index => 0
    }
  ],
  :usage => %{
    :prompt_tokens => 25,
    :completion_tokens => 32,
    :total_tokens => 57
  }
}
```