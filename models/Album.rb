require('pg')

class  Album

attr_accessor  :id, :title, :genre, :artist_id, 

def initialize(options)

  @id = options['id'].to_i
  @title = options['title']
  @genre = options['genre']
  @artist_id = options['artist_id'].to_i

end 


def save()

  db = PG.connect({ dbname: 'funkr', host: 'localhost'})

  sql = "INSERT INTO album ( title, genre, artist_id) VALUES ('#{@title}', #{@genre}, #{artist_id}) returning *;"

  @id = db.exec(sql).first["id"].to_i
  db.close

end 

def self.all()

  db = PG.connect({ dbname: 'funkr', host: 'localhost'})

  sql = "SELECT * FROM album;"
  albums = db.exec(sql)
  db.close
  return albums.map { |album| Album.new(album) }

end

def self.delete_all()
  db = PG.connect({ dbname: 'funkr', host: 'localhost'})
  sql = "DELETE FROM album;"

  db.exec(sql)
  db.close
end

def delete()
  db = PG.connect({ dbname: 'funkr', host: 'localhost'})
  sql = "DELETE FROM album WHERE id = #{@id};"

  db.exec(sql)
  db.close
end

def update()
  db = PG.connect({ dbname: 'funkr', host: 'localhost'})
  sql = "UPDATE album SET ( title, genre, artist_id) VALUES ('#{@title}', #{@genre}, #{artist_id}) WHERE id = #{@id};" 
  
  db.exec(sql)
  db.close

  end 

  def artist()
    sql = "SELECT * FROM artist WHERE ID = #{@artist_id}"
    artist = SqlRunner.run( sql).first
    result = Artist.new( artist)
    return result
end

end 

