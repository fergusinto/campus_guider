class StoresController < ApplicationController
  before_action :find_store, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
    @stores = Store.all.order("created_at DESC")
  end

  def show
    $address = "#{@store.zipcode} #{@store.city}#{@store.distric}#{@store.address}"
    @comments = Comment.where(store_id: @store)
  end

  def new
    @store = current_user.stores.build
  end

  def create
    @store = current_user.stores.build(store_params)
    if @store.save
      redirect_to @store
    else
      render 'new'
    end
  end

  def edit
    #code
  end

  def update
    #code
    if @store.update(store_params)
      redirect_to @store
    else
      render 'edit'
    end
  end

  def destroy
    @store.destory
    redirect_to stores_path
  end

  def upvote
    # @store.upvote_by current_user
    @store.vote_by :voter => current_user, :vote => 'like'
    redirect_to :back
  end

  def downvote
    @store.downvote_by current_user
    redirect_to :back
  end
  private
    def find_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name, :longitude, :latitude, :zipcode, :city, :distric, :address, :avatar)
    end
end
