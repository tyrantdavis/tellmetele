class InquiriesController < ApplicationController

  def index
    probe = params[:query]
    pg = params[:page].to_i
    session_inquiry = params[:inquiry]
    session_inquiry || session_inquiry = probe

    if !probe
      probe,  pg = session_inquiry,  params[:inquiry_page]
    else
      session_inquiry,  session_inquiry = probe,  pg
    end

    pg = 1 if pg.eql?(0)
    parsed_inquiry = Inquiry.about(probe, pg).parsed_response
    pg_total = parsed_inquiry['total_pages']
    results_total = parsed_inquiry['total_results']
    inquiry_results = parsed_inquiry['results']

    render :index, locals: {
      probe: probe,
      pg: pg,
      session_inquiry: session_inquiry,
      parsed_inquiry: parsed_inquiry,
      pg_total: pg_total,
      results_total: results_total,
      inquiry_results: inquiry_results,
    }
  end
end
