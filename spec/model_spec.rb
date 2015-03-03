describe LtreeRails::Model do
  let(:root_category) { Category.create! }

  it 'adds parent relation' do
    c = Category.create!(parent_id: root_category.id)
    expect(c.parent).to eq root_category
  end

  it 'adds category relation' do
    c1 = Category.create!(parent_id: root_category.id)
    c2 = Category.create!(parent_id: root_category.id)
    expect(root_category.children).to eq [c1, c2]
  end

  context 'root?' do
    context 'when persisted' do
      it 'returns true when parent column value is nil' do
        expect(root_category).to be_root
        expect(root_category).not_to be_child
      end

      it 'returns false when parent column value is not nil' do
        c = Category.create!(parent_id: root_category.id)
        expect(c).not_to be_root
        expect(c).to be_child
      end
    end

    context 'when new record' do
      it 'returns true if parent is nil' do
        c = Category.new
        expect(c).to be_root
        expect(c).not_to be_child
      end

      it 'returns false if parent is not nil' do
        c = Category.new
        c.parent = root_category
        expect(c).not_to be_root
        expect(c).to be_child
      end
    end
  end
end
