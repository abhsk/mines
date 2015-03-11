class InputParser

  class << self
    def parse(input)
      action_type = input.split('(')[0]
      positions = input.split('(')[1].gsub('(', '').gsub(')', '').split(',')
      position_x = positions[0].to_i
      position_y = positions[1].to_i
      [action_for(action_type), position_x, position_y]
    end

    def action_for(type)
      return 'open' if type == 'o'
      'flag'
    end
  end
end