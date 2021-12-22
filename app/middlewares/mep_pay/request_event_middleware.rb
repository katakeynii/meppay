module MepPay
    class RequestEventMiddleware
        def initialize(app)
            @app = app
        end

        def call env
            @app.call(request.env)
        end
    end
end