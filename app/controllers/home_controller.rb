class HomeController < ApplicationController
    def index
        
    end
    
    def product
        
    end

    def shopping
        @new_products = Product.where('thumbnail like "%drive%"').where('discount = 0').limit(2)
        @sale_products = Product.where('thumbnail like "%drive%"').where('discount > 0').order(:created_at).limit(2)
        @just_for_you_products = Product.where('thumbnail like "%drive%"').order('RAND()').limit(2)
        @best_buy_product = Product.where('thumbnail like "%drive%"').order('RAND()').first
    end
    
end