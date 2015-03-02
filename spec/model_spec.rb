describe LtreeRails::Model do
  let(:root_category) { Category.create! }

  it 'adds parent relation' do
    c = Category.new(parent_id: root_category.id)
    c.save!
    expect(c.parent).to eq root_category
  end

  it 'adds category relation' do
    c1 = Category.new(parent_id: root_category.id)
    c1.save!
    c2 = Category.new(parent_id: root_category.id)
    c2.save!
    expect(root_category.children).to eq [c1, c2]
  end

  context 'root?' do
    context 'when persisted' do
      it 'returns true when parent column value is nil' do
        expect(root_category.root?).to be true
        expect(root_category.child?).to be false
      end

      it 'returns false when parent column value is not nil' do
        c = Category.new(parent_id: root_category.id)
        c.save!
        expect(c.root?).to be false
        expect(c.child?).to be true
      end
    end

    context 'when new record' do
      it 'returns true if parent is nil' do
        c = Category.new
        expect(c.root?).to be true
        expect(c.child?).to be false
      end

      it 'returns false if parent is not nil' do
        c = Category.new
        c.parent = root_category
        expect(c.root?).to be false
        expect(c.child?).to be true
      end
    end
  end
end
