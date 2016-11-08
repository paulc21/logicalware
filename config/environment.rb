# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Load the VAT rates
VAT_RATES = {}
vat_file = File.join(Rails.root, 'config', 'vat_rates.yml')
YAML.load(File.open(vat_file)).each do |key, value|
  VAT_RATES[key.to_s] = value
end if File.exists?(vat_file)
