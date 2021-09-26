require 'rubyXL'

module Import

  class Excel

    include Interactor

    def call
      workbook = RubyXL::Parser.parse("storage/VEHICLES.xlsx")
      users = list_users
      workbook.worksheets.size.times do |sh|
        worksheet = workbook.worksheets[sh]
        worksheet.each_with_index do |row, idx|
          next if idx.zero?
          break if idx > 30 || row[0].value.blank? || row[0].value.nil?

          discount = rand(0...90)
          discount = 0 if discount < 50
          state = rand(0...4)
          state = 0 if state >=4
          product = Product.create({vehicle_make:row[0].nil? ? '' : row[0].value,
                                   model: row[1].nil? ? '' : row[1].value,
                                   name: row[2].nil? ? '' : row[2].value,
                                   vehicle_code: row[3].nil? ? '' : row[3].value,
                                   color: row[4].nil? ? '' : row[4].value,
                                   transmission: row[5].nil? ? '' : row[5].value,
                                   fuel_type: row[6].nil? ? '' : row[6].value,
                                   engine_type: row[7].nil? ? '' : row[7].value,
                                   engine_capacity: row[8].nil? ? '' : row[8].value,
                                   power: row[9].nil? ? '' : row[9].value,
                                   fuel_consumption: row[10].nil? ? '' : row[10].value,
                                   manufacturing_year: row[11].nil? ? '' : row[11].value,
                                    price: price_product(row[12].nil? ? '' : row[12].value.to_s),
                                   discount: discount,
                                   state: state,
                                   features: row[14].nil? ? '' : row[14].value,
                                   description: row[15].nil? ? '' : row[15].value,
                                   accessories: row[16].nil? ? '' : row[16].value,
                                    thumbnail: row[17].nil? ? '' : row[17].value,
                                  logo: row[18].nil? ? '' : row[18].value,
                                  owner: User.find_by(users[rand(0...users.count)])
                                  })
          product.save!

          # generate auction
          started_at = rand(1...91).days.from_now
          if rand(0...2).positive?
            Auction.create!(started_at: started_at, product: product, status: :opening)
          end
          #end
        end
      end
    end

    private

    def list_users
      [
        {
          email: 'obama@usa.com',
          name: 'Obama'
        },
        {
          email: 'trumb@usa.com',
          name: 'Trumb'
        },
        {
          email: 'michael@sg.com',
          name: 'Michael'
        },
        {
          email: 'damian@sg.com',
          name: 'Damian'
        }
      ]
    end

    def generate_users
      User.create(list_users)
    end

    def generate_auction

    end

    def price_product(str)
      str.gsub('$', '').gsub(',','').to_d
    end

  end

end
