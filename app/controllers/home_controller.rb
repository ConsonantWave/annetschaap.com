class HomeController < ApplicationController
  def index
    @admin_session = AdminSession.new
    categories = Category.all
    
    @francine = get_category_from_all(categories, "Francine Oomen")
    @contact = get_category_from_all(categories, "Contact")
    @sketchbook = get_category_from_all(categories, "Sketchbook")
    @about = get_category_from_all(categories, "About Annet")
    @portfolio = get_category_from_all(categories, "Portfolio")
    @mom = get_category_from_all(categories, "Mother's Journal")
    @retro = get_category_from_all(categories, "Retrospective")
    @jacques = get_category_from_all(categories, "Jacques Vriens")
  end
  
  def get_category_from_all(categories, name)
    categories.select {
      |cat| cat.name_en == name
    }[0]
  end
end
