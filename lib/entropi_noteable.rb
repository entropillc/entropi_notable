module Entropi
  module Noteable
    require 'entropi/noteable/engine' if defined?(Rails)
  end
end

require "entropi/noteable/noteable" if defined?(Rails)
