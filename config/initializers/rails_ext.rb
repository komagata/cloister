module ActionView::Helpers::DateHelper
  #
  # ==== Examples
  #   select_date Date.current, :unit => ['年', '月', '日']
  #   # => 2001 年 08 月 11 月
  #
  def select_date(date = Date.current, options = {}, html_options = {})
      options[:order] ||= []
      [:year, :month, :day].each { |o| options[:order].push(o) unless options[:order].include?(o) }

      select_date = ''
      options[:unit] ||= ['', '', '']
      options[:order].each do |o|
        select_date << self.send("select_#{o}", date, options, html_options) + options[:unit].shift
      end
      select_date
  end
end

class ActionController::Base
=begin
  protected
  def acts_as_like(*columns)
    columns.each do |column|
      class_eval <<-EOS
        named_scope :#{column}_like, lambda {|s|
          {:conditions => [\"#{column} LIKE ?\", \"%#{s}%\"]}}
      EOS
    end
  end
=end
  def search(model, conds)
    conds.inject(model) do |ret, scope|
      params[scope].blank? ? ret : ret.send("#{scope}_like", params[scope])
    end
  end
end

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :defaults => ["application"]
