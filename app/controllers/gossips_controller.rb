class GossipsController < ApplicationController
   def index
     @list = Gossip.all
   end

   def new
     @gossip = Gossip.new
   end

   def create
     @gossip = Gossip.create(gossip_params)
     redirect_to gossip_path(@gossip.id)
   end

   def show
     @gossip = Gossip.find(params[:id])
   end

   def edit
       @gossip = Gossip.find(params[:id])
   end

   def update
       @gossip = Gossip.find(params[:id])
       @gossip.update(gossip_params)
       redirect_to gossip_path(@gossip.id)
   end


   private

   def gossip_params
    params.require(:gossip).permit(:title, :content, :anonymousgossiper)
   end

end
