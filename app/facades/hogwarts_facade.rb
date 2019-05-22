class HogwartsFacade

  def initialize(house)
    @house = house
  end

  # def student_count
  #   conn = Faraday.new('http://hp-api.herokuapp.com/api/characters/house/') do |f|
  #     f.adapter Faraday.default_adapter
  #   end
  #   response = conn.get(@house)
  #   data = JSON.parse(response.body, symbolize_name: true)
  #   data.count 
  #   # require 'pry'; binding.pry
  # end

  def students
    conn = Faraday.new("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?api_key=#{test}") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get
    data = JSON.parse(response.body, symbolize_name: true)
    students = []
    data[:data]
    data.each do |char|
      require 'pry'; binding.pry
      if char['hogwartsStudent']
        students << Student.new(char['name'])
      end
    end
    students
    require 'pry'; binding.pry
  end
end