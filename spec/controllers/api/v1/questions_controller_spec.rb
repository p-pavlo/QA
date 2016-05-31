require 'rails_helper'

RSpec.describe Api::V1::QuestionsController, type: :controller do

  let(:question) { FactoryGirl.create(:question) }
  let(:question_attributes) { FactoryGirl.attributes_for(:question) }
  let(:invalid_attributes) { {question: ' '} }

  describe "GET 'index' " do
    before (:each) do
      question
    end

    it "returns a successful 200 response" do
      get :index, format: :json

      expect(response.status).to eq(200)
    end

    it "returns all the questions" do
      FactoryGirl.create_list(:question, 2)
      get :index

      expect(JSON.parse(response.body).count).to eq(3)
    end
  end

  describe "GET 'show action' " do
    context "with valid params" do
      it "shows question from db" do
        get :show, id: question.id, format: :json

        expect(response.status).to eq(200)
      end

      it "returns data of a single question" do
        get :show, id: question.id, format: :json
        parsed_response = JSON.parse(response.body)

        expect(parsed_response['question']).to_not be_nil
      end
    end

    context "with invalid params" do
      it "renders 404 status if the question is not found" do
        get :show, id: 0, format: :json

        expect(response.status).to eq(404)
      end
    end
  end

  describe "POST 'create action' " do
    context "with valid params" do
      it "creates a new question" do
        expect { post :create, question: question_attributes, format: :json }.to change(Question, :count).by(1)
      end
    end

    context "with invalid params" do
      it "does not create a question " do
        post :create, question: invalid_attributes, format: :json

        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH 'update action' " do
    context "with valid params" do
      it "successfuly updates your question" do
        patch :update, id: question.id, question: question_attributes, format: :json

        expect(response.status).to eq(200)
      end
    end

    context "with invalid params" do
      it "does not update the question and renders an error" do
        patch :update, id: question.id, question: invalid_attributes, format: :json

        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE 'destroy action' " do
    before (:each) do
      question
    end

    it "deletes the question" do
      expect { delete :destroy, id: question.id }.to change(Question, :count).by(-1)
    end

    it "responds with status 200" do
      delete :destroy, id: question.id, format: :json

      expect(response.status).to eq(200)
    end

    it "responds with status  404" do
      delete :destroy, id: 0, format: :json

      expect(response.status).to eq(404)
    end
  end

end
