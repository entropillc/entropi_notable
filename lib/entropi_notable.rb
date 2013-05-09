module Entropi
  module Notable
    require 'entropi/notable/engine' if defined?(Rails)
  end
end

require "entropi/notable/notable" if defined?(Rails)
require "entropi/notable"
