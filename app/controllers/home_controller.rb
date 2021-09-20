class HomeController < ApplicationController
    def index
        
    end
    
    def product
        
    end

    def shopping
        @new_products = Product.where('thumbnail like "%drive%"').where('discount > 0').limit(4).each_slice(2).to_a
        @sale_products = Product.where('thumbnail like "%drive%"').where('discount > 0').order(:created_at).limit(4).each_slice(2).to_a
        @just_for_you_products = Product.where('thumbnail like "%drive%"').order('RAND()').limit(2)
        @best_buy_product = Product.where('thumbnail like "%drive%"').order('RAND()').limit(3)
    end

    def brand
        @products = Product.where('thumbnail like "%drive%"').where("UPPER(vehicle_make) LIKE '%#{params[:brand].upcase.squish}%' ")
    end

    def search

    end

    def auction
        @products = Product.where('thumbnail like "%drive%"')
    end

end