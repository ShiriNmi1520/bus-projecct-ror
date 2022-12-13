require 'json-schema'
require 'json'
class SubscribeController < ApplicationController
  respond_to? :js
  def create
    @validation_result = validate_post_body
    if @validation_result.as_json['status'] != 200
      render @validation_result
    else
      @subscribe_result = Subscribe.new(request.raw_post)
      render json: { 'msg': 'SUBSCRIBE_CREATED' }
    end
  end

  def update; end

  def get
    param! :id, String, required: true
    param! :station_name, String
    param! :bus_number, String
  end

  def delete; end

  private

  def validate_post_body
    body_schema = {
      'type' => 'object',
      'required' => %w[bus_number station direction minutes_before],
      'properties' => {
        'bus_number' => { 'type' => 'string' },
        'station' => { 'type' => 'string' },
        'direction' => { 'type' => 'boolean' },
        'minutes_before' => { 'type' => 'integer' }
      },
      'additionalProperties' => true
    }
    begin
      if JSON::Validator.validate(body_schema, request.raw_post)
        { json: request.raw_post, status: 200 }
      else
        { json: { 'err': 'JSON_VALIDATION_FAILED' }, status: 400 }
      end
    rescue JSON::Schema::ValidationError => e
      e.message
      { json: { 'err': 'JSON_VALIDATION_ERROR' }, status: 500 }
    end
  end
end
