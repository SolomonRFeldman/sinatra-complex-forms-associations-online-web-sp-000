class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    @pet = Pet.create(params[:pet])
    binding.pry
    @pet.owner = Owner.create(params[:owner]) unless @pet.owner = Owner.find(params[:owner_id])
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
  
  get '/owners/:id/edit' do 
    @owner = Owner.find(params[:id])
    @pets = Pet.all
    erb :'/owners/edit'
  end
  
end