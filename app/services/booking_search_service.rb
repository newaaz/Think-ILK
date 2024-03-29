class BookingSearchService
  def self.call(params)
    search_params = { activated: true }
    search_params = search_params.merge(town_id:     params[:town_id].to_i)     if params[:town_id].present?
    search_params = search_params.merge(category_id: params[:category_id].to_i) if params[:category_id].present?

    if params[:guests].present?
      guest_number_query = {
                            "rooms.guest_base_count" => { lte: params[:guests] },
                            _and: ["rooms.guest_max_count" => { gte: params[:guests] }]
                           }

      search_params = search_params.merge guest_number_query    
    end

    if params[:check_in].present? && params[:check_out].present?
      date_available_query = {
        "rooms.start_available" => { lte: params[:check_in] },
        _and: ["rooms.end_available" => { gte: params[:check_out] }]
      }

      search_params = search_params.merge date_available_query
    end

    Property.pagy_search(where: search_params, order: { rating: :desc }, page: params[:page] )
  end
end
