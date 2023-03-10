require 'csv'

class Song < ApplicationRecord
  include Searchable

  has_one_attached :image

  def self.import_csv!
    filepath = "/home/taskcraft/practise/tcc_ceds_music.csv"
    res = CSV.parse(File.read(filepath), headers: true)
    res.each_with_index do |s, ind|
      Song.create!(
        artist: s["artist_name"],
        title: s["track_name"],
        genre: s["genre"],
        lyrics: s["lyrics"]
      )
    end
  end
end
