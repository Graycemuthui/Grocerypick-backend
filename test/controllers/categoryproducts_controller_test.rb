require "test_helper"

class CategoryproductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoryproduct = categoryproducts(:one)
  end

  test "should get index" do
    get categoryproducts_url, as: :json
    assert_response :success
  end

  test "should create categoryproduct" do
    assert_difference("Categoryproduct.count") do
      post categoryproducts_url, params: { categoryproduct: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show categoryproduct" do
    get categoryproduct_url(@categoryproduct), as: :json
    assert_response :success
  end

  test "should update categoryproduct" do
    patch categoryproduct_url(@categoryproduct), params: { categoryproduct: {  } }, as: :json
    assert_response :success
  end

  test "should destroy categoryproduct" do
    assert_difference("Categoryproduct.count", -1) do
      delete categoryproduct_url(@categoryproduct), as: :json
    end

    assert_response :no_content
  end
end
