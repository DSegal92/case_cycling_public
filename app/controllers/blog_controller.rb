class BlogController < ApplicationController
	def index
    blogs = Blog.find(:all, :order => "id DESC").select { |b| b.internal == false}
    @blogs = Kaminari.paginate_array(blogs).page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end

	def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog }
    end
  end

end
