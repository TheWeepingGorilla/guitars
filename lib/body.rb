class Body
  attr_accessor :body,:id

  def initialize attributes
    @body = attributes[:body]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO bodies (body) VALUES ('#{@body}') RETURNING id;").first
    @id = results['id'].to_i
  end

  def self.all
    bodies = []
    results = DB.exec("SELECT * FROM bodies;")
    results.each do |result|
      bodies << Body.new({:id => result['id'].to_i, :body => result['body']})
    end
    bodies
  end

  def ==(another_body)
    self.body == another_body.body
  end

  def delete
    DB.exec("DELETE FROM bodies where id = '#{@id}';")
  end
end
