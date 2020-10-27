# frozen_string_literal: true

require 'active_support/all'
require_relative '../active_step'

module Utils
  class StairsDir
    class << self
      def present?
        Dir.exist?(steps_dir)
      end

      def list
        top_list.each_with_object({}) do |t, h|
          h[t] = collect_steps("#{steps_dir}/#{t}")
        end
      end

      private

      def steps_dir
        Dir.pwd + '/app/steps'
      end

      def top_list
        Dir.chdir(steps_dir) do
          Dir.glob('*').select do |f|
            File.directory?(f) && /^[0-9]+/.match?(f)
          end.sort!
        end
      end

      def collect_steps(dir)
        list = steps_list(dir)
        list.each_with_object({}) do |s, h|
          require("#{dir}/#{s}")
          nr = extract_nr(s)
          h[nr] = classify(s).constantize
        end
      end

      def classify(step_name)
        step_name.match(/^[0-9]+_(.+).rb$/)[1].classify
      end

      def extract_nr(step_name)
        step_name.match(/^[0-9]+/)[0]
      end

      def steps_list(dir)
        Dir.chdir(dir) do
          Dir.glob('*.rb').select do |f|
            File.file?(f) && /^[0-9]+/.match?(f)
          end.sort!
        end
      end
    end
  end
end
