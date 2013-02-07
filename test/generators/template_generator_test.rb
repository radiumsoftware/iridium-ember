require 'test_helper'

class TemplateGeneratorTest < GeneratorTestCase
  def command
    Iridium::Ember::Generators::TemplateGenerator
  end

  def test_generator_naming
    assert_equal 'ember', command.namespace
    assert_equal 'template', command.generator_name
  end

  def test_creates_a_template_file
    invoke "template", "pipeline"

    assert_file "app/templates/pipeline.hbs"
  end

  def test_handles_namespaced_templates_as_ember_notation
    invoke "template", "pipeline.leads"

    assert_file "app/templates/pipeline/leads.hbs"
  end

  def test_handles_namespaced_templates_as_url_notation
    invoke "template", "pipeline/leads"

    assert_file "app/templates/pipeline/leads.hbs"
  end
end
