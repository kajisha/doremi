module ActiveRecord
  module QueryMethods
    class WhereChain
      def lt(opts, *rest)
        substitute_comparision(opts, rest, '<')
      end

      def gt(opts, *rest)
        substitute_comparision(opts, rest, '>')
      end

      def lte(opts, *rest)
        substitute_comparision(opts, rest, '<=')
      end

      def gte(opts, *rest)
        substitute_comparision(opts, rest, '>=')
      end

      def overlap(opts, *rest)
        substitute_comparision(opts, rest, '&&')
      end

      def contains(opts, *rest)
        substitute_comparision(opts, rest, '@>')
      end

      def contained_by(opts, *rest)
        substitute_comparision(opts, rest, '<@')
      end

      def left_of(opts, *rest)
        substitute_comparision(opts, rest, '<<')
      end

      def right_of(opts, *rest)
        substitute_comparision(opts, rest, '>>')
      end

      def not_extend_left_of(opts, *rest)
        substitute_comparision(opts, rest, '&<')
      end

      def not_extend_right_of(opts, *rest)
        substitute_comparision(opts, rest, '&>')
      end

      def adjacent_to(opts, *rest)
        substitute_comparision(opts, rest, '-|-')
      end

      private

      def substitute_comparision(opts, rest, operator)
        where_value = @scope.send(:build_where, opts, rest).map {|rel|
          Arel::Nodes::RangeOperator.new(rel, operator)
        }

        @scope.references!(PredicationBuilder.reference(opts)) if opts === Hash
        @scope.where_values += where_value
        @scope
      end
    end
  end
end
