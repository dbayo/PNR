class MainController < ApplicationController
    def index
        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @user }
        end
    end
end
