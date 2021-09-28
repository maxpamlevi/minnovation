class HomeController < ApplicationController
    def index
        
    end
    
    def product
        
    end

    def shopping
        @new_products = Product.where('thumbnail like "%drive%"').where(state: 0).limit(4).each_slice(2).to_a
        @sale_products = Product.where('thumbnail like "%drive%"').where('discount > 0').order(:created_at).limit(4).each_slice(2).to_a
        @just_for_you_products = Product.where('thumbnail like "%drive%"').order('RAND()').limit(2)
        @best_buy_product = Product.where('thumbnail like "%drive%"').order('RAND()').limit(3)

        @make_data = Product.all.pluck(:vehicle_make).uniq
        @color_data = Product.all.pluck(:color).uniq
    end

    def brand
        @products = Product.where('thumbnail like "%drive%"').where("UPPER(vehicle_make) LIKE '%#{params[:brand].upcase.squish}%' ")
    end

    def search
        @products = Product.all
        @products = @products.where("name like '%#{params[:keyword]}%'") if params[:keyword].present?
    end

    def auction
        @auctions = Auction.includes(:product).where.not(status: :closed)

        @make_data = Product.pluck(:vehicle_make).uniq
        @color_data = Product.pluck(:color).uniq
    end

    def store
        @new_products = Product.where('thumbnail like "%drive%"').where(state: 0)
        @sale_products = Product.where('thumbnail like "%drive%"').where('discount > 0').order(:created_at)
    end
end