RSpec.shared_examples 'has_ltree' do
  it 'allows user to pass config params' do
    expect(described_class).to respond_to(:ltree_config)
  end
end
