class Post < ActiveRecord::Base
end

ActiveRecord::Schema.define do
  create_table :posts, force: true do |t|
    t.int4range :int4range
    t.integer :array, array: true

    t.timestamps null: false
  end
end
