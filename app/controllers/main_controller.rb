class MainController < ApplicationController
    def index
        @ultima = Work.find(:first, :order => "created_at desc")
        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @user }
        end
    end
end
