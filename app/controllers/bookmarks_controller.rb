class BookmarksController < ApplicationController
before_action :current_user
before_action :authenticate_user!, except: [:show, :new]

	def new
		@bookmark = Bookmark.new
	end

	def create
		bookmark = Bookmark.new(url: params[:bookmark][:url], user_id: current_user.id)

		if bookmark.save
			redirect_to bookmarks_path
		else
			render 'new'
		end

	end

	def show
		@bookmark = Bookmark.find(params[:id])
	end

	def index
		@bookmarks = current_user.bookmarks
	end

end
