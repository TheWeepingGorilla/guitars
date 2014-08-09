class Brand
  attr_accessor :brand,:id

  def initialize attributes
    @brand = attributes[:brand]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO brands (brand) VALUES ('#{@brand}') RETURNING id;").first
    @id = results['id'].to_i
  end

  def self.all
    brands = []
    results = DB.exec("SELECT * FROM brands;")
    results.each do |result|
      brands << Brand.new({:id => result['id'].to_i, :brand => result['brand']})
    end
    brands
  end

  def ==(another_brand)
    self.brand == another_brand.brand
  end

  def delete
    DB.exec("DELETE FROM brands where id = '#{@id}';")
  end
end
