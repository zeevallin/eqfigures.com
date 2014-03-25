class ChoicesController < ApplicationController

  def create
    @choice = Choice.new params.require(:character).permit(:a, :b, :x)
    @choice.user = current_user

    authorize @choice, :create?

    @choice.save
    redirect_to characters_path
  end

end
