class TransportsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
      @transport = Transport.all
    end
  
    def show
      @transport = Transport.find(params[:id])
    end
  
    def new
      @transport = Transport.new
    end
  
    def create
      @transport = Transport.new(transport_params)
      @transport.user = current_user
      
      if @transport.save
        redirect_to @transport, notice: 'Объект успешно создан.'
      else
        render :new, status: 422
      end
    end
  
    def edit
      @transport = Transport.find(params[:id])
    end
  
    def update
      @transport = Transport.find(params[:id])
      
      if @transport.update(transport_params)
        redirect_to @transport, notice: 'Объект успешно загружен.'
      else
        render :edit
      end
    end
  
    def destroy
      @transport = Transport.find(params[:id])
      @transport.destroy
      
      redirect_to transports_url, notice: 'Объект успешно удалён.'
    end
  
    private
  
    def transport_params
      params.require(:transport).permit(:title, :picture, :description, :price, :location)
    end
  end