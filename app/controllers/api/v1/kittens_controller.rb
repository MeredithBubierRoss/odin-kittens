class Api::V1::KittensController < ActionController::API
  def index
    render json: Kitten.all
  end
end
