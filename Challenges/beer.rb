class BeerSong
  def self.verse(num)
    song_verse = "#{bottles(num)} of beer on the wall, #{bottles(num, true)} of beer.\n"

    if num >= 1
      song_verse << "Take #{one_or_it(num)} down and pass it around, #{bottles(num - 1, true)} of beer on the wall.\n"
    else
      song_verse << "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
    song_verse
  end

  def self.bottles(num, lowercase = false)
    if num == 1
      "#{num} bottle"
    elsif num == 0 && lowercase
      "no more bottles"
    elsif num == 0
      "No more bottles"
    else
      "#{num} bottles"
    end
  end

  def self.one_or_it(num)
    num == 1 ? "it" : "one"
  end

  def self.verses(start, stop)
    song_verses = ""
    while start >= stop
      song_verses << verse(start)
      song_verses << "\n" if start != stop
      start -= 1
    end
    song_verses
  end

  def self.lyrics
    verses(99, 0)
  end
end
