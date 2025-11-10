class SimpleMiddleware
  def initialize(app)
    pp "*" * 50
    pp "* #{self.class} initialize(app = #{ app.class })"
    pp "*" * 50
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    [ status, headers, body ]
  end
end
