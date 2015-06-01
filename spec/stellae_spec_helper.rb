module StellaeSpecHelper
  def gateway
    Stellae::Gateway.new(
      endpoint_url: 'https://webservice.stellae.us/SIIServices_multi/Siiservice.svc',
      username: ENV['STELLAE_USERNAME'],
      password: ENV['STELLAE_PASSWORD'],
      logger: Logger.new(STDOUT)
    )
  end
end
