# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CableReady::Broadcaster
  allow_browser versions: :modern
end
