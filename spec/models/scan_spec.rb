require "spec_helper"

RSpec.describe Scan do
  it { should validate_presence_of(:content) }
end
