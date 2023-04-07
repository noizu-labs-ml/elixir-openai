defmodule NoizuLabs.OpenAI.Repo do
  use Ecto.Repo,
    otp_app: :noizu_openai,
    adapter: Ecto.Adapters.Postgres
end
