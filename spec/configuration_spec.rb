describe LtreeRails::Configuration do
  let(:configuration) { LtreeRails::Configuration.new }
  let(:configurable_options) { LtreeRails::Configuration::CONFIGURABLE_OPTIONS.keys }
  let(:configurable_options_defaults) { LtreeRails::Configuration::CONFIGURABLE_OPTIONS.values }

  it 'provides getter for all options from CONFIGURABLE_OPTIONS' do
    expect(configuration).to respond_to(*configurable_options)
  end

  it 'provides default values for all options from CONFIGURABLE_OPTIONS' do
    actual_default_values = configurable_options.map do |option|
      configuration.public_send(option)
    end
    expect(actual_default_values).to eq(configurable_options_defaults)
  end
end