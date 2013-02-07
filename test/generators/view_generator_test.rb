require 'test_helper'

class ViewGeneratorTest < GeneratorTestCase
  def command
    Iridium::Ember::Generators::ViewGenerator
  end

  def test_generator_naming
    assert_equal 'ember', command.namespace
    assert_equal 'view', command.generator_name
  end

  def test_creates_a_view_file
    invoke "view", "pipeline"

    assert_file "app/javascripts/views/pipeline_view.coffee"

    assert_defined "PipelineView", "app/javascripts/views/pipeline_view.coffee"
  end

  def test_handles_namespaced_views_as_ember_notation
    invoke "view", "pipeline.leads"

    assert_file "app/javascripts/views/pipeline/leads_view.coffee"

    assert_defined "PipelineLeadsView", "app/javascripts/views/pipeline/leads_view.coffee"
  end

  def test_handles_namespaced_views_as_url_notation
    invoke "view", "pipeline/leads"

    assert_file "app/javascripts/views/pipeline/leads_view.coffee"

    assert_defined "PipelineLeadsView", "app/javascripts/views/pipeline/leads_view.coffee"
  end
end
