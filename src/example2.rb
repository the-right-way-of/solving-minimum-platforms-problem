require 'time'

class TrainTime
  attr_accessor :t_type, :time
  def initialize(time, t_type)
    @t_type = t_type
    @time = Time.parse(time)
  end

  def to_s
    puts @t_type + " " + @time.strftime("%H:%M")
  end
end

arr = ["09:00", "10:00", "12:00", "14:00", "08:00", "10:15"]
dep = ["10:15", "12:30", "14:30", "16:00", "10:30", "10:30"]

train_times = []
for i in 1..arr.length()
  train_times << TrainTime.new(arr[i-1], "ARR")
  train_times << TrainTime.new(dep[i-1], "DEP")
end

train_times_sorted = train_times.sort_by(&:time)

count = 0
result = 0

for train_time in train_times_sorted
  puts train_time
  if train_time.t_type == "ARR"
    count+=1
  else
    count-=1
  end
  result = result > count ? result : count
end

puts "Answer is: " + result.to_s
