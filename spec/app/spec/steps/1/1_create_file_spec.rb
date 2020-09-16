require_relative '../../../steps/1/1_create_file'

describe CreateFile do

  let(:step) {described_class.new}

  context '#label' do

    it 'contains step number and name' do
      expect(step.label).to eq('1.1 Create File')
    end

  end

end
