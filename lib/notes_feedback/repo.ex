defmodule NotesFeedback.Repo do
  use Ecto.Repo,
    otp_app: :notes_feedback,
    adapter: Ecto.Adapters.Postgres
end
