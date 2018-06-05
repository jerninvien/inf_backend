class API::V1::InviteCodesController < ApplicationController

  def index
    render json: { api_v1: 'hello LabsController' }
  end

  def create
    puts "params are #{params}"

    lab = Lab.find(params[:lab_id])
    user = User.find(params[:user_id])

    if lab === user.lab
      # invite_code = lab.invite_code.build({lab: lab, user: user})
      invite_code = InviteCode.new({lab: lab, user: user})

      if invite_code.save
        puts "it saved!"
        puts invite_code
        render json: invite_code
      else
        puts "it did not save "
        puts invite_code
        puts invite_code.errors.messages
      end
    else
      render json: { status: 403, error: "User does not belong to this lab" }
    end


  end

  def show

  end

  def update

  end

  def destroy

  end

  private

  def lab_params
      # params.require(:data).require(:attributes).permit(:name, :institute)
      params.require(:invite_code).permit(:lab_id, :user_id)
    end
end
