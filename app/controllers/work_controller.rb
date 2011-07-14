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
        
        @pos = Position.create
        @pos.work_id = @work.id
        @pos.tren = 1
        @pos.posicion = 1
        @pos.letras = "AAA"
        @pos.save
        @work.T1P1 = @pos.id
        
        @pos = Position.create
        @pos.work_id = @work.id
        @pos.tren = 1
        @pos.posicion = 2
        @pos.letras = "AAA"
        @pos.save
        @work.T1P2 = @pos.id
        
        @pos = Position.create
        @pos.work_id = @work.id
        @pos.tren = 1
        @pos.posicion = 3
        @pos.letras = "AAA"
        @pos.save
        @work.T1P3 = @pos.id
        
        @pos = Position.create
        @pos.work_id = @work.id
        @pos.tren = 1
        @pos.posicion = 4
        @pos.letras = "AAA"
        @pos.save
        @work.T1P4 = @pos.id
        
        @pos = Position.create
        @pos.work_id = @work.id
        @pos.tren = 1
        @pos.posicion = 5
        @pos.letras = "AAA"
        @pos.save
        @work.T1P5 = @pos.id
        
        @pos = Position.create
        @pos.work_id = @work.id
        @pos.tren = 2
        @pos.posicion = 1
        @pos.letras = "AAA"
        @pos.save
        @work.T2P1 = @pos.id
        
        @pos = Position.create
        @pos.work_id = @work.id
        @pos.tren = 2
        @pos.posicion = 2
        @pos.letras = "AAA"
        @pos.save
        @work.T2P2 = @pos.id
        
        @pos = Position.create
        @pos.work_id = @work.id
        @pos.tren = 2
        @pos.posicion = 3
        @pos.letras = "AAA"
        @pos.save
        @work.T2P3 = @pos.id
        
        @pos = Position.create
        @pos.work_id = @work.id
        @pos.tren = 2
        @pos.posicion = 4
        @pos.letras = "AAA"
        @pos.save
        @work.T2P4 = @pos.id
        
        @pos = Position.create
        @pos.work_id = @work.id
        @pos.tren = 2
        @pos.posicion = 5
        @pos.letras = "AAA"
        @pos.save
        @work.T2P5 = @pos.id
        
        @work.save
        
        @load = Load.create
        @load.work_id = @work.id
        @load.save
        
        respond_to do |format|
            format.html { redirect_to( work_path( @work.id ) ) }
        end      
    end
    def update
        @work = Work.find(params[:id])
        
        if params[:pos] == "T1P1"
            @pos = Position.find(@work.T1P1)
            @pos.letras = params[:nameA]
            @pos.numeros = params[:nameB]
            @pos.save
        
        elsif params[:pos] == "T1P2"
            @pos = Position.find(@work.T1P2)
            @pos.letras = params[:nameA]
            @pos.numeros = params[:nameB]
            @pos.save
        
        elsif params[:pos] == "T1P3"
            @pos = Position.find(@work.T1P3)
            @pos.letras = params[:nameA]
            @pos.numeros = params[:nameB]
            @pos.save
        
        elsif params[:pos] == "T1P4"
            @pos = Position.find(@work.T1P4)
            @pos.letras = params[:nameA]
            @pos.numeros = params[:nameB]
            @pos.save
        
        elsif params[:pos] == "T1P5"
            @pos = Position.find(@work.T1P5)
            @pos.letras = params[:nameA]
            @pos.numeros = params[:nameB]
            @pos.save
        
        elsif params[:pos] == "T2P1"
            @pos = Position.find(@work.T2P1)
            @pos.letras = params[:nameA]
            @pos.numeros = params[:nameB]
            @pos.save
        
        elsif params[:pos] == "T2P2"
            @pos = Position.find(@work.T2P2)
            @pos.letras = params[:nameA]
            @pos.numeros = params[:nameB]
            @pos.save
        
        elsif params[:pos] == "T2P3"
            @pos = Position.find(@work.T2P3)
            @pos.letras = params[:nameA]
            @pos.numeros = params[:nameB]
            @pos.save
        
        elsif params[:pos] == "T2P4"
            @pos = Position.find(@work.T2P4)
            @pos.letras = params[:nameA]
            @pos.numeros = params[:nameB]
            @pos.save
        
        elsif params[:pos] == "T2P5"
            @pos = Position.find(@work.T2P5)
            @pos.letras = params[:nameA]
            @pos.numeros = params[:nameB]
            @pos.save
        end
        
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
