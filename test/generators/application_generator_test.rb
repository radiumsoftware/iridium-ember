require 'test_helper'

class ApplicationGeneratorTest < GeneratorTestCase
  def command
    Iridium::Ember::Generators::ApplicationGenerator
  end

  def test_generator_naming
    assert_equal 'ember', command.namespace
    assert_equal 'application', command.generator_name
  end

  def test_generator_creates_ember_files
    invoke "application"

    assert_file "app/javascripts/routes.coffee"
    assert_file "app/javascripts/routes/application_route.coffee"
    assert_file "app/templates/application.hbs"

    assert_file "app/javascripts/helpers"

    assert_file "vendor/javascripts/ember.js"
    assert_file "vendor/javascripts/ember-template-compiler.js"
    assert_file "vendor/javascripts/ember.min.js"
  end
end
