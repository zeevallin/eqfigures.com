class ChoicesController < ApplicationController

  def create

    p = params.require(:character).permit(:a, :b, :x)
    p[:a], p[:b] = *[p[:a], p[:b]].sort

    @choice = Choice.new(p)
    @choice.user = current_user

    authorize @choice, :create?

    @choice.save

    respond_to do |format|

      format.html { redirect_to characters_path }
      format.js do

        if available_choices.any?
          @choice = Choice.suggest *available_choices.sample.shuffle, current_user
          render partial: 'characters/choice', locals: { choice: @choice }
        else
          render nothing: true
        end

      end

    end

  end

  def destroy
    authorize Choice, :destroy?
    current_user.choices.destroy_all
    redirect_to root_path
  end

end
