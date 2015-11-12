class StoresController < ApplicationController
  def index
    #code
    @stores = Store.all
  end
end
