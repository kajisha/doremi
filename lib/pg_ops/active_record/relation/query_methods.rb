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

      def contain(opts, *rest)
        substitute_comparision(opts, rest, '@>')
      end

      def contained_by(opts, *rest)
        substitute_comparision(opts, rest, '<@')
      end

      def lower_bound_of(opts, *rest)
        substitute_comparision(opts, rest, '<<')
      end

      def upper_bound_of(opts, *rest)
        substitute_comparision(opts, rest, '>>')
      end

      def lte_supremum(opts, *rest)
        substitute_comparision(opts, rest, '&<')
      end

      def gte_infimum(opts, *rest)
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
