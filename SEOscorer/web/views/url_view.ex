defmodule EarlybirdExtractor.UrlView do
  use EarlybirdExtractor.Web, :view

  # def render("seoscore.json", %{score: score}) do
  #   %{score: score}
  # end

  def render("score.json", %{score: score}) do
    %{score: score}
  end
end
