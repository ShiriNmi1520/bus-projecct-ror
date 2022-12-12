require 'json-schema'
class SubscribeController < ApplicationController
  def create
    @subscribe = Subscribe.new(create_subscribe_body)
  end

  def update; end

  def get
    param! :id, String, required: true
    param! :station_name, String
    param! :bus_number, String
  end

  def delete; end

  private

  def post_body
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
    JSON.validate(body_schema, request.raw_post)
  end
end
