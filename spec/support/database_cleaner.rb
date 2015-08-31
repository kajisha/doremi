DatabaseCleaner.strategy = :deletion

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
