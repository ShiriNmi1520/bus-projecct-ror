require 'json-schema'
require 'json'
class SubscribeController < ApplicationController
  respond_to? :js
  def create

    # Validate request body
    _validation_result = validate_post_body
    if _validation_result.as_json['status'] != 200
      render _validation_result
    else
      # Create new subscribe if validate passed
      _subscribe_result = Subscribe.new(request.raw_post)
      render json: { 'msg': 'SUBSCRIBE_CREATED' }
    end
  end

  def update
    _validation_result = validate_update_body
    if _validation_result.as_json['status'] != 200
      render _validation_result
    else
      _update_subscribe_result = Subscribe.update(request.raw_post)
      render json: { 'msg': 'SUBSCRIBE_UPDATED' }
    end
  end

  def get
    param! :id, String, required: true
    param! :station_name, String
    param! :bus_number, String
  end

  def delete; end

  private

  def validate_post_body
    # Schema for request body
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
      # Start validate process
      # If validate passed, return request body with 200 status code
      # Otherwise, return JSON_VALIDATION_FAILED message with 400 status code
      if JSON::Validator.validate(body_schema, request.raw_post)
        { json: request.raw_post, status: 200 }
      else
        { json: { 'err': 'JSON_VALIDATION_FAILED' }, status: 400 }
      end
      # If any exception occurred, return 500 status code
    rescue JSON::Schema::ValidationError => e
      e.message
      { json: { 'err': 'JSON_VALIDATION_ERROR' }, status: 500 }
    end
  end

  def validate_update_body
    body_schema = {
      'type' => 'object',
      'required' => %w[],
      'properties' => {
        'subscribe_id' => { 'type' => 'uuid' },
        'email' => { 'type' => 'string' },
        'client_id' => { 'type' => 'string' },
        'bus_number' => { 'type' => 'string' },
        'station' => { 'type' => 'string' },
        'direction' => { 'type' => 'boolean' },
        'minutes_before' => { 'type' => 'integer' }
      },
      'additionalProperties' => false
    }
    begin
      if JSON::Validator.validate!(body_schema, rqeuest.raw_post)
        { json: request.raw_post, status: 200 }
      else
        { json: { 'err': 'JSON_VALIDATION_FAILED'}, status: 400 }
      end
    rescue JSON::Schema::ValidationError => e
      e.message
      { json: { 'err': 'JSON_VALIDATION_ERROR' }, status: 500}
    end
  end
end
