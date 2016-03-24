#YOUR CODE GOES HERE
require 'pg'
require 'csv'

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

ingredients_csv = CSV.read("ingredients.csv")

db_connection do |conn|
  ingredients_csv.each do |row|
    conn.exec("INSERT INTO ingredient_table(ingredient) VALUES ('#{row[1]}')")
  end
end

ingredients = db_connection { |conn| conn.exec("SELECT * FROM ingredient_table") }.to_a

ingredients.each do |row|
  puts "#{row["id"]}. #{row["ingredient"]}"
end
