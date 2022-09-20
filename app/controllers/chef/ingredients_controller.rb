class Chef::IngredientsController < Chef::BaseController
  def index
    @ingredients = @chef.ingr_used
  end
end