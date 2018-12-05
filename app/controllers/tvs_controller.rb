class TvsController < ApplicationController

  def index

    current_page = params[:page].nil? || params[:page].eql?(0) ? 1 : params[:page].to_i
    per_page = params[:per_page] = 20
    total_entries = params[:total_entries]
    model = params[:model] = "TV Shows"
    sort_list = params[:sort]
    sort_list || sort_list = "popularity.desc"

    tvs_object = Tv.get_all_shows(current_page, sort_list)
    response_status_code = tvs_object["status_code"]
    errors = tvs_object['errors']

    error_msg = "Something went wrong. I'm bugging out" if response_status_code.eql?(34) || tvs_object.nil? || errors || response.headers.eql?("None")

    error_msg = tvs_object['errors']
    tv_shows = tvs_object['results']
    total_results = tvs_object["total_results"]
    # Pagination
    total_pages = tvs_object['total_pages']
    collection = (1..total_pages).to_a
    @paginated_collection = collection.paginate(current_page, per_page)
    render :index, locals: {
      current_page: current_page,
      per_page: per_page,
      model: model,
      sort_list: sort_list,
      tvs_object: tvs_object,
      errors: errors,
      error_msg: error_msg,
      tv_shows: tv_shows,
      total_results: total_results,
      total_pages: total_pages,
      collection: collection,
      total_entries: total_entries,
      # paginated_collection: paginated_collection
    }
  end

  def show

    tvid = params[:tvid].to_i
    tv_details = Tv.get_single_show(tvid)
    response_status_code = tv_details["status_code"]
    errors = tv_details['errors']
    #Catch error and render custom msg
    error_msg = "The show requested could not be found. I'm bugging out! " if response_status_code.eql?(34) || tv_details.nil? || errors || response.headers.eql?("None")

    no_info = "No information"
    tv_show_name = tv_details["original_name"] || tv_details["name"]
    backdrop_image = tv_details["backdrop_path"] ? tv_details["backdrop_path"]   : no_info
    poster_image = tv_details["poster_path"] ? tv_details["poster_path"]  : no_info
    vote_average = tv_details['vote_average'] ? tv_details['vote_average'] : no_info
    
    network =   tv_details["networks"][0]["name"] ? tv_details["networks"][0]["name"]  : no_info
    seasons = tv_details["number_of_seasons"] ? tv_details["number_of_seasons"] : no_info
    render :show, locals: {
      tvid: tvid,
      tv_details: tv_details,
      errors: errors,
      backdrop_image: backdrop_image,
      poster_image: poster_image,
      response_status_code: response_status_code,
      error_msg: error_msg,
      vote_average: vote_average,
      network: network,
      seasons: seasons,
      no_info: no_info
    }
  end
end
