defmodule EarlybirdExtractor.UrlController do
  use EarlybirdExtractor.Web, :controller

  def seoscore(conn, %{"business" => business}) do
    score = calculate_score(business)
    render(conn, "score.json", score: score)
  end

  defp calculate_score(webpage) do
    dom = get_dom(webpage)
    title_score = get_title_score(dom.body)
    meta_score = get_meta_score(dom.body)
    heading_score = get_heading_score(dom.body)
    title_score + meta_score + heading_score
  end

  defp get_dom(webpage) do
    HTTPotion.get webpage
  end

  defp get_meta_score(dom) do
    all_metas_count = length(Floki.find(dom, "meta"))
    false_metas_count = length(Floki.find(dom, "meta[charset = 'UTF-8']"))
    false_metas_count = false_metas_count + length(Floki.find(dom,"meta[charset = 'utf-8']"))
    false_metas_count = false_metas_count + length(Floki.find(dom,"meta[name = 'viewport']"))
    if all_metas_count - false_metas_count > 0 do
      15
    else
      0
    end
  end

  defp get_title_score(dom) do
    if length(Floki.find(dom, "title")) > 0 do
      15
    else
      0
    end
  end

  defp get_heading_score(dom) do
    header_count = length(Floki.find(dom, "h1"))
    header_count = header_count + length(Floki.find(dom, "h2"))
    header_count = header_count + length(Floki.find(dom, "h3"))
    if header_count > 0 do
      5
    else
      0
    end
  end
end
