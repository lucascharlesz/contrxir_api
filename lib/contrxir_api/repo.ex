defmodule ContrxirApi.Repo do
  use Ecto.Repo,
    otp_app: :contrxir_api,
    adapter: Ecto.Adapters.Postgres
end
