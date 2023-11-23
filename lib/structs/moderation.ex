defmodule Noizu.OpenAI.Moderation.Category do
  @derive Jason.Encoder
  defstruct [
    :hate,
    :hate_threatening,
    :self_harm,
    :sexual,
    :sexual_minors,
    :violence,
    :violence_graphic
  ]

  @type t :: %__MODULE__{
               hate: boolean(),
               hate_threatening: boolean(),
               self_harm: boolean(),
               sexual: boolean(),
               sexual_minors: boolean(),
               violence: boolean(),
               violence_graphic: boolean()
             }

  def from_json(map) do
    %__MODULE__{
      hate: Map.get(map, :hate, false),
      hate_threatening: Map.get(map, :"hate/threatening", false),
      self_harm: Map.get(map, :self_harm, false),
      sexual: Map.get(map, :sexual, false),
      sexual_minors: Map.get(map, :"sexual/minors", false),
      violence: Map.get(map, :violence, false),
      violence_graphic: Map.get(map, :"violence/graphic", false)
    }
  end
end

defmodule Noizu.OpenAI.Moderation.CategoryScore do
  defstruct [
    :hate,
    :hate_threatening,
    :self_harm,
    :sexual,
    :sexual_minors,
    :violence,
    :violence_graphic
  ]

  @type t :: %__MODULE__{
               hate: float(),
               hate_threatening: float(),
               self_harm: float(),
               sexual: float(),
               sexual_minors: float(),
               violence: float(),
               violence_graphic: float()
             }

  def from_json(map) do
    %__MODULE__{
      hate: Map.get(map, :hate, 0.0),
      hate_threatening: Map.get(map, :"hate/threatening", 0.0),
      self_harm: Map.get(map, :self_harm, 0.0),
      sexual: Map.get(map, :sexual, 0.0),
      sexual_minors: Map.get(map, :"sexual/minors", 0.0),
      violence: Map.get(map, :violence, 0.0),
      violence_graphic: Map.get(map, :"violence/graphic", 0.0)
    }
  end
end

defmodule Noizu.OpenAI.Moderation.Result do
  defstruct [
    :categories,
    :category_scores,
    :flagged
  ]

  @type t :: %__MODULE__{
               categories: Noizu.OpenAI.Moderation.Category.t(),
               category_scores: Noizu.OpenAI.Moderation.CategoryScore.t(),
               flagged: boolean()
             }

  def from_json(map) do
    %__MODULE__{
      categories: map[:categories] |> Noizu.OpenAI.Moderation.Category.from_json(),
      category_scores: map[:category_scores] |> Noizu.OpenAI.Moderation.CategoryScore.from_json(),
      flagged: Map.get(map, :flagged, false)
    }
  end
end

defmodule Noizu.OpenAI.Moderation do
  defstruct [
    :id,
    :model,
    :results
  ]

  @type t :: %__MODULE__{
               id: String.t(),
               model: String.t(),
               results: list(Noizu.OpenAI.Moderation.Result.t())
             }

  def from_json(json) do
    %__MODULE__{
      id: Map.get(json, :id),
      model: Map.get(json, :model),
      results: json[:results] |> Enum.map(&Noizu.OpenAI.Moderation.Result.from_json/1)
    }
  end
end
