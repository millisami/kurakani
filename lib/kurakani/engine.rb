module Kurakani
  class Engine < Rails::Engine
    isolate_namespace Kurakani

    config.to_prepare do
      ::ActionView::Base.send(:include, Kurakani::Helpers)
    end

    cattr_accessor :current_user, :login_url, :logout_url, :unauthorized_url, :can_moderate_comments, :user_name

    def self.current_user
      @@current_user || raise(Kurakani::Engine::ConfigurationNotFound.new("current_user"))
    end

    def self.login_url
      @@login_url || raise(Kurakani::Engine::ConfigurationNotFound.new("login_url"))
    end

    def self.logout_url
      @@logout_url || raise(Kurakani::Engine::ConfigurationNotFound.new("logout_url"))
    end

    def self.unauthorized_url
      @@unauthorized_url || raise(Kurakani::Engine::ConfigurationNotFound.new("unauthorized_url"))
    end

    def self.can_moderate_comments
      @@can_moderate_comments || raise(Kurakani::Engine::ConfigurationNotFound.new("can_moderate_comments"))
    end

    def self.user_name
      @@user_name || raise(Kurakani::Engine::ConfigurationNotFound.new("user_name"))
    end

  end

end

module Kurakani
  class Engine  
    class ConfigurationNotFound < StandardError 

      attr_accessor :message

      def initialize(option)
        @message = "Kurakani configuration option #{option} not found. Please set this in config/initializers/kurakani.rb"
      end
    end
  end
end