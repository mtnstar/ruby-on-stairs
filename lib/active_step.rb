# frozen_string_literal: true

# require 'active_support'

class ActiveStep
  attr_accessor :payload, :messages

  # class_attribute :description

  FILE_NR_REGEX = /app\/steps\/([0-9]+)\/([0-9])*/.freeze

  def initialize
    @messages = { errors: [], messages: [] }
  end

  def perform
    info('Nothing to do, override #perform in subclass')
  end

  def up
    info_start
    perform
    info_completed
  end

  def label
    "#{step_nr} #{class_label}"
  end

  private

  def info_start
  end

  def info_completed
  end

  def step_nr
    filename.match(FILE_NR_REGEX).captures.join('.')
  end

  def class_label
    self.class.name.split(/(?=[A-Z])/).join(' ')
  end

  def filename
    method(:perform).source_location[0]
  end

end
