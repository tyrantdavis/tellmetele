class InquiriesController < ApplicationController

  def index
    probe = params[:query]
    page = params[:page].to_i
    per_page = params[:per_page] = 20
    session_inquiry = params[:inquiry]
    session_inquiry || session_inquiry = params[:query]


    if probe
      session[:inquiry] = session_inquiry
      session_inquiry = probe,  page
    else
      probe,  page = session[:inquiry],  params[:inquiry_page]
    end

    next_page = params[:page].to_i + 1
    previous_page = params[:page].to_i - 1
    page = 1 if page.eql?(0)
    parsed_inquiry = Inquiry.about(probe, page)
    errors = parsed_inquiry['errors']
    response_status_code = parsed_inquiry["status_code"]
    pg_total = parsed_inquiry['total_pages']

    error_msg = "Oops. Invalid or empty input." if response_status_code.eql?(34) || parsed_inquiry.nil? || errors || response.headers.eql?("None") || parsed_inquiry['results'].empty?


    results_total = parsed_inquiry['total_results']
    inquiry_results = parsed_inquiry['results']
    render :index, locals: {
      probe: probe,
      page: page,
      per_page: per_page,
      errors: errors,
      error_msg: error_msg,
      session_inquiry: session_inquiry,
      parsed_inquiry: parsed_inquiry,
      response_status_code: response_status_code,
      pg_total: pg_total,
      results_total: results_total,
      inquiry_results: inquiry_results,
      next_page: next_page,
      previous_page: previous_page
    }
  end
end
