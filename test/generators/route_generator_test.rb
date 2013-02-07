require 'test_helper'

class RouteGeneratorTest < GeneratorTestCase
  def command
    Iridium::Ember::Generators::RouteGenerator
  end

  def test_generator_naming
    assert_equal 'ember', command.namespace
    assert_equal 'route', command.generator_name
  end

  def test_creates_routing_information
    invoke "route", "pipeline"

    assert_file "app/templates/pipeline.hbs"
    assert_file "app/stylesheets/pipeline.scss"
  end

  def test_creates_route_with_a_route
    invoke "route", "pipeline", :route => true

    assert_file "app/javascripts/routes/pipeline_route.coffee"

    assert_defined "PipelineRoute", "app/javascripts/routes/pipeline_route.coffee"
  end

  def test_creates_route_with_controller
    invoke "route", "pipeline", :controller => true

    assert_file "app/javascripts/controllers/pipeline_controller.coffee"

    assert_defined "PipelineController", "app/javascripts/controllers/pipeline_controller.coffee"
  end

  def test_creates_route_with_view
    invoke "route", "pipeline", :view => true

    assert_file "app/javascripts/views/pipeline_view.coffee"

    assert_defined "PipelineView", "app/javascripts/views/pipeline_view.coffee"
  end

  def test_creates_route_creates_all_files_with_full_option
    invoke "route", "pipeline", :full => true

    assert_file "app/javascripts/controllers/pipeline_controller.coffee"
    assert_file "app/javascripts/views/pipeline_view.coffee"
  end

  def test_handles_namespaced_routes_as_ember_notation
    invoke "route", "pipeline.leads", :full => true

    assert_file "app/templates/pipeline/leads.hbs"
    assert_file "app/stylesheets/pipeline/leads.scss"
    assert_file "app/javascripts/controllers/pipeline/leads_controller.coffee"
    assert_file "app/javascripts/views/pipeline/leads_view.coffee"

    assert_defined "PipelineLeadsView", "app/javascripts/views/pipeline/leads_view.coffee"
    assert_defined "PipelineLeadsController", "app/javascripts/controllers/pipeline/leads_controller.coffee"
    assert_defined "PipelineLeadsRoute", "app/javascripts/routes/pipeline/leads_route.coffee"
  end

  def test_handles_namespaced_routes_as_url_notation
    invoke "route", "pipeline/leads", :full => true

    assert_file "app/templates/pipeline/leads.hbs"
    assert_file "app/stylesheets/pipeline/leads.scss"
    assert_file "app/javascripts/controllers/pipeline/leads_controller.coffee"
    assert_file "app/javascripts/views/pipeline/leads_view.coffee"

    assert_defined "PipelineLeadsView", "app/javascripts/views/pipeline/leads_view.coffee"
    assert_defined "PipelineLeadsController", "app/javascripts/controllers/pipeline/leads_controller.coffee"
    assert_defined "PipelineLeadsRoute", "app/javascripts/routes/pipeline/leads_route.coffee"
  end

  def assert_defined(object_name, file)
    content = read file
    namespace = Iridium.application.class.to_s

    assert_includes content, "#{namespace}.#{object_name} = "
  end
end
