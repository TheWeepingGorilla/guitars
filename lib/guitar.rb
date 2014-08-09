class Guitar
  attr_accessor :brand_id, :body_id, :id

  def initialize attributes
    @brand_id = attributes[:brand_id]
    @body_id = attributes[:body_id]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO guitars (brand_id, body_id) VALUES (#{@brand_id}, #{@body_id}) RETURNING id;").first
    @id = results['id'].to_i
  end

  def self.all
    guitars = []
    results = DB.exec("SELECT * FROM guitars;")
    results.each do |result|
      guitars << Guitar.new({:id => result['id'].to_i,
                             :brand_id => result['brand_id'].to_i,
                             :body_id => result['body_id'].to_i})
    end
    guitars
  end

  def ==(another_guitar)
    self.brand_id == another_guitar.brand_id &&
    self.body_id == another_guitar.body_id
  end

  def delete
    DB.exec("DELETE FROM guitars where id = '#{@id}';")
  end

end
