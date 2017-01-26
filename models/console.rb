
require('pry-byebug')
require_relative('./Artists')
require_relative('./Album')

artist1 = Artist.new({'name' =>'LCD Soundsystem'})
artist2 = Artist.new({'name' =>'Roy Ayers'})
artist3 = Artist.new({'name' =>'Gotan Project'})

artist1.save
artist2.save
artist3.save

album1 = Album.new({'title' => 'Sound of Silver', 'genre' => 'dance', 'artist_id' => artist1.id})

album2 = Album.new({'title' => 'Everybody Loves the Sunshine', 'genre' => 'soul' , 'artist_id' => artist2.id})

album3 = Album.new({'title' => 'Club Secreto', 'genre' => 'electronica' , 'artist_id' => artist3.id})

album1.save
album2.save
album3.save

  binding.pry

  nil