# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API v1 Questions', type: :request do
  describe 'GET /api/v1/questions' do
    before do
      user = User.create(email: "test@example.com", password: "test")
      Question.create!(title: 'Question1', description: 'Description1', tags: 'tag1,tag2', user: user)
      Question.create!(title: 'Question2', description: 'Description2', tags: 'tag2,tag3', user: user)
    end

    context 'without search params' do
      before { get '/api/v1/questions' }

      it 'respond with success' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns all questions' do
        expect(JSON.parse(response.body)['data'].size).to eq(2)
      end
    end

    context 'when search param present' do
      let(:params) { { filter: 'tag3' } }

      before { get '/api/v1/questions', params: params }

      it 'respond with success' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns 1 question only' do
        expect(JSON.parse(response.body)['data'].size).to eq(1)
      end
    end
  end
end
