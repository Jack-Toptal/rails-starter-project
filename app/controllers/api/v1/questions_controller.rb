module Api
  module V1
    class QuestionsController < Api::V1::ApiController
      before_action :doorkeeper_authorize!, except: %i[index viewed]

      def index
        questions = Question.all
        questions = questions.where('lower(tags) LIKE ?', "%#{params[:filter].downcase}%") if params[:filter].present?
        questions = questions.order(created_at: :desc).page(params[:page]).per(per_page)

        render json: questions, meta: { totalPages: questions.total_pages }
      end

      def show
        question = Question.friendly.find(params[:id])

        render json: question, include: %i[user answers]
      end

      def create
        @question = Question.new(question_params)
        @question.user = current_user
        if @question.save
          render json: @question
        else
          render json: @question, status: 422, serializer: ActiveModel::Serializer::ErrorSerializer
        end
      end

      def update
        unless question.editable_by?(current_user)
          render json: { 'error': 'You are not authorized to update the question' }, status: 422
          return
        end

        if question.update(question_params)
          render json: question
        else
          render json: question, status: 422, serializer: ActiveModel::Serializer::ErrorSerializer
        end
      end

      def viewed
        Question.update_counters(params[:id], views: 1)
        head 204
      end

      def destroy
        if question.deletable_by?(current_user) && question.destroy
          head 204
        else
          head 422
        end
      end

      private

      def question
        @question ||= Question.find(params[:id])
      end

      def question_params
        params.require(:data).require(:attributes).permit(:title, :description, :tags)
      end
    end
  end
end
