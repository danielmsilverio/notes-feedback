import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :notes_feedback, NotesFeedback.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "notes_feedback_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :notes_feedback, NotesFeedbackWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Y462DK70PtcaIhURZlwOYQwkIMLXsG9BGUfd3i31guKOI/d7PB80zI7Zh184HbjH",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
