# frozen_string_literal: true

stimulus_component_controller do
  p @code
  button 'Click', **server(:regenerate, on: :click)

  if rand(0..2) == 1
    p 'You are lucky!'
  end
end
