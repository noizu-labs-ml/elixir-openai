
defmodule Noizu.OpenAI.Images do
  @type t :: %__MODULE__{
               created: any,
               images: any,
             }

  defstruct [
    :created,
    :images
  ]


  def from_json(%{
    :created => created,
    :data => data
  }) do
    images = Enum.map(data, &Noizu.OpenAI.Images.Image.from_json/1)
    %__MODULE__{
      created: DateTime.from_unix!(created),
      images: images
    }
  end

  defmodule Image do
    defstruct [
      :url
    ]

    def from_json(%{
      :url => url
    }) do
      %__MODULE__{
        url: url
      }
    end
  end
end