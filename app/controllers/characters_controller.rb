class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
    render :form
  end

  def show
    @character = Character.find params.require :id
    render :form
  end

  def create
    @character = Character.new params.require :character
  end

  def update
    @character = Character.find params.require :id
    @character.write_attributes params.require :character
  end

end
