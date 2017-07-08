defmodule UserAuth.SessionController do
  use UserAuth.Web, :controller
  alias UserAuth.User
  import Comeonin.Bcrypt, only: [checkpw: 2]

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    Repo.get_by(User, username: session_params["username"])
    |> sign_in(session_params["password"], conn)
  end

  #   def create(conn, %{"session" => session_params}) do
  #   case UserAuth.Session.login(session_params, UserAuth.Repo) do
  #     {:ok, user} ->
  #       conn
  #       |> put_session(:current_user, user.id)
  #       |> put_flash(:info, "Logged in")
  #       |> redirect(to: "/")
  #     :error ->
  #       conn
  #       |> put_flash(:info, "Wrong email or password")
  #       |> render("new.html")
  #   end
  # end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end

  defp sign_in(user, password, conn) when is_nil(user) do
    conn
    |> put_flash(:error, "Invalid email/password combination!")
    |> redirect(to: "/earlybird")
  end

  defp sign_in(user, password, conn) do
    if checkpw(password, user.crypted_password) do
      conn
      |> put_session(:current_user, %{id: user.id, email: user.email})
      |> put_flash(:info, "Sign in successful!")
      |> redirect(to: "/earlybird")
    else
      conn
      |> put_session(:current_user, nil)
      |> put_flash(:error, "Invalid email/password combination!")
      |> redirect(to: page_path(conn, :index))
    end
  end

end
