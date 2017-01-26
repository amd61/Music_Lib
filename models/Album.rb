require('pg')
require_relative('../db/SqlRunner')

class  Album

attr_accessor  :id, :title, :genre, :artist_id 

def initialize(options)

  @id = options['id'].to_i
  @title = options['title']
  @genre = options['genre']
  @artist_id = options['artist_id'].to_i
end 


def save()
  sql = "INSERT INTO albums ( title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', '#{artist_id}') returning *;"
  result = SqlRunner.run(sql)
  @id = result.first['id'].to_i
end 


def self.all()
  sql = "SELECT * FROM albums;"
  albums = SqlRunner.run( sql )
  return albums.map { |album| Album.new(album) }
end


def self.delete_all()
  sql = "DELETE FROM albums;"
  albums = SqlRunner.run( sql )
end

def delete()
  sql = "DELETE FROM albums WHERE id = #{@id};"
  albums = SqlRunner.run( sql )
end

def update()
  sql = "UPDATE albums SET ( title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', '#{artist_id}') WHERE id = #{@id};" 
  albums = SqlRunner.run( sql )
  end 
  

def albums()
  sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
  albums = SqlRunner.run( sql )
  return albums.map { |album| Album.new ( album)}
end 
end 

