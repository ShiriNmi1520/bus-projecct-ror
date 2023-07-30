require 'securerandom'
class Subscribe < ApplicationRecord
  def new(request)
    subscribe_id = SecureRandom.uuid
    Subscribe.create!(request.raw_post).update_column(:id, subscribe_id)
    { json: { msg: 'SUBSCRIBED_CREATED', id: subscribe_id }, status: 200 }
  end

  def update_subscribe(request)
    exist_record = Subscribe.find(request.as_json['subscribe_id'])
    exist_record.update!(request.raw_post)
  rescue NotFoundError
    { json: { msg: 'SUBSCRIBE_NOT_FOUND', id: request.as_json['subscribe_id'] }, status: 404 }
  rescue ActiveRecordError
    { json: { msg: 'UPDATE_SUBSCRIBE_ERROR', id: request.as_json['subscribe_id'] }, status: 500 }
  end
end
