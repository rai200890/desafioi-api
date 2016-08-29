module PaginationConcern
  extend ActiveSupport::Concern

  def pagination_info(resource)
    {
      current_page: resource.current_page,
      next_page: resource.next_page,
      prev_page: resource.prev_page,
      total_pages: resource.total_pages,
      total_count: resource.total_count
    }
  end

end
