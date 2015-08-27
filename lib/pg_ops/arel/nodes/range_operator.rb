module Arel
  module Nodes
    class RangeOperator < Arel::Nodes::Binary
      attr_reader :operator

      def initialize(rel, operator)
        @operator = operator

        super(rel.left, rel.right)
      end
    end
  end
end
