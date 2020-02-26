RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.expect_with(:rspec) { |c| c.syntax = :should, :expect }
end

def capture_output
  old_stdout = $stdout
  $stdout = StringIO.new('', 'w')
  yield
  $stdout.string
ensure
  $stdout = old_stdout
end
