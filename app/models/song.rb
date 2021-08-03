class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    artist.name if artist
    # if the artist's name exists, then deliver it
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
    # order is important because otherwise nil is being set to artist
  end
end
