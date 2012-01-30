class Subdomain
  def self.matches?(request)
    request.subdomain(SUBDOMAIN_LEVEL).present? && request.subdomain != 'www'
  end
end