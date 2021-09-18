require 'rubyXL'

module Import

  class Excel

    include Interactor

    def call
      workbook = RubyXL::Parser.parse("storage/VEHICLES.xlsx")
      workbook.worksheets.size.times do |sh|
        worksheet = workbook.worksheets[sh]
        worksheet.each_with_index do |row, idx|
          next if idx.zero?
          break if idx > 30 || row[0].value.blank? || row[0].value.nil?

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
                                   discount: 0,
                                   features: row[14].nil? ? '' : row[14].value,
                                   description: row[15].nil? ? '' : row[15].value,
                                   accessories: row[16].nil? ? '' : row[16].value,
                                    thumbnail: row[17].nil? ? '' : row[17].value})
          product.save!
        end
      end
    end

    private

    def price_product(str)
      str.gsub('$', '').gsub(',','').to_d
    end

  end

end
