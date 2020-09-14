require_relative '../../lib/active_step'

describe ActiveStep do

  let(:step) { TestStep.new }

  context '#up' do

    it 'performs step up' do
      step.up
    end

  end

  class TestStep < ActiveStep

    def perform
    end

  end

end
