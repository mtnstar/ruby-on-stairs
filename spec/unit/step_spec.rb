require_relative '../../lib/step'

describe Step do

  let(:step) { TestStep.new }

  context '#up' do

    it 'performs step up' do
      step.up
    end

  end

  class TestStep < Step

    def perform
    end

  end

end
