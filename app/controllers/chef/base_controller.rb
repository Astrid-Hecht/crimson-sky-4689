class Chef::BaseController < ApplicationController
  before_action :set_chef, only: [:index]

  private
  def set_chef
    @chef = Chef.find(params[:chef_id])
  end
end