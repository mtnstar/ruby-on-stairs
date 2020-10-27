# frozen_string_literal: true

require_relative '../../../lib/cmds/lister'
require_relative '../../../lib/utils/stairs_dir'

describe Cmds::Lister do
  context '#exec' do
    it 'lists all available steps' do
      allow(Utils::StairsDir).to receive(:steps_dir)
        .and_return(File.expand_path('spec/test-app/app/steps'))

      lister = Cmds::Lister.new(@args)

      list_output =
        ['1.1 Create File - Bla Bli Blu Bla',
         '2.1 Execute Sys Command',
         '2.2 Use Payload - Using previous step\'s payload',
         '3.1 Finish - Final step', nil].join("\n")

      expect do
        lister.exec
      end.to output(list_output).to_stdout
    end

    it 'aborts if working directory is not a stairs project' do
      expect do
        Cmds::Lister.new(@args).exec
      end.to raise_error(SystemExit)
    end
  end
end
