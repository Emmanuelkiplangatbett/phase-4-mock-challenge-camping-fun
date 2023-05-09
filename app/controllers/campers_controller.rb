class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper =Camper.find(params[:id])
        render json: camper, serializer: CamperActivitySerializer, status: :ok
    end
    def create
        camper = Camper.create!(camper_params)
        render json: camper_params, status: :created
    end

    private

    def record_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :uprocessable_entity
    end

    def camper_params
        params.require(:camper).permit(:name, :age)
    end

end
