class TvsController < ApplicationController

  def index

    current_page = params[:page].nil? || params[:page].eql?(0) ? 1 : params[:page].to_i
    per_page = params[:per_page] = 20
    total_entries = params[:total_entries]
    model = params[:model] = "TV Shows"
    sort_list = params[:sort]
    sort_list || sort_list = "popularity.desc"
    tvs_object = Tv.get_all_shows(current_page, sort_list)
    tv_shows = tvs_object['results']
    total_results = tvs_object["total_results"]
    # Pagination
    total_pages = tvs_object['total_pages']
    collection = (1..total_pages).to_a
    paginated_collection = collection.paginate(current_page, per_page)

    # Sets min and max items display numbers
    previous_label = params[:previous_label] = "&#187; Previous "
    next_label = params[:next_label] = " Next &#171;"
    min_item_number = current_page * per_page
    max_item_number = min_item_number - 19

    render :index, locals: {
      current_page: current_page,
      per_page: per_page,
      model: model,
      sort_list: sort_list,
      tvs_object: tvs_object,
      tv_shows: tv_shows,
      total_pages: total_pages,
      total_results: total_results,
      collection: collection,
      total_entries: total_entries,
      paginated_collection: paginated_collection,
      min_item_number: min_item_number,
      max_item_number: max_item_number,
      previous_label: previous_label,
      next_label: next_label
    }
  end

  def show

    tvid = params[:tvid].to_i
    tv_details = Tv.get_single_show(tvid)
    response_status_code = tv_details["status_code"]
    error_msg = tv_details["status_message"]

    #Catch error and render custom msg
    if response_status_code.eql?(34)
      error_msg = "Error: The show you are looking for was not foud. "
    else
      tv_show_name = tv_details["original_name"] || tv_details["name"]
      backdrop_image = tv_details["backdrop_path"]
      poster_image = tv_details["poster_path"]
      genre = tv_details["genres"][0]["name"]
      network_name = tv_details["networks"][0]["name"]
      network_logo = tv_details["networks"][0]["logo_path"]
      number_of_seasons = tv_details["number_of_seasons"]
      overview = tv_details["overview"]
      vote_avg = tv_details["vote_average"]
      tv_show_link = tv_details["homepage"]
    end


    render :show, locals: {
      tvid: tvid,
      tv_details: tv_details,
      backdrop_image: backdrop_image,
      poster_image: poster_image,
      genre: genre,
      network_name: network_name,
      network_logo: network_logo,
      number_of_seasons: number_of_seasons,
      overview: overview,
      vote_avg: vote_avg,
      tv_show_link: tv_show_link,
      tv_show_name: tv_show_name,
      response_status_code: response_status_code,
      error_msg: error_msg
    }
  end
end
