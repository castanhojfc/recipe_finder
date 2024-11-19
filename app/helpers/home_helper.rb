module HomeHelper
  def sort_link(column:, label:)
    direction = column == params[:column] ? next_direction : "asc"

    url_params = request.query_parameters.merge(column: column, direction: direction)

    if params[:query].present?
      url_params[:query] = params[:query]
    end

    link_to(label, root_path(url_params), data: { turbo_action: "replace" })
  end

  def next_direction
    params[:direction] == "asc" ? "desc" : "asc"
  end

  def sort_indicator
    tag.span(class: "sort sort-#{params[:direction]}")
  end

  def show_sort_indicator_for(column)
    sort_indicator if params[:column] == column
  end
end
