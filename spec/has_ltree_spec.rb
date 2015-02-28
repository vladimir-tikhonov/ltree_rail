describe LtreeRails::HasLtree do
  it 'fails when pass invalid options' do
    expect do
      Class.new(ActiveRecord::Base) do
        has_ltree(some_invalid_arg: '')
      end
    end.to raise_error(ArgumentError)
  end

  it 'set option value when pass valid option' do
    c = Class.new(ActiveRecord::Base) do
      has_ltree(parent_id_column: :some_custom_column)
    end
    expect(c.ltree_config.parent_id_column).to eq(:some_custom_column)
  end
end
