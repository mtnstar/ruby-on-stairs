# frozen_string_literal: true

require 'rubygems'
require 'commander'
Dir.glob(File.join('**', '*.rb'), &method(:require))

class RubyOnStairs
  include Commander::Methods

  def run # rubocop:disable Metrics/MethodLength
    program :name, 'ruby on stairs'
    program :version, '1.0.0'
    program :description, 'Organize and execute your ruby code by steps'
    program :help, 'Source Code', 'https://www.github.com/psunix/ruby-on-stairs'
    program :help, 'Usage', 'stairs [flags]'

    command :run do |c|
      c.syntax = 'stairs run <step nr>'
      c.description = 'runs all or single steps/sub-step'

      c.action do |args|
        runner(args).exec
      end
    end

    command :list do |c|
      c.syntax = 'stairs list'
      c.description = 'lists all steps'

      c.action do |args|
        lister(args).exec
      end
    end

    run!
  end

  private

  def lister(args)
    @lister ||= Cmds::Lister.new(args)
  end

  def runner
    @runner ||= Cmds::Runner.new(args)
  end
end
