# frozen_string_literal: true

class ApplicationComponent < ViewComponentReflex::Component
  include Ruby2html::ComponentHelper
  config.state_adapter = ViewComponentReflex::StateAdapter::Redis.new(
    redis_opts: {
      url: 'redis://localhost:6379/1', driver: :hiredis
    },
    ttl: 3600)


  def stimulus_component_controller(opts_or_tag = :div, opts = {}, &block)
    initialize_component

    tag = :div
    options = if opts_or_tag.is_a? Hash
      opts_or_tag
    else
      tag = opts_or_tag
      opts
    end

    div 'data-controller': self.class.stimulus_controller, 'data-key': key, **options, &block
  end

  def server(action, on:)
    {
      'data-reflex': "#{on}->#{self.class.name}##{action}",
      'data-key': key,
      'data-controller': 'stimulus-reflex',
      'data-action': "#{on}->stimulus-reflex#__perform"
    }
  end
end
