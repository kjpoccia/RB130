
class TextAnalyzer
  def process
    file = "sample_text.txt"
    file_data = File.read(file)
    yield(file_data)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |data| puts "#{data.split("\n\n").count} paragraphs" }
analyzer.process { |data| puts "#{data.split("\n").count} lines" }
analyzer.process { |data| puts "#{data.split.count} words" }
