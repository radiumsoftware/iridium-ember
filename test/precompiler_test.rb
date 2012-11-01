require 'test_helper'
require 'json'

class PrecompilerTest < MiniTest::Unit::TestCase
  def test_returns_a_template
    result = compile "Hello {{name}}"
    assert result
  end

  def test_compiles_templates_with_quotes
    template = <<-hbs
    <div class="calendar">
      <a {{action switchToNextYear target="view"}}>{{view.nextYear}}</a>
    </div>

    {{view Radium.RangeChangerView}}
    hbs

    result = compile JSON.dump(template)
    assert result
  end

  def test_raises_an_error_on_bad_templates
    assert_raises Barber::PrecompilerError do
      compile "Hello {{"
    end
  end

  private
  def compile(template)
    stub_app = stub :handlebars_path => Iridium.vendor_path.join("handlebars.js"),
      :ember_path => nil
    compiler = Iridium::Ember::HandlebarsPrecompiler.new stub_app
    compiler.compile template
  end
end
