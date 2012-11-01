require 'simplecov'
SimpleCov.start

require 'debugger'

ENV['IRIDIUM_ENV'] = "test"

require 'iridium/ember'

require 'minitest/unit'
require 'minitest/autorun'

require 'active_support/testing/isolation'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each do |file|
  require file
end

TestApp.instance.boot!

class MiniTest::Unit::TestCase
  def setup
    FileUtils.mkdir_p app.app_path
    FileUtils.mkdir_p app.site_path
    FileUtils.mkdir_p app.tmp_path
    FileUtils.mkdir_p app.vendor_path
    FileUtils.mkdir_p app.build_path
  end

  def teardown
    FileUtils.rm_rf app.app_path
    FileUtils.rm_rf app.site_path
    FileUtils.rm_rf app.tmp_path
    FileUtils.rm_rf app.vendor_path
    FileUtils.rm_rf app.build_path
  end

  def create_file(path, content)
    full_path = app.root.join path

    FileUtils.mkdir_p File.dirname(full_path)

    File.open full_path, "w" do |f|
      f.puts content
    end
  end

  def app
    TestApp.instance
  end

  def assert_file(path)
    full_path = app.root.join path

    assert File.exists?(full_path), 
      "#{full_path} should be a file. Current Files: #{Dir[app.root.join("**", "*").inspect]}"
  end

  def read(*path)
    File.read app.root.join(*path)
  end
end
