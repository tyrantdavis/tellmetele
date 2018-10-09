class InquiriesController < ApplicationController

  def index
    probe = params[:query]
    page = params[:page].to_i
    session_inquiry = params[:inquiry]
    session_inquiry || session_inquiry = params[:query]

    if !probe
      probe,  page = session[:inquiry],  params[:inquiry_page]
    else
      session[:inquiry] = session_inquiry
      session_inquiry = probe,  page
    end

    page = 1 if page.eql?(0)
    parsed_inquiry = Inquiry.about(probe, page)
    pg_total = parsed_inquiry['total_pages']
    results_total = parsed_inquiry['total_results']
    inquiry_results = parsed_inquiry['results']
    errors = parsed_inquiry['errors']
    render :index, locals: {
      probe: probe,
      page: page,
      errors: errors,
      session_inquiry: session_inquiry,
      parsed_inquiry: parsed_inquiry,
      pg_total: pg_total,
      results_total: results_total,
      inquiry_results: inquiry_results,
    }
  end
end
