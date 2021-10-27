class HomeController < ApplicationController
    def index
        
    end
    
    def product
        @product = Product.find(params[:id])
    end

    def shopping
        @new_products = Product.where('thumbnail like "%drive%"').where(state: 0).limit(4).each_slice(2).to_a
        @sale_products = Product.where('thumbnail like "%drive%"').where('discount > 0').order(:created_at).limit(4).each_slice(2).to_a
        @just_for_you_products = Product.where('thumbnail like "%drive%"').limit(4)
        @best_buy_product = Product.where('thumbnail like "%drive%"').limit(3)

        @make_data = Product.all.pluck(:vehicle_make).uniq
        @color_data = Product.all.pluck(:color).uniq
    end

    def brand
        @product = Product.where(vehicle_make: params[:brand]).first

        @new_products = Product.where('vehicle_make = ? ',params[:brand])
        @sale_products = Product.where('vehicle_make = ? ',params[:brand]).order(:created_at)

        @make_data = Product.pluck(:vehicle_make).uniq
        @color_data = Product.pluck(:color).uniq
    end

    def search
        @search = true
        @products = Product.all
        @products = @products.where("name like '%#{params[:keyword]}%' OR vehicle_make like '%#{params[:keyword]}%'") if params[:keyword].present?

        @products = @products.where(color: params[:color]) if params[:color].present?
        @products = @products.where(vehicle_make: params[:vehicle_make]) if params[:vehicle_make].present?
        @products = @products.where('price > ? and price < ?', params[:range].split(', ')[0], params[:range].split(', ')[1]) if params[:range].present?
        @products = @products.order("#{params[:order]}") if params[:order].present?

        @make_data = Product.pluck(:vehicle_make).uniq
        @color_data = Product.pluck(:color).uniq
    end

    def auction
        @auctions = Auction.includes(:product).where.not(status: :closed)

        @make_data = Product.pluck(:vehicle_make).uniq
        @color_data = Product.pluck(:color).uniq
    end

    def store
        if params[:brand].present?
            @check = false
            @product = Product.where(vehicle_make: params[:brand]).first
            @new_products = Product.where('vehicle_make = ? ',params[:brand])
            @sale_products = Product.where('vehicle_make = ? ',params[:brand]).order(:created_at)
        else
            @store = true
            @check = true
            @new_products = Product.where('thumbnail like "%drive%"').where(state: 0)
            @sale_products = Product.where('thumbnail like "%drive%"').where('discount > 0').order(:created_at)
        end

        @make_data = Product.pluck(:vehicle_make).uniq
        @color_data = Product.pluck(:color).uniq
    end

    def growth

    end

    def auction_item
        @product = Product.find(params[:id])
    end


end