defmodule EarlybirdExtractor.Router do
  use EarlybirdExtractor.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EarlybirdExtractor do
    pipe_through :api
    get "/seoscore", UrlController, :seoscore
  end
end
