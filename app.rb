require 'prototyping_kit'
require 'sinatra/content_for'

class App < PrototypingKit::App
  helpers Sinatra::ContentFor

  def view_path(path)
    File.join( File.dirname(__FILE__), 'views', "#{path}.erb")
  end

  def self.get_and_render_erb(url, template)
    action = ->{
      erb(template.to_sym)
    }
    get(url, &action)
  end

  get "/" do
    erb :index
  end

  get_and_render_erb('/simple-guidance', 'simple_guidance/index')
  get_and_render_erb('/simple-guidance/technology', 'simple_guidance/technology')
  get_and_render_erb('/simple-guidance/technology/cloud-services', 'simple_guidance/cloud_services')

  get_and_render_erb('/buyer-dashboard', 'buyer_dashboard/index')
end
