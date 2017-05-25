require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url, as: :json
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { correctanswer: @question.correctanswer, name: @question.name, option1: @question.option1, option2: @question.option2, option3: @question.option3, option4: @question.option4, score: @question.score, test_id: @question.test_id, user_id: @question.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show question" do
    get question_url(@question), as: :json
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: { correctanswer: @question.correctanswer, name: @question.name, option1: @question.option1, option2: @question.option2, option3: @question.option3, option4: @question.option4, score: @question.score, test_id: @question.test_id, user_id: @question.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question), as: :json
    end

    assert_response 204
  end
end
