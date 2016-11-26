require 'active_support/concern'
require "controller_support/version"

module ControllerSupport
  module Base

    include ActiveSupport::Concern


    def self.extended(base)
      base.instance_variable_set("@_dependencies", [])
    end


    def append_features(base)
      super(base)
      unless base.instance_variable_defined?("@_dependencies")
        if instance_variable_defined?("@_custom_blocks")
          @_custom_blocks.each do |block|
            base.class_eval(&block)
          end
        end
      end
    end


    [
        :after_action,
        :after_filter,
        :append_after_action,
        :append_after_filter,
        :append_around_action,
        :append_around_filter,
        :append_before_action,
        :append_before_filter,
        :around_action,
        :around_filter,
        :before_action,
        :before_filter,
        :helper_method,
        :prepend_after_action,
        :prepend_after_filter,
        :prepend_around_action,
        :prepend_around_filter,
        :prepend_before_action,
        :prepend_before_filter,
        :respond_to,
        :skip_action_callback,
        :skip_after_action,
        :skip_after_filter,
        :skip_around_action,
        :skip_around_filter,
        :skip_before_action,
        :skip_before_filter,
        :skip_filter,
    ]
        .each do |method_name|
      define_method method_name do |*names|
        @_custom_blocks ||= []
        @_custom_blocks << Proc.new { send(method_name, *names) if respond_to? method_name }
      end
    end

  end
end
