RSpec.shared_examples 'has_ltree' do
  it 'allows user to pass config params' do
    expect(described_class).to respond_to(:ltree_config)
  end

  it 'adds parent association' do
    expect(described_class.new).to respond_to(:parent)
  end

  it 'adds children association' do
    expect(described_class.new).to respond_to(:children)
  end
end
