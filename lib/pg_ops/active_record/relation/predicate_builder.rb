module ActiveRecord
  class PredicateBuilder
    private

    class << self
      def build_with_pg_types(attribute, value)
        if column = column_for(attribute)
          value = type_cast(column, value)
        end

        build_without_pg_types(attribute, value)
      end
      alias_method_chain :build, :pg_types

      def column_for(attribute)
        attribute.relation.engine.connection.schema_cache.columns(attribute.relation.name.pluralize)
          .find {|col| col.name == attribute.name.to_s }
      end

      def type_cast(column, value)
        column.cast_type.type_cast_for_database(value)
      end
    end
  end
end
