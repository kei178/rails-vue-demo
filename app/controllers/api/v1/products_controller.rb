module Api
  module V1
    class ProductsController < Api::V1::ApplicationController
      def index
        render json: {
          products: [
            { id: 1, name: 'Demo Product 1' },
            { id: 2, name: 'Demo Product 2' },
            { id: 3, name: 'Demo Product 3' }
          ]
        }.to_json
      end
    end
  end
end
