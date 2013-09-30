class PictureController < ApplicationController
  def index

     require 'open-uri'
     require 'nokogiri'
     require 'net/http'
     
     @list =[] 

     if !params[:word].present?
       @status = false
     else

     word = params[:word]
url = "http://search.daum.net/search?w=img&nil_search=btn&DA=TATO&enc=utf8&q=#{word}"

doc = Nokogiri::HTML(open(url))

doc.xpath("//li[contains(@id, 'image')]").each do |obj|
   @list.push(obj.search("img").attr("src").value)
end
    
puts @list
render json: @list
     end

  end
end
