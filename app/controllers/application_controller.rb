class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render_json_error "#{e.model.underscore}.not_found".to_sym, :not_found
  end

  rescue_from ActiveModel::UnknownAttributeError,
              RuntimeError,
              ArgumentError do |e|
    render json: { error: e.message }, status: :bad_request
  end

  protected

  def render_json_error(identifier, status = :bad_request)
    error = {
      status: Rack::Utils.status_code(status),
      code: identifier,
      title: I18n.t("errors.#{identifier}.title"),
      detail: I18n.t("errors.#{identifier}.detail")
    }

    render json: { errors: [error] }, status: status
  end

  def render_json_validation_error(resource)
    render json: resource,
           status: :bad_request,
           adapter: :json_api,
           serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
