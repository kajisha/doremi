require 'spec_helper'

RSpec.describe ActiveRecord::QueryMethods::WhereChain do
  before do
    Post.create(int4range: (1..10),
                array: [1, 2, 3])
  end

  describe '#upper_bound_of' do
    let (:int4range) { (1..10) }
    let (:array) { [1, 2, 3] }

    let (:range_operator) { Post.where.upper_bound_of(int4range: int4range).exists? }
    let (:array_operator) { Post.where.upper_bound_of(array: array).exists? }

    context 'equals' do
      it { expect(range_operator).to eq(false) }
      it { expect { array_operator }.to raise_error(ActiveRecord::StatementInvalid) }
    end

    context 'within' do
      let (:int4range) { (2..5) }
      let (:array) { [2] }

      it { expect(range_operator).to eq(false) }
      it { expect { array_operator }.to raise_error(ActiveRecord::StatementInvalid) }
    end

    context 'overlap' do
      let (:int4range) { (9..11) }
      let (:array) { [2, 3, 4] }

      it { expect(range_operator).to eq(false) }
      it { expect { array_operator }.to raise_error(ActiveRecord::StatementInvalid) }
    end

    context 'strictly left to' do
      let (:int4range) { (11..20) }
      let (:array) { [4, 5, 6] }

      it { expect(range_operator).to eq(false) }
      it { expect { array_operator }.to raise_error(ActiveRecord::StatementInvalid) }
    end

    context 'strictly right to' do
      let (:int4range) { (-10..0) }
      let (:array) { [-2, -1, 0] }

      it { expect(range_operator).to eq(true) }
      it { expect { array_operator }.to raise_error(ActiveRecord::StatementInvalid) }
    end
  end
end
