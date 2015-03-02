describe LtreeRails::Model do
  it 'adds parent relation' do
    c1 = Category.new
    c1.save!
    c2 = Category.new(parent_id: c1.id)
    c2.save!
    expect(c2.parent).to eq c1
  end

  it 'adds category relation' do
    c1 = Category.new
    c1.save!
    c2 = Category.new(parent_id: c1.id)
    c2.save!
    c3 = Category.new(parent_id: c1.id)
    c3.save!
    expect(c1.children).to eq [c2, c3]
  end
end