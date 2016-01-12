source_data = [{name: 'Dancer', rate: 27, duration: 5, recovery: 132},
{name: 'Cupid', rate: 22, duration: 2, recovery: 41},
{name: 'Rudolph', rate: 11, duration: 5, recovery: 48},
{name: 'Donner', rate: 28, duration: 5, recovery: 134},
{name: 'Dasher', rate: 4, duration: 16, recovery: 55},
{name: 'Blitzen', rate: 14, duration: 3, recovery: 38},
{name: 'Prancer', rate: 3, duration: 21, recovery: 40},
{name: 'Comet', rate: 18, duration: 6, recovery: 103},
{name: 'Vixen', rate: 18, duration: 5, recovery: 84}]

class Reindeer
  attr_accessor :name, :rate, :duration, :recovery, :resting, :current_distance,
                :rested_at, :restarted_at

  def initialize(name, rate, duration, recovery)
    @name = name
    @rate = rate
    @duration = duration
    @recovery = recovery
    @current_distance = 0
    @current_rest_time = 0
    @rested_at = 0
    @restarted_at = 0
    @resting = false
  end

  def advance(current_time)
    if @resting
      if current_time - @recovery == @rested_at
        @resting = false
        @restarted_at = current_time
      end
    else
      @current_distance += @rate
      if current_time - @duration == @restarted_at
        @resting = true
        @rested_at = current_time
      end
    end
  end
end

racers = []
source_data.each do |i|
  racers << Reindeer.new(i[:name], i[:rate], i[:duration], i[:recovery])
end

def race(racers, time)
  (time+1).times do |current_time|
    next if current_time == 0
    racers.each do |racer|
      racer.advance(current_time)
    end
  end
end

race(racers, 2503)
puts "#{racers.sort_by { |r| r.current_distance }.last.current_distance}"
