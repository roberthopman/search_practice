class ApplicationController < ActionController::Base
  def index
    @entries = search_collection(Entry)
    render 'layouts/index' 
  end

  def search_collection(coll)
    # Option 1: individual scopes chained in controller
    # coll = (params["query"].present? ? coll.title_contains(params["query"]) : coll)
    # coll = (params["query"].present? ? coll.group_title_contains(params["query"]) : coll)

    # Option 2: Better to chain scopes in model
    coll = (params["query"].present? ? coll.search_in_multiple_tables(params["query"]) : coll)
    
    # Preventing N+1 queries problem (1 (all entries) + N (for each group))
    coll.includes(:group)
  end
end
