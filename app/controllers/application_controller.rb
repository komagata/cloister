class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init

  protected
  def init
    @head_title = "p0t"
    @meta_description = "ガチ鬱プログラマー日記"
    @meta_keywords = '鬱,Ruby,PHP,Rails'
    @description = "ガチ鬱プログラマー日記"
  end
end
