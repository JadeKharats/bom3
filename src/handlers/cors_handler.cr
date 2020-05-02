class CORSHandler
  include HTTP::Handler

  ALLOWED_ORIGINS = [
    /\.lvh\.me/,
    /localhost/,
    /127\.0\.0\.1/,
  ]

  def call(context)
    if context.request.path.includes? "api"
      request_origin = context.request.headers["Origin"]

      context.response.headers["Access-Control-Allow-Origin"] = allowed_origin?(request_origin) ? request_origin : ""
      context.response.headers["Access-Control-Allow-Credentials"] = "true"
      context.response.headers["Access-Control-Allow-Methods"] = "POST,GET,OPTIONS"
      context.response.headers["Access-Control-Allow-Headers"] = "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authentication,Authorization"

      if context.request.method == "OPTIONS"
        context.response.status = HTTP::Status::NO_CONTENT
        context.response.headers["Access-Control-Max-Age"] = "1728000"
        context.response.headers["Content-Type"] = "text/plain"
        context.response.headers["Content-Length"] = "0"
        context
      else
        call_next(context)
      end
    else
      call_next(context)
    end
  end

  private def allowed_origin?(request_origin)
    (ALLOWED_ORIGINS + sites_allowed_for_requests).find(false) do |pattern|
      pattern === request_origin
    end
  end

  private def sites_allowed_for_requests
     ["https://beta-wall-bom3.herokuapp.com"]
  end
end
