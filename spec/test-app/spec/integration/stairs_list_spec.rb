# frozen_string_literal: true

describe StairsList do
  it 'lists all available steps with description' do
    expect { system %(stairs list) }
      .to output(a_string_including('gotta love rspec'))
      .to_stdout_from_any_process
  end
end
