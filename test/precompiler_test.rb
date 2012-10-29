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
    assert_raises Iridium::Ember::PrecompilerError do
      compile "Hello {{"
    end
  end

  private
  def compile(template)
    Iridium::Ember::HandlebarsPrecompiler.compile template
  end
end
