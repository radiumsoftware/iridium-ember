class TestApp < Iridium::Application
  def root
    Pathname.new(File.dirname(__FILE__))
  end
end
