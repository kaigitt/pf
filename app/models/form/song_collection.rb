class Form::SongCollection < Form::Base
  FORM_COUNT = 5 #ここで、作成したい登録フォームの数を指定
  attr_accessor :songs

  def initialize(attributes = {})
    super attributes
    self.songs = FORM_COUNT.times.map { song.new() } unless self.songs.present?
  end

  def songs_attributes=(attributes)
    self.songs = attributes.map { |_, v| song.new(v) }
  end

  def save
    song.transaction do
      self.songs.map do |song|
          song.save
      end
    end
      return true
    rescue => e
      return false
  end
end