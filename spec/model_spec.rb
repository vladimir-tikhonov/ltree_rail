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

  context 'callbacks' do
    context 'after_save' do
      it 'assigns label_column value if root' do
        expect(root_category.path).to eq root_category.id.to_s
      end

      it 'assigns correct value if child' do
        c1 = Category.create!(parent_id: root_category.id)
        c2 = Category.create!(parent_id: c1.id)
        expect(c1.path).to eq "#{root_category.id}.#{c1.id}"
        expect(c2.path).to eq "#{root_category.id}.#{c1.id}.#{c2.id}"
      end
    end

    context 'before_update' do
      it 'assigns correct value' do
        c1 = Category.create!
        root_category.update_attributes(parent: c1)
        expect(root_category.path).to eq "#{c1.id}.#{root_category.id}"
      end

      it 'assigns correct value when moved to root' do
        c1 = Category.create!(parent: root_category)
        expect(c1.path).to eq "#{root_category.id}.#{c1.id}"
        c1.update_attributes!(parent: nil)
        expect(c1.path).to eq c1.id.to_s
      end

      it 'assigns correct value when added to parent collection' do
        c1 = Category.create!
        c1.children << root_category
        expect(root_category.path).to eq "#{c1.id}.#{root_category.id}"
      end
    end
  end
end
