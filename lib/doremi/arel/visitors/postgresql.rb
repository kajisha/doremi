module Arel
  module Visitors
    class PostgreSQL
      def method_missing(name, *args, &block)
        eigenclass = class << self; self end

        eigenclass.class_eval do
          define_method(name) do |o, collector|
            __visit o, collector
          end
        end

        send name, *args
      end

      private

      def __visit(o, collector)
        infix_value o, collector, " #{o.operator} "
      end
    end
  end
end
