class Product < ApplicationRecord

  def self.to_csv
    attributes = %w{id name price material category color}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |product|
        csv << attributes.map{ |attr| product.send(attr) }
      end
    end
  end    


end
