class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound do |_exception|
        render file: "#{Rails.root}/public/404.html", status: :not_found
    end
end
