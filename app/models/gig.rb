class Gig

  attr_reader :artist_id, :location, :date, :venue, :ticket_link

  def initialize(artist_id, location, date, venue, ticket_link)
    @artist_id = artist_id
    @location = location
    @date = date
    @venue = venue
    @ticket_link = ticket_link
  end

  def song
    artist = @artist_id.shuffle.first
    SongProvider.get_track_embed_url(artist)
  end

  def self.find(location, from, to, genre)
    gigs = GigInfoProvider.new(location, from, to).get_upcoming_gigs
    get_first_valid_gig(gigs, genre)
  end

  def self.get_first_valid_gig(gigs, genre)
    gigs.detect {|gig| gig.check_gig_is_valid(genre) }
  end

  def check_gig_is_valid(genre)
    self.artist_id.any? {|artist| ArtistFilterInfoProvider.is_artist_valid?(artist, genre)}
  end
end
