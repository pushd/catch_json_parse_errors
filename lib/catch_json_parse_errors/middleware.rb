module CatchJsonParseErrors
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    rescue ActionDispatch::ParamsParser::ParseError => error
      if env['CONTENT_TYPE'] =~ /application\/json/
        error_output = "There was a problem in the JSON you submitted: #{error.inspect.encode('UTF-8', invalid: :replace, undef: :replace)}"

        if error_callback = env['json_parse_error_callback']
          error_callback.call(error_output)
        end

        return [
          400, { "Content-Type" => "application/json" },
          [ { status: 400, error: error_output }.to_json ]
        ]
      else
        raise error
      end
    end
  end
end