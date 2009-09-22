class TopController < ApplicationController
  def sitemap
    @docs = Doc.all
    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
end
