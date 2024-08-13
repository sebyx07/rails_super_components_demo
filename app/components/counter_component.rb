# frozen_string_literal: true

class CounterComponent < ApplicationComponent
  def initialize
    @code = SecureRandom.hex
  end

  def regenerate
    @code = SecureRandom.hex
  end
end
