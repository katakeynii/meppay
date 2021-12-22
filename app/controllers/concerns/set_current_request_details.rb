module SetCurrentRequestDetails
    extend ActiveSupport::Concern
  
    included do
      before_action do
        Current.request_id = request.uuid
        Current.user_agent = request.user_agent
        Current.ip_address = request.ip
        Current.request    = request
        Current.path    = request.fullpath
        Current.remote_ip = request.remote_ip
        Current.request_method = request.request_method
      end
    end
end