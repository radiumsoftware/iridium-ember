require 'test_helper'

class ControllerGeneratorTest < GeneratorTestCase
  def command
    Iridium::Ember::Generators::ControllerGenerator
  end

  def test_generator_naming
    assert_equal 'ember', command.namespace
    assert_equal 'controller', command.generator_name
  end

  def test_creates_a_controller_file
    invoke "controller", "pipeline"

    assert_file "app/javascripts/controllers/pipeline_controller.coffee"

    assert_defined "PipelineController", "app/javascripts/controllers/pipeline_controller.coffee"
  end

  def test_handles_namespaced_controllers_as_ember_notation
    invoke "controller", "pipeline.leads"

    assert_file "app/javascripts/controllers/pipeline/leads_controller.coffee"

    assert_defined "PipelineLeadsController", "app/javascripts/controllers/pipeline/leads_controller.coffee"
  end

  def test_handles_namespaced_controllers_as_url_notation
    invoke "controller", "pipeline/leads"

    assert_file "app/javascripts/controllers/pipeline/leads_controller.coffee"

    assert_defined "PipelineLeadsController", "app/javascripts/controllers/pipeline/leads_controller.coffee"
  end
end
