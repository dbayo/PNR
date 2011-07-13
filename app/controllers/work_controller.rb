class WorkController < ApplicationController
    def index
        @works = Work.order("created_at desc").all()
        
        respond_to do |format|
            format.html # index.html.erb
        end
    end
    def show
        @work = Work.find(params[:id])
      
        respond_to do |format|
            format.html # index.html.erb
        end
    end
    def new
      
    end
    def create
        @work = Work.create
        @work.plane = params[:plane]
        @work.save
        
        respond_to do |format|
            format.html { redirect_to( work_path( @work.id ) ) }
        end      
    end
    def update
        @work = Work.find(params[:id])
        
        @work.T1P1 = params[:nameA]+params[:nameB] if params[:pos] == "T1P1"
        @work.T1P2 = params[:nameA]+params[:nameB] if params[:pos] == "T1P2"
        @work.T1P3 = params[:nameA]+params[:nameB] if params[:pos] == "T1P3"
        @work.T1P4 = params[:nameA]+params[:nameB] if params[:pos] == "T1P4"
        @work.T1P5 = params[:nameA]+params[:nameB] if params[:pos] == "T1P5"
        @work.T2P1 = params[:nameA]+params[:nameB] if params[:pos] == "T2P1"
        @work.T2P2 = params[:nameA]+params[:nameB] if params[:pos] == "T2P2"
        @work.T2P3 = params[:nameA]+params[:nameB] if params[:pos] == "T2P3"
        @work.T2P4 = params[:nameA]+params[:nameB] if params[:pos] == "T2P4"
        @work.T2P5 = params[:nameA]+params[:nameB] if params[:pos] == "T2P5"
        
        @work.save
        
        respond_to do |format|
            format.html { redirect_to( work_path( @work.id ) ) }
        end
    end
    def new
        @work = Work.new
        
        respond_to do |format|
          format.html # new.html.erb
        end
    end
    
    def load
        @work = Work.find(params[:id])
        
        respond_to do |format|
            format.html
        end
    end
end
