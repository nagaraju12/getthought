class ArticlesController < ApplicationController

   before_filter :authenticate_user!, except: [:index]
   
	def index
         @articles = Article.search(params[:search]).paginate(:page => params[:page], :per_page => 4).order("created_at DESC ")
    end

	def new
		@article= Article.new
			  1.times{@article.images.build}
	end

	def create
		@article= Article.new(article_params)
		#UserMailer.welcome_email(@article).deliver
		    1.times{@article.images.build} if @article.images.blank?
		if @article.save
			redirect_to @article
		else
			render "new"
		end
	end

	def show
		@article= Article.find(params[:id])
	end

	def edit
		@article= Article.find(params[:id])
	end

	def update
		@article= Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render "edit"
		end
	end

	def destroy
		@article= Article.find(params[:id])
		@article.destroy
		redirect_to @article
	end

	def article_params
		params.require(:article).permit!
	end

end
