module Entropi
  module Notable
    class Engine < ::Rails::Engine
      isolate_namespace Entropi

      def self.activate

      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end

