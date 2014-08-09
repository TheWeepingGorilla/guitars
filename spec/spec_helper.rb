require 'rspec'
require 'pg'
require 'pry'
require 'guitar'
require 'brand'
require 'body'


DB = PG.connect({:dbname => 'guitars_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM guitars *;")
    DB.exec("DELETE FROM brands *;")
    DB.exec("DELETE FROM bodies *;")
  end
end
