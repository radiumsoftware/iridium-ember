require 'test_helper'

class PrecompilerTest < MiniTest::Unit::TestCase
  def test_returns_a_template
    result = compile "Hello {{name}}"
    assert_match result, /Ember\.Handlebars\.template\(.+\);/m
  end

  private
  def compile(template)
    Iridium::Ember::HandlebarsPrecompiler.call template
  end
end
