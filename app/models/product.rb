class Product < ApplicationRecord
    def link_img
        puts thumbnail
        puts id
        id = thumbnail.split("file/d/")[1].split("/")[0]
        "https://drive.google.com/uc?export=view&id=#{id}"
    end
end
