require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initialize  ( options )

    @id = options['id'].to_i if options ['id']
    @name = options['id']

   

     def save()

       sql = "INSERT INTO artist (name) VALUES ('#{name}') returning *;"
       result = SqlRunner.run(sql) 
       @id = result.first["id"].to_i
     end

     def album()
       sql = "SELECT * FROM album WHERE artist_id = #{@id};"
       albums = SqlRunner.run( sql )
       result = albums.map { |album| Album.new ( album)}
       return result
     end 
     end