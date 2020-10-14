# frozen_string_literal: true

require_relative '../../lib/active_step'

describe ActiveStep do
  let(:step) { TestStep.new }

  context '#up' do
    it 'performs step up' do
      allow(step).to receive(:filename)
        .and_return('/opt/steps-project/app/steps/1/1_test_step.rb')

      expect(step.label).to eq('1.1 Test Step')

      exec_done_output = ['1.1 Test Step: Executing ...',
                          'Nothing to do, override #perform in subclass',
                          "1.1 Test Step: ... Done\n"].join("\n")

      expect do
        step.up
      end.to output(exec_done_output).to_stdout
    end
  end

  class TestStep < ActiveStep
  end
end
