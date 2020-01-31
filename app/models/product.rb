class Product < ApplicationRecord

  # def self.to_csv(attributes = column_names, options = {})
  #   CSV.generate(options) do |csv|
  #     csv.add_row attributes
  #     all.each do |product|
  #       values = product.attributes.slice(*attributes).values
  #       csv.add_row values
  #     end
  #   end
  # end

  def self.to_csv
    attributes = %w{id name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |product|
        csv << attributes.map{ |attr| product.send(attr) }
      end
    end
  end    


end
