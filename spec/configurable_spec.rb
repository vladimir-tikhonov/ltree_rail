describe LtreeRails::Configurable do
  class Category
    include LtreeRails::Configurable
  end

  it 'provides "ltree_config" method' do
    expect(Category).to respond_to(:ltree_config)
  end

  it 'provides "ltree_config" method that returns ::LtreeRails::Configuration instance' do
    expect(Category.ltree_config).to be_a(::LtreeRails::Configuration)
  end
end
