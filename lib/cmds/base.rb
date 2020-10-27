# frozen_string_literal: true

require_relative '../utils/stairs_dir'

module Cmds
  class Base
    def initialize(args)
      @args = args
      prepare
    end

    def exec
      raise 'implement in sub class'
    end

    private

    def prepare
      assert_stairs_directory
    end

    def steps
      @steps ||= stairs_dir.list
    end

    def assert_stairs_directory
      if stairs_dir.present?
        steps
      else
        abort('Not a stairs directory!')
      end
    end

    def stairs_dir
      Utils::StairsDir
    end
  end
end
