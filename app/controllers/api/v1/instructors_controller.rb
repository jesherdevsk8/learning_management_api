module Api
  module V1
    class InstructorsController < ApplicationController
      before_action :authorize, except: [:login]
      before_action :set_instructor, only: %i[ show update destroy ]

      # GET /instructors
      def index
        @instructors = Instructor.all

        render json: @instructors
      end

      # GET /instructors/1
      def show
        render json: @instructor
      end

      # POST /instructors
      def create
        @instructor = Instructor.new(instructor_params)

        if @instructor.save
          token = encode_token({ instructor_id: @instructor.id })
          render json: { instructor: @instructor, token: token }, status: :created
        else
          render json: @instructor.errors, status: :unprocessable_entity
        end
      end

      # POST /instructor_login
      def login
        @instructor = Instructor.authenticate(instructor_params[:email], instructor_params[:password_digest])

        if @instructor
          token = encode_token({ instructor_id: @instructor.id })
          render json: { instructor: @instructor, token: token }, status: :created
        else
          render json: { error: 'Invalid instructor' }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /instructors/1
      def update
        if @instructor.update(instructor_params)
          render json: @instructor
        else
          render json: @instructor.errors, status: :unprocessable_entity
        end
      end

      # DELETE /instructors/1
      def destroy
        @instructor.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_instructor
          @instructor = Instructor.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def instructor_params
          params.require(:instructor).permit(
            :name,
            :email,
            :password_digest,
            :active,
            :status
          )
        end
    end
  end
end
