class CharactersController < ApplicationController

  def index
    @choice = Choice.suggest *available_choices.sample, current_user if available_choices.any?
    @characters = Character.all
  end

  def new
    @character = Character.new
    render :form
  end

  def show
    @character = Character.find_by_slug params.require :id
    authorize @character, :show?
    render :form
  end

  def create
    @character = Character.new params.require(:character).permit(:name, :slug)
    authorize @character, :create?
    if @character.save
      redirect_to character_path(@character)
    else
      render :form
    end
  end

  def update
    @character = Character.find_by_slug params.require :id
    authorize @character, :update?

    if @character.update_attributes params.require(:character).permit(:name, :slug)
      redirect_to character_path(@character)
    else
      render :form
    end
  end

  def destroy
    @character = Character.find_by_slug(params.require :id)
    authorize @character, :destroy?
    @character.destroy
    redirect_to characters_path
  end

end
