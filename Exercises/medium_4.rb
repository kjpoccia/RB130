def separate(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)

separate(birds) { |_, _, *raptors| puts raptors}