class CharactersController < ApplicationController

  def index
    @choice = Choice.suggest *available_choices.sample, current_user if available_choices.any?
    @choices = Choice.all
    @characters = Character.all

    ratings = @characters.inject({}) do |h,c|
      h[c.id] ||= Hash[ r: 1000, n: 0 ]
      h[c.id][:r] = c.rating
      h[c.id][:n] = c.times_matched
      h
    end

    @choices.each do |choice|
      a, b = choice.a, choice.b

      achar = Elo::Player.new(rating: ratings[a][:r], games_played: ratings[a][:n])
      bchar = Elo::Player.new(rating: ratings[b][:r], games_played: ratings[b][:n])

      match = achar.versus(bchar)

      case choice.x
      when a then match.winner = achar
      when b then match.winner = bchar
      else match.draw
      end

      ratings[a][:r] = achar.rating
      ratings[b][:r] = bchar.rating

      ratings[a][:n] += 1
      ratings[b][:n] += 1
    end

    @characters.map { |c| c.rating = ratings[c.id][:r]; c }
    @characters = @characters.sort { |a,b| b.rating <=> a.rating }
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
    @character = Character.new params.require(:character).permit(:name, :slug, :portrait)
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

    if @character.update_attributes params.require(:character).permit(:name, :slug, :portrait)
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
