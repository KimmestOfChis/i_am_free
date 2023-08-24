defmodule IAmFree.Repo do
  use Ecto.Repo,
    otp_app: :i_am_free,
    adapter: Ecto.Adapters.Postgres
end
