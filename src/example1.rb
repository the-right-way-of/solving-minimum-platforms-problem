require 'time'

class TrainStoppage
  attr_accessor :start_time, :end_time, :links
  def initialize(start_time, end_time)
    @start_time = start_time.class == String ? Time.parse(start_time) : start_time
    @end_time = end_time.class == String ? Time.parse(end_time) : end_time
    @links = []
  end

  def add_link(stoppage)
    @links << stoppage
    stoppage.links << self
  end

  def overlaps?(stoppage)
    (@start_time >= stoppage.start_time && @start_time < stoppage.end_time) || (@end_time > stoppage.start_time && @end_time <= stoppage.end_time)
  end

  def to_s
    @start_time.strftime("%H:%M") + "-" + @end_time.strftime("%H:%M")
  end

  # def overlap(stoppage)
  #   TrainStoppage.new([@start_time, stoppage.start_time].max, [@end_time, stoppage.end_time].min)
  # end
end

arr = ["09:00", "10:00", "12:00", "14:00", "08:00", "10:15"]
dep = ["10:15", "12:30", "14:30", "16:00", "10:30", "10:30"]

stoppages = []
for i in 1..arr.length()
  stoppages << TrainStoppage.new(arr[i-1], dep[i-1])
end

for i in 0..(stoppages.length()-1)
  for j in (i+1)..(stoppages.length()-1)
    if stoppages[i].overlaps? stoppages[j]
      stoppages[i].add_link(stoppages[j])
    end
  end
end

for stoppage in stoppages
  puts "--------------"
  puts stoppage
  for link in stoppage.links
    puts "    " + link.to_s
  end
  puts "--------------"
end

result = 0
for stoppage in stoppages
  intermediate_result = 0
  for i in 0..(stoppage.links.length()-1)
    max_overlap = 2
    for j in (i+1)..(stoppage.links.length()-1)
      if stoppage.links[i].links.include?(stoppage.links[j])
        max_overlap+=1
      end
    end
    intermediate_result = intermediate_result > max_overlap ? intermediate_result : max_overlap
  end
  puts intermediate_result.to_s + " >>> " + stoppage.to_s
  result = result > intermediate_result ? result : intermediate_result
end

puts "Answer is: " + result.to_s
