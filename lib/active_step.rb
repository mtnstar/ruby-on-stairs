# frozen_string_literal: true

class ActiveStep
  attr_accessor :payload, :messages

  FILE_NR_REGEX = %r{app/steps\/([0-9]+)\/([0-9])*}.freeze

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
    info(label + ': Executing ...')
  end

  def info_completed
    info(label + ': ... Done')
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

  def info(message)
    puts message
  end
end
