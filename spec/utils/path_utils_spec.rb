describe LtreeRails::Utils::PathUtils do
  it 'combines first and second parts if present' do
    expect(LtreeRails::Utils::PathUtils.combine_paths('1', '2')).to eq '1.2'
  end

  it 'remove extra dots' do
    expect(LtreeRails::Utils::PathUtils.combine_paths('1.2.', '.3')).to eq '1.2.3'
  end

  it 'returns second part unless first_part presented' do
    expect(LtreeRails::Utils::PathUtils.combine_paths(nil, '1')).to eq '1'
  end
end