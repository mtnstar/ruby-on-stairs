require_relative '../../lib/active_step'

describe ActiveStep do

  let(:step) { TestStep.new }

  context '#up' do

    it 'performs step up' do
      allow(step).to receive(:filename)
        .and_return('/opt/steps-project/steps/1/1_test_step.rb')

      expect(step.label).to eq('1.1 Test Step')

      step.up
    end

  end

  class TestStep < ActiveStep

    def perform
    end

  end

end
