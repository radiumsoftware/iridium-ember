require 'test_helper'

class HelperGeneratorTest < GeneratorTestCase
  def command
    Iridium::Ember::Generators::HelperGenerator
  end

  def test_generator_naming
    assert_equal 'ember', command.namespace
    assert_equal 'helper', command.generator_name
  end

  def test_creates_a_helper_file
    invoke "helper", "badge"

    assert_file "app/javascripts/helpers/badge_helper.coffee"

    assert_defined "badge", "app/javascripts/helpers/badge_helper.coffee"
  end

  def test_helpers_can_be_namespaced
    invoke "helper", "pipeline/badge"

    assert_file "app/javascripts/helpers/pipeline/badge_helper.coffee"

    assert_defined "pipelineBadge", "app/javascripts/helpers/pipeline/badge_helper.coffee"
  end

  def assert_defined(name, file)
    content = read file
    assert_includes content, "Ember.Handlebars.registerBoundHelper '#{name}'"
  end
end
