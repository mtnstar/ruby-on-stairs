# frozen_string_literal: true

require_relative 'base'

module Cmds
  class Lister < Cmds::Base
    def exec
      steps.each do |s|
        print_step_lines(s)
      end
    end

    private

    def print_step_lines(steps)
      top_nr = steps[0]
      steps[1].each do |s|
        i = s[1].new
        puts i.label_description
        # nr = "#{top_nr}.#{s[0]}"
        # name = s[1].to_s
        # description = s[1].new.description
        # puts s[1].new.description
        # puts [nr, name, description].compact.join(' - ')
      end
    end

  end
end
