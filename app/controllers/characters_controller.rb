class CharactersController < ApplicationController

  def index
    @choices = [Character.first, Character.last]
    @characters = Character.all
  end

  def new
    @character = Character.new
    render :form
  end

  def show
    @character = Character.find_by_slug params.require :id
    render :form
  end

  def create
    @character = Character.new params.require(:character).permit(:name, :slug)
    if @character.save
      redirect_to character_path(@character)
    else
      render :form
    end
  end

  def update
    @character = Character.find_by_slug params.require :id
    if @character.update_attributes params.require(:character).permit(:name, :slug)
      redirect_to character_path(@character)
    else
      render :form
    end
  end

  def destroy
    Character.find_by_slug(params.require :id).destroy
    redirect_to characters_path
  end

end
