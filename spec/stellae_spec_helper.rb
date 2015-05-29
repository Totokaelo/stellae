module StellaeSpecHelper
  def gateway
    Stellae::Gateway.new(
      endpoint_url: 'https://webservice.stellae.us/SIIServices_multi/Siiservice.svc',
      username: 'TOTOKAELO',
      password: 'fP4#WNZtu5Gf',
      logger: Logger.new(STDOUT)
    )
  end
end
