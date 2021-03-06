require 'test_helper'

class SongProviderTest < Test::Unit::TestCase

  def setup
    @songkick_radiohead_id = '253846'
    @invalid_artist_id = '1678900767865788'
    VCR.insert_cassette name
  end

  def teardown
   VCR.eject_cassette
  end

  test 'can get rdio artist id with radiohead songkick id' do
    assert_equal 'r91318', SongProvider.get_rdio_artist_id(@songkick_radiohead_id)
  end

  test 'cannot get rdio artist id with invalid songkick id' do
    assert_equal "Artist not understood by Rdio", SongProvider.get_rdio_artist_id(@invalid_artist_id)
  end

  test 'get the first radiohead song from rdio' do
    assert_equal 'https://rd.io/e/QitdJsU/', SongProvider.get_track_embed_url(@songkick_radiohead_id)
  end
end
