defmodule UserAuth.Router do
  use UserAuth.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UserAuth do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/earlybird", PageController, :show
    resources "/registrations", RegistrationController, only: [:new, :create]
    get    "/login",  SessionController, :new
    post   "/login",  SessionController, :create
    delete "/logout", SessionController, :delete
    # get "/earlybird", EarlyBirdController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", UserAuth do
    pipe_through :api

    get "/users", UserController, :index
    get "/users/:id", UserController, :show
    post "/users", UserController, :create
    put "/users/:id", UserController, :update
  end
end
