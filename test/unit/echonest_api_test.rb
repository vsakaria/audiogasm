require 'test_helper'


class EchonestApiTest < ActiveSupport::TestCase

  test 'can get array of artist genres from songkick artist_id' do
    array = EchonestApi.get_artist_genres_by_id("songkick:artist:253846")
    assert_equal(["rock", "alternative rock", "electronic", "alternative", "pop", "art rock", "90s", "electronica", "experimental", "modern rock", "post-punk", "jazz", "british pop", "experimental rock", "ambient", "british rock", "alternative pop rock", "indietronica", "grunge", "progressive rock", "80s", "indie", "soundtrack"], array)
  end

  # test 'can get array of artist genres from artist_name' do
  #   array = EchonestApi.get_artist_genres_by_name("radiohead")
  #   assert_equal(["rock", "alternative rock", "electronic", "alternative", "pop", "art rock", "90s", "electronica", "experimental", "modern rock", "post-punk", "jazz", "british pop", "experimental rock", "ambient", "british rock", "alternative pop rock", "indietronica", "grunge", "progressive rock", "80s", "indie", "soundtrack"], array)
  # end

  test 'can get weighted genres for given artist' do
    array = EchonestApi.get_artist_genres_by_weight("songkick:artist:253846", 0.8)
    assert_equal(["rock"], array)
  end

  test 'artist is of a given genre' do
    assert_equal true, EchonestApi.check_artist_is_of_genre("songkick:artist:253846", 'rock')
  end
  
end