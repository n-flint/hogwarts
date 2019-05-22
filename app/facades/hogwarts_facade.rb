class HogwartsFacade

  def initialize(house)
    @house = house.downcase
  end

  def student_count
    conn = Faraday.new('http://hp-api.herokuapp.com/api/characters/house/') do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get(@house)
    data = JSON.parse(response.body, symbolize_name: true)
    data.count 
  end

end