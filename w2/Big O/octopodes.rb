FISH = [
  'fish',
  'fiiish',
  'fiiiiish',
  'fiiiish',
  'fffish',
  'ffiiiiisshh',
  'fsh',
  'fiiiissshhhhhh']

def sluggish_octopus
  sorted = false
  fish = FISH.dup
  until sorted
    sorted = true
    i = 0
    until i == fish.length - 2
      j = i + 1
      if fish[i] < fish[j]
        fish[i], fish[j] = fish[j], fish[i]
        sorted = false
      end
      i += 1
    end
  end
  fish.first
end

def dominant_octo(array)
  merge_octos(array)[0]
end

def merge_octos(array)
  return array if array.length <= 1
  middle = array.length / 2

  left_octo = merge_octos(array[0...middle])
  right_octo = merge_octos(array[middle..-1])
  sort_octos(left, right).first
end

def sort_octos(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left[0] > right[0]
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
end

def clever_octopus
  longest_fish = ""
  FISH.each do |fish|
    if fish.length > longest_fish.length
      longest_fish = fish
    end
  end
  longest_fish
end

TILES_ARRAY = [
  :up,
  :right_up,
  :right,
  :right_down,
  :down,
  :left_down,
  :left,
  :left_up
]

def slow_dance(tile)
  i = 0
  until TILES_ARRAY[i] == tile
    i += 1
  end
  return i
end

def constant_dance(tile)
  tiles = {
    up: 0,
    right_up: 1,
    right: 2,
    right_down: 3,
    down: 4,
    left_down: 5
    left: 6,
    left_up: 7,
  }

  return tiles[tile]
end
