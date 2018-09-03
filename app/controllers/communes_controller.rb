class CommunesController < ApplicationController
  before_action :set_commune, only: [:show, :update]

  def index
    @communes = Commune.all
    respond_to do |format|
      format.html {render json: {error: "invalid format"}, status: :not_acceptable}
      format.json {render :json => {data: @communes.as_json}, status: :ok} # return for polling
    end
  end

  def create
    render json: {error: "requires attributes to update"}, status: :forbidden and return unless params[:commune].present?
    @commune = Commune.new(commune_params)

    if @commune.save
      render json: @commune, status: :created
    else
      render json: @commune.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    if @commune.present?
      render json: @commune, status: :ok
    else
      render json: {error: "not found"}, status: :not_found
    end
  end

  def update
    render json: {error: "not found"}, status: :not_found and return unless @commune.present?
    render json: {error: "requires attributes to update"}, status: :bad_request and return unless params[:commune].present?
    if @commune.update(commune_params)
      render json: @commune, status: :no_content
    else
      render json: @commune.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def set_commune
    @commune = Commune.find_by(code_insee: params[:id])
  end

  def commune_params
    params.required(:commune).permit( :name, :code_insee)
  end
end
