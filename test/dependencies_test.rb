require 'test_helper'

class DependenciesTest < MiniTest::Unit::TestCase
  include ActiveSupport::Testing::Isolation

  def test_development_files_loaded_correctly
    instance = boot! :development

    assert_includes instance.config.dependencies.files, "ember-debug"
    assert_includes instance.config.dependencies.skips, :ember
  end

  def test_production_files_loaded_correctly
    instance = boot! :production

    assert_includes instance.config.dependencies.skips, "ember-debug"
    assert_includes instance.config.dependencies.files, :ember
  end

  private
  def boot!(env = 'test')
    ENV['IRIDIUM_ENV'] = env.to_s
    instance = TestApp.new
    instance.boot!
    instance
  ensure
    ENV['IRIDIUM_ENV'] = "test"
  end
end
