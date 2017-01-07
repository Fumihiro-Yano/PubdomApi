class Admin::ArticlesController < Admin::Base
  #before_action :check_api_key  

  def create
  	@article = Article.new(article_params)
  	if @article.save
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update

  end

  private
    def article_params
      params.require(:article).permit(Article::REGISTRABLE_ATTRIBUTES)
    end
end
