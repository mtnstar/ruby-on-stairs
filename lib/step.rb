# frozen_string_literal: true

# require 'active_support'

class Step
  attr_accessor :payload, :messages

  # class_attribute :description

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

  private

  def info_start
  end

  def info_completed
  end

end
