class UserController < ApplicationController
  skip_before_action :authenticate_user

  def authenticate
    command = AuthenticateUser.call(
      params[:email], params[:password]
    )

    if command.success?
      render json: { auth_token: command.result[0], user: command.result[1] }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def address
    address = Address.new(address_params)

    render json: {
      success: address.save, address: address, errors: address.errors.full_messages.join(", ")
    }
  end

  def loan
    command = NewLoan.call(
      user_id: params[:user_id],
      loan_type: params[:loan_type],
      loan_params: loan_params
    )

    render json: {
      success: command&.result[0], loan: command&.result[1], errors: command.errors
    }
  end

private
  def address_params
    params.permit(:name, :user_id)
  end

  def loan_params
    params.permit(:entry, :user_id)
  end
end
