class Admin::Base < ApplicationController
	 #include Admin::SessionsHelper
	 include Admin::ApiKeyHelper
	 include Admin::ArgumentHelper
end
