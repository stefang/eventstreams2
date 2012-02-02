module UrlHelper  
  def with_subdomain(subdomain)  
    subdomain = (subdomain || "")  
    subdomain += "." unless subdomain.empty?
    if SUBDOMAIN_LEVEL > 1
      stage = request.subdomain(SUBDOMAIN_LEVEL-1)+'.' if request.subdomain(SUBDOMAIN_LEVEL-1).present?
    end
    [subdomain, stage, request.domain].join  
  end
  
  def url_for(options = nil)  
    if options.kind_of?(Hash) && options.has_key?(:subdomain)  
      options[:host] = with_subdomain(options.delete(:subdomain))  
    end  
    super  
  end  
  
  def without_secondary_subdomain
    stage = request.subdomain.split('.')
    [stage.last, ".", request.domain].join 
  end

end