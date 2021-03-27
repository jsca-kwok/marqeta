# frozen_string_literal: true

module FixturesHelpers
  def load_fixture(path)
    JSON.parse(File.read(path))
  end
end
