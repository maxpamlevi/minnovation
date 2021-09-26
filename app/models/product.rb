class Product < ApplicationRecord

    belongs_to :owner, class_name: 'User'
    has_one :auction, dependent: :destroy

    def link_img
        id = thumbnail.split("file/d/")[1].split("/")[0]
        "https://drive.google.com/uc?export=view&id=#{id}"
    end
    def logo_img
        return '/assets/porsche.png' if logo.blank?

        id = logo.split("file/d/")[1].split("/")[0]
        "https://drive.google.com/uc?export=view&id=#{id}"
    end
    def state_color
        return '#00BE65' if state == 0
        return '#F6C358' if state == 1
        return '#DC8744' if state == 2

        '#ED1C24'
    end
end