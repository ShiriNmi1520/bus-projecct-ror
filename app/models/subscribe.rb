require 'securerandom'
class Subscribe < ApplicationRecord
  def new(request)
    subscribe_id = SecureRandom.uuid
    Subscribe.create!(request.raw_post).update_column(:id, subscribe_id)
    { json: { msg: 'SUBSCRIBED_CREATED', id: subscribe_id }, status: 200 }
  end

  def update(_request) ;end
end
