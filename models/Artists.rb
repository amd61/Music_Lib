require('pg')
require_relative('../db/SqlRunner')

class Artist

  attr_reader :id, :name

  def initialize  ( options )
    @id = options['id'].to_i if options ['id']
    @name = options['name']
  end


     def save()
       sql = "INSERT INTO artists (name) VALUES ('#{@name}') returning *;"
       result = SqlRunner.run(sql) 
       @id = result.first["id"].to_i
     end

     def self.all()
       sql = "SELECT * FROM artists;"
       artist = SqlRunner.run( sql )
       return artist.map { |artist| Artist.new(artist) }
     end


     def albums()
       sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
       albums = SqlRunner.run( sql )
       return albums.map { |album| Album.new ( album)}
     end 

       def artist()
         sql = "SELECT * FROM artists WHERE ID = '#{@artist_id}'"
         artist = SqlRunner.run( sql).first
         return Artist.new( artist)
      end 
      
     def update()
       sql = "UPDATE artists SET (name) VALUES ('#{@name}') WHERE id = #{@id};" 
       artists = SqlRunner.run( sql )
        end 

     def self.delete_all()
       sql = "DELETE FROM artists;"
       artists = SqlRunner.run( sql )
     end

     def delete()
       sql = "DELETE FROM artists WHERE id = #{@id};"
       artists = SqlRunner.run( sql )
     end

   

     
end