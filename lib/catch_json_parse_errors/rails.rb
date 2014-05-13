module CatchJsonParseErrors
  class Middleware < Rails::Railtie
    initializer "catch_json_parse_errors.configure_rails_initialization" do |app|
      app.middleware.insert_before ActionDispatch::ParamsParser, "CatchJsonParseErrors::Middleware"
    end
  end
end