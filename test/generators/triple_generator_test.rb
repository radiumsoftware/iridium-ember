require 'test_helper'

class TripleGeneratorTest < GeneratorTestCase
  def command
    Iridium::Ember::Generators::TripleGenerator
  end

  def test_generator_naming
    assert_equal 'ember', command.namespace
    assert_equal 'triple', command.generator_name
  end

  def test_creates_control_with_a_control
    invoke "triple", "pipeline"

    assert_file "app/templates/pipeline.hbs"

    assert_file "app/javascripts/controllers/pipeline_controller.coffee"
    assert_defined "PipelineController", "app/javascripts/controllers/pipeline_controller.coffee"

    assert_file "app/javascripts/views/pipeline_view.coffee"
    assert_defined "PipelineView", "app/javascripts/views/pipeline_view.coffee"
  end

  def test_handles_namespaced_controls_as_ember_notation
    invoke "triple", "pipeline.leads"

    assert_file "app/templates/pipeline/leads.hbs"
    assert_file "app/javascripts/controllers/pipeline/leads_controller.coffee"
    assert_file "app/javascripts/views/pipeline/leads_view.coffee"

    assert_defined "PipelineLeadsView", "app/javascripts/views/pipeline/leads_view.coffee"
    assert_defined "PipelineLeadsController", "app/javascripts/controllers/pipeline/leads_controller.coffee"
  end

  def test_handles_namespaced_controls_as_url_notation
    invoke "triple", "pipeline/leads"

    assert_file "app/templates/pipeline/leads.hbs"
    assert_file "app/javascripts/controllers/pipeline/leads_controller.coffee"
    assert_file "app/javascripts/views/pipeline/leads_view.coffee"

    assert_defined "PipelineLeadsView", "app/javascripts/views/pipeline/leads_view.coffee"
    assert_defined "PipelineLeadsController", "app/javascripts/controllers/pipeline/leads_controller.coffee"
  end

  def assert_defined(object_name, file)
    content = read file
    namespace = Iridium.application.class.to_s

    assert_includes content, "#{namespace}.#{object_name} = "
  end
end
