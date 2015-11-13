class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @store = Store.find(params[:store_id])
    @comment = Comment.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.store_id = @store.id

    if @comment.save
      redirect_to store_path(@store)
    end
  end
end
