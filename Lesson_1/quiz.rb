ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  string = "string"
  collection.map { |x| yield(string) }
end

xyz(ARRAY) do |str|
  puts str
end