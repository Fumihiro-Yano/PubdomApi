module Admin::ApiKeyHelper

private
  def check_api_key
    if request.headers['api-key'] == "test_key"
      return true
    else
      render json: {message: "api-key error"}.to_json, status:400
    end
  end
  
end