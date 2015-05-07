module Web
  class Application < Lotus::Application
    configure do
      root __dir__
 
      serve_assets true
 
      # Override the asset middleware to set index.html as index
      assets.entries.each do |path, children|
        middleware.use Rack::Static, urls: children, root: path, index: 'index.html'
      end
    end
  end
end