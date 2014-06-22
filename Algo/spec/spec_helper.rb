require 'rspec/expectations'

RSpec::Matchers.define :have do |expected|
  match do |actual|
    actual.size == expected
  end
end
