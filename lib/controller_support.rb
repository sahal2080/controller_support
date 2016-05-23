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
        :before_filter,
        :before_action,
        :after_filter,
        :after_action,
        :around_filter,
        :around_action,
        :respond_to,
        :helper_method
    ]
        .each do |method_name|
      define_method method_name do |*names|
        @_custom_blocks ||= []
        @_custom_blocks << Proc.new { send(method_name, *names) if respond_to? method_name }
      end
    end

  end
end
