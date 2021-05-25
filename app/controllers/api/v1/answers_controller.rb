module Api
  module V1
    class AnswersController < Api::V1::ApiController
      before_action :doorkeeper_authorize!

      def create
        @answer = question.answers.new(answer_params)
        @answer.user = current_user
        if @answer.save
          render json: @answer
        else
          render json: @answer, status: 422, serializer: ActiveModel::Serializer::ErrorSerializer
        end
      end

      private

      def question
        @question ||= Question.find(params[:question_id])
      end

      def answer_params
        params.require(:data).require(:attributes).permit(:body, :description, :tags)
      end
    end
  end
end
