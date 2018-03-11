module Ecm::Sliders::Backend
  class ItemsController < Itsf::Backend::Resource::BaseController
    include ResourcesController::ActsAsListConcern
    include ResourcesController::Sorting

    def self.resource_class
      Ecm::Sliders::Item
    end

    private

    def load_collection_scope
      super.eager_load(:slider)
    end

    def permitted_params
      params.require(:item).permit(:slider_id, :url, :body, :markup_language, :image)
    end
  end
end
